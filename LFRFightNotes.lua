--[[
  LFRFightNotes — Midnight LFR + Mythic+ Season 2 fight-tip helper.
  Slash: /lfrtips  /fightnote
  Send Chat: posts one line at a time (WoW ~255 char chat cap).
  Copy: EditBox highlight (Ctrl+C) for Discord/etc.
]]

local ADDON = ...
local Data = LFRFightNotesData

local frame
local raidDrop, bossDrop
local tipsBox
local statusText
local selectedRaidIndex = 1
local selectedBossIndex = 1
local autoBoss -- set when detect matches
local lastEncounterName
local lastEncounterID
local lastAutoOpenEncounter -- avoid spam-opening UI
local pollTicker

local function Print(msg)
  DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88LFRFightNotes|r: " .. tostring(msg))
end

local function GetRaid(i)
  return Data.raids[i or selectedRaidIndex]
end

local function GetBoss(ri, bi)
  local raid = GetRaid(ri)
  if not raid then return nil end
  return raid.bosses[bi or selectedBossIndex]
end

local function DisplayRaidName(raid)
  if not raid then return "Raid / Dungeon" end
  if raid.category == "mythicplus" then
    return "M+ " .. raid.name
  end
  return raid.name
end

-- WoW chat is ~255 chars. Send one line at a time to LFR/raid/party.
local MAX_CHAT = 255
local SEND_GAP = 0.45
local sending = false

local function GetChatType()
  if IsInGroup(LE_PARTY_CATEGORY_INSTANCE) then
    return "INSTANCE_CHAT"
  elseif IsInRaid() then
    return "RAID"
  elseif IsInGroup() then
    return "PARTY"
  end
  return nil
end

local function ChatLabel(chatType)
  if chatType == "INSTANCE_CHAT" then return "instance chat" end
  if chatType == "RAID" then return "raid" end
  if chatType == "PARTY" then return "party" end
  return chatType
end

local function SplitForChat(text)
  local lines = {}
  for raw in string.gmatch(text or "", "[^\n]+") do
    local line = raw:match("^%s*(.-)%s*$")
    if line and line ~= "" then
      while #line > MAX_CHAT do
        table.insert(lines, line:sub(1, MAX_CHAT))
        line = line:sub(MAX_CHAT + 1)
      end
      table.insert(lines, line)
    end
  end
  return lines
end

local function SendTipsToChat()
  local boss = GetBoss()
  if not boss then
    Print("No boss selected.")
    return
  end
  local chatType = GetChatType()
  if not chatType then
    Print("Not in a group. Join LFR/party/raid first, or use Copy + Ctrl+C.")
    return
  end
  if sending then
    Print("Already sending — wait a moment.")
    return
  end
  local lines = SplitForChat(boss.tips)
  local tag = (boss.category == "mythicplus") and "M+" or "LFR"
  table.insert(lines, 1, string.format("[%s] %s — %s", tag, boss.raidName, boss.name))
  sending = true
  for i, line in ipairs(lines) do
    C_Timer.After((i - 1) * SEND_GAP, function()
      SendChatMessage(line, chatType)
      if i == #lines then
        sending = false
        Print("Sent " .. #lines .. " lines to " .. ChatLabel(chatType) .. ".")
      end
    end)
  end
end

local function RefreshTips()
  if not tipsBox then return end
  local boss = GetBoss()
  if boss then
    tipsBox:SetText(Data:FormatTips(boss))
    tipsBox:SetCursorPosition(0)
  else
    tipsBox:SetText("")
  end
  if statusText then
    if autoBoss and boss and autoBoss.name == boss.name then
      statusText:SetText("|cff00ff00Auto-detected:|r " .. boss.name)
    else
      statusText:SetText("|cffaaaaaaPick a raid/dungeon + boss, or enter combat for auto-detect.|r")
    end
  end
end

local function SelectRaidObject(raid, preferBossIndex)
  if not raid then return end
  for ri, r in ipairs(Data.raids) do
    if r.id == raid.id then
      selectedRaidIndex = ri
      selectedBossIndex = preferBossIndex or 1
      if raidDrop then
        UIDropDownMenu_SetText(raidDrop, DisplayRaidName(r))
      end
      local b = GetBoss()
      if bossDrop then
        UIDropDownMenu_SetText(bossDrop, b and b.name or "Boss")
      end
      RefreshTips()
      return true
    end
  end
  return false
end

local function SelectBossObject(boss)
  if not boss then return end
  for ri, raid in ipairs(Data.raids) do
    if raid.id == boss.raidId then
      for bi, b in ipairs(raid.bosses) do
        if b.name == boss.name then
          selectedRaidIndex = ri
          selectedBossIndex = bi
          if raidDrop then
            UIDropDownMenu_SetText(raidDrop, DisplayRaidName(raid))
          end
          if bossDrop then
            UIDropDownMenu_SetText(bossDrop, b.name)
          end
          RefreshTips()
          return
        end
      end
    end
  end
end

local function RaidDropdown_Initialize(self, level)
  local info = UIDropDownMenu_CreateInfo()

  -- LFR section
  info.text = "── LFR ──"
  info.isTitle = true
  info.notCheckable = true
  UIDropDownMenu_AddButton(info, level)

  for i, raid in ipairs(Data.raids) do
    if raid.category ~= "mythicplus" then
      info = UIDropDownMenu_CreateInfo()
      info.text = raid.name
      info.value = i
      info.checked = (i == selectedRaidIndex)
      info.func = function(_, arg1)
        selectedRaidIndex = arg1
        selectedBossIndex = 1
        UIDropDownMenu_SetText(raidDrop, DisplayRaidName(Data.raids[arg1]))
        local b = GetBoss()
        UIDropDownMenu_SetText(bossDrop, b and b.name or "Boss")
        RefreshTips()
      end
      info.arg1 = i
      UIDropDownMenu_AddButton(info, level)
    end
  end

  -- Mythic+ section
  info = UIDropDownMenu_CreateInfo()
  info.text = "── Mythic+ ──"
  info.isTitle = true
  info.notCheckable = true
  UIDropDownMenu_AddButton(info, level)

  for i, raid in ipairs(Data.raids) do
    if raid.category == "mythicplus" then
      info = UIDropDownMenu_CreateInfo()
      info.text = "M+ " .. raid.name
      info.value = i
      info.checked = (i == selectedRaidIndex)
      info.func = function(_, arg1)
        selectedRaidIndex = arg1
        selectedBossIndex = 1
        UIDropDownMenu_SetText(raidDrop, DisplayRaidName(Data.raids[arg1]))
        local b = GetBoss()
        UIDropDownMenu_SetText(bossDrop, b and b.name or "Boss")
        RefreshTips()
      end
      info.arg1 = i
      UIDropDownMenu_AddButton(info, level)
    end
  end
end

local function BossDropdown_Initialize(self, level)
  local raid = GetRaid()
  if not raid then return end
  local info = UIDropDownMenu_CreateInfo()
  for i, boss in ipairs(raid.bosses) do
    info.text = boss.name
    info.value = i
    info.checked = (i == selectedBossIndex)
    info.func = function(_, arg1)
      selectedBossIndex = arg1
      UIDropDownMenu_SetText(bossDrop, raid.bosses[arg1].name)
      RefreshTips()
    end
    info.arg1 = i
    UIDropDownMenu_AddButton(info, level)
  end
end

---------------------------------------------------------------------------
-- Auto-detect
---------------------------------------------------------------------------

local function ApplyDetectedBoss(boss, source, autoOpen)
  if not boss then return false end
  local isNew = (not autoBoss) or (autoBoss.name ~= boss.name) or (autoBoss.raidId ~= boss.raidId)
  autoBoss = boss
  if frame and frame:IsShown() then
    SelectBossObject(boss)
  end
  if isNew then
    Print("Detected |cffffff00" .. boss.name .. "|r (" .. (source or "auto") .. ") — /lfrtips to view.")
    if autoOpen and lastAutoOpenEncounter ~= boss.name then
      lastAutoOpenEncounter = boss.name
      if not (frame and frame:IsShown()) then
        -- Soft open once per encounter so tips are visible without spam
        CreateUI()
        SelectBossObject(boss)
        frame:Show()
      end
    end
  end
  return true
end

local function TryDetectFromEncounter(encounterID, encounterName, autoOpen)
  if encounterID then
    lastEncounterID = encounterID
  end
  if encounterName and encounterName ~= "" then
    lastEncounterName = encounterName
  end

  local boss
  if encounterID then
    boss = Data:FindBossByEncounterId(encounterID)
  end
  if not boss and encounterName then
    boss = Data:FindBoss(encounterName)
  end
  if boss then
    return ApplyDetectedBoss(boss, encounterName or ("id " .. tostring(encounterID)), autoOpen)
  end
  return false
end

local function ScanBossUnits()
  for i = 1, 5 do
    local unit = "boss" .. i
    if UnitExists(unit) then
      local n = UnitName(unit)
      if n then
        local boss = Data:FindBoss(n)
        if boss then
          lastEncounterName = n
          return ApplyDetectedBoss(boss, "boss" .. i, true)
        end
      end
    end
  end
  -- Target / focus fallback (sometimes useful mid-pull)
  for _, unit in ipairs({ "target", "focus" }) do
    if UnitExists(unit) and UnitCanAttack("player", unit) then
      local n = UnitName(unit)
      if n then
        local boss = Data:FindBoss(n)
        if boss then
          return ApplyDetectedBoss(boss, unit, false)
        end
      end
    end
  end
  return false
end

local function RescanNow()
  -- Prefer last encounter, then live boss frames
  if lastEncounterID or lastEncounterName then
    if TryDetectFromEncounter(lastEncounterID, lastEncounterName, false) then
      return true
    end
  end
  if ScanBossUnits() then
    return true
  end
  return false
end

local function TrySelectInstanceDungeon()
  local name, instanceType, _, _, _, _, _, instanceMapID = GetInstanceInfo()
  if instanceType ~= "party" and instanceType ~= "raid" and instanceType ~= "scenario" then
    -- Still try name match (challenge mode reports party)
  end
  local raid = Data:FindRaidByInstance(name, instanceMapID)
  if raid then
    -- Only change selection if we don't already have a boss from this dungeon detected
    if not autoBoss or autoBoss.raidId ~= raid.id then
      SelectRaidObject(raid, 1)
      Print("In |cffffff00" .. DisplayRaidName(raid) .. "|r — pick a boss or wait for pull.")
    end
    return true
  end
  return false
end

local function StartCombatPoll()
  if pollTicker then return end
  pollTicker = C_Timer.NewTicker(1.5, function()
    if not UnitAffectingCombat("player") and not (C_ChallengeMode and C_ChallengeMode.IsChallengeModeActive and C_ChallengeMode.IsChallengeModeActive()) then
      if pollTicker then
        pollTicker:Cancel()
        pollTicker = nil
      end
      return
    end
    if not autoBoss or not UnitExists("boss1") then
      ScanBossUnits()
    elseif autoBoss then
      -- Re-check boss1 name in case detect was wrong / multi-boss
      local n = UnitName("boss1")
      if n then
        local boss = Data:FindBoss(n)
        if boss and boss.name ~= autoBoss.name then
          ApplyDetectedBoss(boss, "boss1", true)
        end
      end
    end
  end)
end

local function StopCombatPoll()
  if pollTicker then
    pollTicker:Cancel()
    pollTicker = nil
  end
end

function CreateUI()
  if frame then return frame end

  frame = CreateFrame("Frame", "LFRFightNotesFrame", UIParent, "BasicFrameTemplateWithInset")
  frame:SetSize(440, 380)
  frame:SetPoint("CENTER")
  frame:SetMovable(true)
  frame:EnableMouse(true)
  frame:RegisterForDrag("LeftButton")
  frame:SetScript("OnDragStart", frame.StartMoving)
  frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
  frame:Hide()
  tinsert(UISpecialFrames, "LFRFightNotesFrame")

  frame.TitleText:SetText("LFR / M+ Fight Notes")

  local raidLabel = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  raidLabel:SetPoint("TOPLEFT", 16, -32)
  raidLabel:SetText("Raid / Dungeon")

  raidDrop = CreateFrame("Frame", "LFRFightNotesRaidDrop", frame, "UIDropDownMenuTemplate")
  raidDrop:SetPoint("TOPLEFT", raidLabel, "BOTTOMLEFT", -16, -2)
  UIDropDownMenu_SetWidth(raidDrop, 220)
  UIDropDownMenu_Initialize(raidDrop, RaidDropdown_Initialize)
  UIDropDownMenu_SetText(raidDrop, DisplayRaidName(Data.raids[1]))

  local bossLabel = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  bossLabel:SetPoint("TOPLEFT", raidDrop, "BOTTOMLEFT", 16, -4)
  bossLabel:SetText("Boss")

  bossDrop = CreateFrame("Frame", "LFRFightNotesBossDrop", frame, "UIDropDownMenuTemplate")
  bossDrop:SetPoint("TOPLEFT", bossLabel, "BOTTOMLEFT", -16, -2)
  UIDropDownMenu_SetWidth(bossDrop, 220)
  UIDropDownMenu_Initialize(bossDrop, BossDropdown_Initialize)
  UIDropDownMenu_SetText(bossDrop, Data.raids[1].bosses[1].name)

  statusText = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  statusText:SetPoint("TOPLEFT", bossDrop, "BOTTOMLEFT", 16, -4)
  statusText:SetPoint("RIGHT", frame, "RIGHT", -16, 0)
  statusText:SetJustifyH("LEFT")
  statusText:SetText("|cffaaaaaaPick a raid/dungeon + boss, or enter combat for auto-detect.|r")

  local scroll = CreateFrame("ScrollFrame", "LFRFightNotesScroll", frame, "UIPanelScrollFrameTemplate")
  scroll:SetPoint("TOPLEFT", statusText, "BOTTOMLEFT", 0, -8)
  scroll:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -32, 48)

  local bg = CreateFrame("Frame", nil, frame, "BackdropTemplate")
  bg:SetPoint("TOPLEFT", scroll, "TOPLEFT", -4, 4)
  bg:SetPoint("BOTTOMRIGHT", scroll, "BOTTOMRIGHT", 4, -4)
  bg:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true, tileSize = 16, edgeSize = 12,
    insets = { left = 3, right = 3, top = 3, bottom = 3 },
  })
  bg:SetBackdropColor(0, 0, 0, 0.8)
  bg:SetFrameLevel(scroll:GetFrameLevel() - 1)

  tipsBox = CreateFrame("EditBox", "LFRFightNotesTipsBox", scroll)
  tipsBox:SetMultiLine(true)
  tipsBox:SetFontObject(GameFontHighlight)
  tipsBox:SetWidth(380)
  tipsBox:SetAutoFocus(false)
  tipsBox:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
  tipsBox:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
  scroll:SetScrollChild(tipsBox)

  local copyBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
  copyBtn:SetSize(72, 24)
  copyBtn:SetPoint("BOTTOMLEFT", 12, 12)
  copyBtn:SetText("Copy")
  copyBtn:SetScript("OnClick", function()
    tipsBox:SetFocus()
    tipsBox:HighlightText()
    Print("Tips selected — press |cffffff00Ctrl+C|r to copy.")
  end)

  local sendBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
  sendBtn:SetSize(96, 24)
  sendBtn:SetPoint("LEFT", copyBtn, "RIGHT", 6, 0)
  sendBtn:SetText("Send Chat")
  sendBtn:SetScript("OnClick", SendTipsToChat)

  local closeBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
  closeBtn:SetSize(72, 24)
  closeBtn:SetPoint("BOTTOMRIGHT", -12, 12)
  closeBtn:SetText("Close")
  closeBtn:SetScript("OnClick", function() frame:Hide() end)

  local detectBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
  detectBtn:SetSize(110, 24)
  detectBtn:SetPoint("RIGHT", closeBtn, "LEFT", -6, 0)
  detectBtn:SetText("Use Detected")
  detectBtn:SetScript("OnClick", function()
    if RescanNow() and autoBoss then
      SelectBossObject(autoBoss)
      Print("Showing tips for " .. autoBoss.name)
    elseif autoBoss then
      SelectBossObject(autoBoss)
      Print("Showing tips for " .. autoBoss.name)
    else
      TrySelectInstanceDungeon()
      Print("No boss detected yet. Pick from the dropdown, or pull the boss.")
    end
  end)

  RefreshTips()
  return frame
end

local function ToggleUI()
  CreateUI()
  if frame:IsShown() then
    frame:Hide()
  else
    if autoBoss then
      SelectBossObject(autoBoss)
    else
      TrySelectInstanceDungeon()
      RefreshTips()
    end
    frame:Show()
  end
end

-- Events
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("ENCOUNTER_START")
eventFrame:RegisterEvent("ENCOUNTER_END")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT")
eventFrame:RegisterEvent("PLAYER_REGEN_DISABLED")
eventFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
eventFrame:RegisterEvent("CHALLENGE_MODE_START")
eventFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")

eventFrame:SetScript("OnEvent", function(self, event, ...)
  if event == "ADDON_LOADED" then
    local name = ...
    if name ~= "LFRFightNotes" then return end
    LFRFightNotesDB = LFRFightNotesDB or {}
    Print("Loaded v1.2.0 (LFR + M+). Type |cffffff00/lfrtips|r or |cffffff00/fightnote|r")

  elseif event == "ENCOUNTER_START" then
    local encounterID, encounterName = ...
    TryDetectFromEncounter(encounterID, encounterName, true)
    StartCombatPoll()

  elseif event == "ENCOUNTER_END" then
    -- keep last autoBoss so user can still copy mid/post fight
    lastAutoOpenEncounter = nil

  elseif event == "INSTANCE_ENCOUNTER_ENGAGE_UNIT" then
    ScanBossUnits()
    StartCombatPoll()

  elseif event == "PLAYER_REGEN_DISABLED" then
    ScanBossUnits()
    StartCombatPoll()

  elseif event == "PLAYER_REGEN_ENABLED" then
    StopCombatPoll()

  elseif event == "CHALLENGE_MODE_START" then
    C_Timer.After(0.5, function()
      TrySelectInstanceDungeon()
      StartCombatPoll()
    end)

  elseif event == "PLAYER_ENTERING_WORLD" or event == "ZONE_CHANGED_NEW_AREA" then
    C_Timer.After(0.8, function()
      TrySelectInstanceDungeon()
      if UnitExists("boss1") then
        ScanBossUnits()
      end
      if UnitAffectingCombat("player") or (C_ChallengeMode and C_ChallengeMode.IsChallengeModeActive and C_ChallengeMode.IsChallengeModeActive()) then
        StartCombatPoll()
      end
    end)
  end
end)

SLASH_LFRFIGHTNOTES1 = "/lfrtips"
SLASH_LFRFIGHTNOTES2 = "/fightnote"
SlashCmdList["LFRFIGHTNOTES"] = function(msg)
  msg = (msg or ""):match("^%s*(.-)%s*$") or ""
  if msg == "" then
    ToggleUI()
    return
  end
  local cmd = msg:lower()
  if cmd == "send" or cmd == "post" or cmd == "chat" then
    CreateUI()
    if autoBoss then
      SelectBossObject(autoBoss)
    end
    SendTipsToChat()
    return
  end
  if cmd == "detect" or cmd == "scan" then
    if RescanNow() and autoBoss then
      CreateUI()
      SelectBossObject(autoBoss)
      frame:Show()
      Print("Detected " .. autoBoss.name)
    else
      TrySelectInstanceDungeon()
      Print("No boss unit found. Are you in combat on a known boss?")
    end
    return
  end
  local boss = Data:FindBoss(msg)
  if boss then
    CreateUI()
    SelectBossObject(boss)
    frame:Show()
    Print("Showing " .. boss.name)
  else
    Print("Unknown boss. Open UI with /lfrtips and pick from the list.")
    ToggleUI()
  end
end
