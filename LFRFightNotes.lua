--[[
  LFRFightNotes — tiny Midnight LFR fight-tip helper.
  Slash: /lfrtips  /fightnote
  Copy: EditBox highlight (Ctrl+C) — Retail has no general OS clipboard write for addons.
]]

local ADDON = ...
local Data = LFRFightNotesData

local frame
local raidDrop, bossDrop
local tipsBox
local statusText
local selectedRaidIndex = 1
local selectedBossIndex = 1
local autoBoss -- set when ENCOUNTER_START matches

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
      statusText:SetText("|cffaaaaaaPick a raid/boss, or enter combat for auto-detect.|r")
    end
  end
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
            UIDropDownMenu_SetText(raidDrop, raid.name)
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
  for i, raid in ipairs(Data.raids) do
    info.text = raid.name
    info.value = i
    info.checked = (i == selectedRaidIndex)
    info.func = function(_, arg1)
      selectedRaidIndex = arg1
      selectedBossIndex = 1
      UIDropDownMenu_SetText(raidDrop, Data.raids[arg1].name)
      local b = GetBoss()
      UIDropDownMenu_SetText(bossDrop, b and b.name or "Boss")
      RefreshTips()
    end
    info.arg1 = i
    UIDropDownMenu_AddButton(info, level)
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

local function CreateUI()
  if frame then return frame end

  frame = CreateFrame("Frame", "LFRFightNotesFrame", UIParent, "BasicFrameTemplateWithInset")
  frame:SetSize(420, 360)
  frame:SetPoint("CENTER")
  frame:SetMovable(true)
  frame:EnableMouse(true)
  frame:RegisterForDrag("LeftButton")
  frame:SetScript("OnDragStart", frame.StartMoving)
  frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
  frame:Hide()
  tinsert(UISpecialFrames, "LFRFightNotesFrame")

  frame.TitleText:SetText("LFR Fight Notes")

  -- Raid dropdown
  local raidLabel = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  raidLabel:SetPoint("TOPLEFT", 16, -32)
  raidLabel:SetText("Raid")

  raidDrop = CreateFrame("Frame", "LFRFightNotesRaidDrop", frame, "UIDropDownMenuTemplate")
  raidDrop:SetPoint("TOPLEFT", raidLabel, "BOTTOMLEFT", -16, -2)
  UIDropDownMenu_SetWidth(raidDrop, 200)
  UIDropDownMenu_Initialize(raidDrop, RaidDropdown_Initialize)
  UIDropDownMenu_SetText(raidDrop, Data.raids[1].name)

  -- Boss dropdown
  local bossLabel = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  bossLabel:SetPoint("TOPLEFT", raidDrop, "BOTTOMLEFT", 16, -4)
  bossLabel:SetText("Boss")

  bossDrop = CreateFrame("Frame", "LFRFightNotesBossDrop", frame, "UIDropDownMenuTemplate")
  bossDrop:SetPoint("TOPLEFT", bossLabel, "BOTTOMLEFT", -16, -2)
  UIDropDownMenu_SetWidth(bossDrop, 200)
  UIDropDownMenu_Initialize(bossDrop, BossDropdown_Initialize)
  UIDropDownMenu_SetText(bossDrop, Data.raids[1].bosses[1].name)

  statusText = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  statusText:SetPoint("TOPLEFT", bossDrop, "BOTTOMLEFT", 16, -4)
  statusText:SetPoint("RIGHT", frame, "RIGHT", -16, 0)
  statusText:SetJustifyH("LEFT")
  statusText:SetText("|cffaaaaaaPick a raid/boss, or enter combat for auto-detect.|r")

  -- Scrollable tips editbox for Ctrl+C copy
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
  tipsBox:SetWidth(360)
  tipsBox:SetAutoFocus(false)
  tipsBox:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
  tipsBox:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
  scroll:SetScrollChild(tipsBox)

  local copyBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
  copyBtn:SetSize(100, 24)
  copyBtn:SetPoint("BOTTOMLEFT", 16, 12)
  copyBtn:SetText("Copy")
  copyBtn:SetScript("OnClick", function()
    tipsBox:SetFocus()
    tipsBox:HighlightText()
    Print("Tips selected — press |cffffff00Ctrl+C|r to copy, then paste in chat.")
  end)

  local closeBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
  closeBtn:SetSize(80, 24)
  closeBtn:SetPoint("BOTTOMRIGHT", -16, 12)
  closeBtn:SetText("Close")
  closeBtn:SetScript("OnClick", function() frame:Hide() end)

  local detectBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
  detectBtn:SetSize(120, 24)
  detectBtn:SetPoint("BOTTOM", 0, 12)
  detectBtn:SetText("Use Detected")
  detectBtn:SetScript("OnClick", function()
    if autoBoss then
      SelectBossObject(autoBoss)
      Print("Showing tips for " .. autoBoss.name)
    else
      -- Try EJ / encounter journal current encounter if available
      local name
      if C_EncounterJournal and C_EncounterJournal.GetCurrentEncounter then
        -- not always present; fall through
      end
      if EJ_GetCurrentInstance and EJ_GetEncounterInfo then
        -- leave to ENCOUNTER_START primarily
      end
      Print("No encounter detected yet. Pick a boss from the dropdown.")
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
    -- Prefer auto-detected boss when opening
    if autoBoss then
      SelectBossObject(autoBoss)
    else
      RefreshTips()
    end
    frame:Show()
  end
end

local function TryDetectFromEncounter(encounterID, encounterName)
  local boss = Data:FindBoss(encounterName)
  if boss then
    autoBoss = boss
    if frame and frame:IsShown() then
      SelectBossObject(boss)
    end
    Print("Detected |cffffff00" .. boss.name .. "|r — /lfrtips to view & copy.")
    return true
  end
  return false
end

-- Events
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("ENCOUNTER_START")
eventFrame:RegisterEvent("ENCOUNTER_END")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:SetScript("OnEvent", function(self, event, ...)
  if event == "ADDON_LOADED" then
    local name = ...
    if name ~= "LFRFightNotes" then return end
    LFRFightNotesDB = LFRFightNotesDB or {}
    Print("Loaded. Type |cffffff00/lfrtips|r or |cffffff00/fightnote|r")
  elseif event == "ENCOUNTER_START" then
    local encounterID, encounterName = ...
    TryDetectFromEncounter(encounterID, encounterName)
  elseif event == "ENCOUNTER_END" then
    -- keep last autoBoss so user can still copy mid/post fight
  elseif event == "PLAYER_ENTERING_WORLD" then
    -- Soft detect via boss frames / unit name when already in combat
    if UnitExists("boss1") then
      local n = UnitName("boss1")
      if n then TryDetectFromEncounter(nil, n) end
    end
  end
end)

-- Also watch boss unit updates while in a raid instance
local bossWatcher = CreateFrame("Frame")
bossWatcher:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT")
bossWatcher:SetScript("OnEvent", function()
  for i = 1, 5 do
    local unit = "boss" .. i
    if UnitExists(unit) then
      local n = UnitName(unit)
      if n and Data:FindBoss(n) then
        TryDetectFromEncounter(nil, n)
        return
      end
    end
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
