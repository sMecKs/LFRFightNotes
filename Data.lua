--[[
  LFRFightNotes — boss tip data for Midnight LFR raids (Sep 2026 / 12.1).
  Tips are short LFR essentials only.
]]

LFRFightNotesData = {
  raids = {
    {
      id = "venomous_abyss",
      name = "The Venomous Abyss",
      bosses = {
        {
          name = "Nek'zali the Soulcoiler",
          encounterNames = { "Nek'zali the Soulcoiler", "Nek'zali" },
          tips = [[TANK: Face boss away; swap on Hollowing Strikes stacks.
HEAL: Ramp for Soulcoil Rite / Soulcoil Ignition raid damage.
DPS: Kill Raised Amani before they reach the center Soulcoil Well.
ALL: Never die in the Well — it empowers the boss.
50%: Break Ritual of Awakening tethers, then burn for Uncoiled Rage.]],
        },
        {
          name = "Entombed Sentinels",
          encounterNames = { "Entombed Sentinels", "Ula'tek's Breath", "Ula'tek's Blood" },
          tips = [[TANK: Keep bosses 40+ yd apart or they take 99% less damage.
HEAL: Soak Unstable Miasma as a group; dispel when you can.
DPS: Split DPS evenly — unequal HP lets Stasis heal the weaker one.
ALL: Stomp Toxic Droplets before they explode.
Helical Toxins: pair so stacks equal exactly 4 to clear safely.]],
        },
        {
          name = "The Lost Explorers",
          encounterNames = { "The Lost Explorers", "Lost Explorers", "Mor'zahi" },
          tips = [[TANK: Never stack all three — United Defense makes them near-immune.
HEAL: Big heals on Mighty Thud soaks and Blink Nova.
DPS: Cleave two bosses; keep all three HP roughly even.
ALL: Feed Grab Fish to break possession before Final Ascension.
Soak Nama's leaps — empty leaps hit the whole raid.]],
        },
        {
          name = "Vashnik the Malignant",
          encounterNames = { "Vashnik the Malignant", "Vashnik" },
          tips = [[TANK: Hold near planned fountains; face away from raid.
HEAL: Damage ramps each Imbibe — save cooldowns for those spikes.
DPS: Kill Living Venom before it reaches the center crevasse.
ALL: Soak Malignant Bile circles; don't leave them empty.
Stagger Fire dispels — each dispel is a raid hit.]],
        },
        {
          name = "Sszorak",
          encounterNames = { "Sszorak" },
          tips = [[TANK: Swap on Corroding Venom; taunt can redirect Apex Predator.
HEAL: Steady raid damage from Ula'tek's Presence + surge spikes.
DPS: Spread for Venomous Surge; place cysts away from group.
ALL: Watch knockback arrows on Crosswinds / Maelstrom.
BURST: Dig In = +30% damage taken — pop cooldowns.]],
        },
        {
          name = "The Twin Fangs",
          encounterNames = { "The Twin Fangs", "Vexhul", "Ithraz" },
          tips = [[TANK: Hold both serpents; swap on Stone Breaker stacks.
HEAL: Track Eternal Venom — high stacks need Ravenous Feast.
DPS: Kill brood from Venomous Emergence ASAP.
ALL: Soak Feast bites to drop Eternal Venom stacks.
Dodge Vile Flood frontal; stack for shared feast damage.]],
        },
        {
          name = "The Coiled Altar",
          encounterNames = { "The Coiled Altar", "Zul'jan", "Malacras" },
          tips = [[TANK: Face Zul'jan/Malacras away — Sever and Soul Sever are cones.
HEAL: Ramp for Fangs of the Coiled Altar and Eternal Nightfall.
DPS: Free Dreadmarch victims before they walk off the edge.
ALL: Avoid poison puddles and growing Blighted Ground.
P2: Break Twilight Veil then interrupt Eternal Nightfall; finish before Soulbinding.]],
        },
        {
          name = "Ula'tek",
          encounterNames = { "Ula'tek" },
          tips = [[TANK: Face away; ready defensives for Mother's Wrath.
HEAL: Big spikes on Spectral Coils, Rage of the Shackled, Circling Prey.
DPS: Kill vipers; don't let Caustic Waves hatch eggs.
ALL: Stack under Spectral Coils to split the crush.
BURST: Rage of the Shackled exposes Venomous Heart — go hard.]],
        },
      },
    },
    {
      id = "voidspire",
      name = "The Voidspire",
      bosses = {
        {
          name = "Imperator Averzian",
          encounterNames = { "Imperator Averzian", "Averzian" },
          tips = [[TANK: Keep boss off claimed tiles (Imperator's Glory = near-immune).
HEAL: Soak Umbral Collapse together to split damage.
DPS: After soak breaks add shields, kill two Voidshapers fast.
ALL: Don't let three adjacent portals link — March of the Endless wipes.
Dodge Oblivion's Wrath spears and Shadow Phalanx lanes.]],
        },
        {
          name = "Vorasius",
          encounterNames = { "Vorasius" },
          tips = [[TANK: Always catch Shadowclaw Slam — a miss is a raid nuke.
HEAL: Heal through Primordial Roar knockback and breath DoTs.
DPS: Kite Blistercreeps into Void Crystals so Blisterburst breaks walls.
ALL: Side-step Void Breath edge-to-edge sweeps.
Someone stay in melee or Overpowering Pulse hurts everyone.]],
        },
        {
          name = "Fallen-King Salhadaar",
          encounterNames = { "Fallen-King Salhadaar", "Salhadaar" },
          tips = [[TANK: Swap on Destabilizing Strikes stacks.
HEAL: Big heals during Entropic Unraveling (also a burn window).
DPS: Destroy Concentrated Void orbs before they reach the boss.
ALL: Interrupt Shadow Fracture on Fractured Images.
Despotic Command targets: spread away from allies.]],
        },
        {
          name = "Vaelgor & Ezzorak",
          encounterNames = { "Vaelgor & Ezzorak", "Vaelgor and Ezzorak", "Vaelgor", "Ezzorak" },
          tips = [[TANK: Keep dragons apart (15+ yd) and HP within ~10%.
HEAL: Grab Radiant Barrier before Midnight Flames breath.
DPS: Balance both dragons; don't let one die way first.
ALL: Dodge Nullbeam / Gloom; interrupt Voidbolt orbs.
Side-step Dread Breath fear cone.]],
        },
        {
          name = "Lightblinded Vanguard",
          encounterNames = { "Lightblinded Vanguard", "Lightblind Vanguard" },
          tips = [[TANK: Point bosses carefully; watch Judgment into Final Verdict.
HEAL: Soak Execution Sentence together; heal through auras.
DPS: Keep all three HP even — kill nearly together (Retribution).
ALL: Move out of Consecration pools after auras end.
Interrupt / CC key casts when shields drop.]],
        },
        {
          name = "Crown of the Cosmos",
          encounterNames = { "Crown of the Cosmos", "Alleria Windrunner", "Alleria" },
          tips = [[TANK: Hold Voidspawn near their portals; stay in melee.
HEAL: Dispel Null Corona carefully (jump absorb); heal Aspect of the End.
DPS: Kill adds before Coalesced Form; focus Rift Simulacrum in P2.
ALL: Use Silverstrike Arrow lines to clear Void effects.
P3: Drop Aspect of the End far from the group; avoid Devouring Cosmos.]],
        },
      },
    },
    {
      id = "dreamrift",
      name = "The Dreamrift",
      bosses = {
        {
          name = "Chimaerus",
          encounterNames = { "Chimaerus" },
          tips = [[ALL: Split raid into two groups (1 tank each) before pull.
SOAK team: Soak Alndust Upheaval, break add shields downstairs.
UPSTAIRS: Kill adds the moment they appear — never let them reach boss.
INTERMISSION: Dodge Corrupted Devastation lines; kill all Manifestations.
Finish adds before Ravenous Dive or they get consumed and wipe you.
Interrupt Fearsome Cry on Haunting Essences.]],
        },
      },
    },
    {
      id = "quel_danas",
      name = "March on Quel'Danas",
      bosses = {
        {
          name = "Belo'ren",
          encounterNames = { "Belo'ren", "Beloren", "Belo'ren, Child of Al'ar" },
          tips = [[ALL: Light/Void feather — only soak mechanics matching your color.
Soak same-color Dives; interrupt matching Ember Eruption casts.
Kill Ember adds, then their eggs as priority.
EGG PHASE: Real HP is the egg — save Lust/CDs for Rebirth.
Stand in floor color that matches your polarity during egg phase.]],
        },
        {
          name = "Midnight Falls",
          encounterNames = { "Midnight Falls" },
          tips = [[ALL: Memorize rune/memory order — stand in that sequence.
Dodge glaives and quasars; interrupt prisms.
Aim Galvanize beams at separate Void Cores.
Soak Light Siphons; hold Dawn Crystals for Dark Archangel.
Intermission: spread a bit, stay in healer range for Eclipsed absorbs.]],
        },
      },
    },
    {
      id = "sporefall",
      name = "Sporefall",
      bosses = {
        {
          name = "Rotmire",
          encounterNames = { "Rotmire" },
          tips = [[TANK: Swap after each Putrid Fist.
HEAL: Big raid heal on Fungal Bloom (100 energy).
DPS: Drag fixated adds to boss; clump deaths for easy Shroom AoE.
ALL: Don't stand in Awaken Fungi spawn circles.
Interrupt Sporecap Poison Burst; run Festering Vines to the edge.
Kill Bursting Shrooms ASAP after Bloom.]],
        },
      },
    },
  },
}

-- Flat lookup by normalized encounter / boss name
LFRFightNotesData.byEncounterName = {}
do
  local function norm(s)
    return (s or ""):lower():gsub("[%s%p]+", "")
  end
  for _, raid in ipairs(LFRFightNotesData.raids) do
    for _, boss in ipairs(raid.bosses) do
      boss.raidName = raid.name
      boss.raidId = raid.id
      LFRFightNotesData.byEncounterName[norm(boss.name)] = boss
      if boss.encounterNames then
        for _, n in ipairs(boss.encounterNames) do
          LFRFightNotesData.byEncounterName[norm(n)] = boss
        end
      end
    end
  end
end

function LFRFightNotesData:FindBoss(name)
  if not name then return nil end
  local key = name:lower():gsub("[%s%p]+", "")
  return self.byEncounterName[key]
end

function LFRFightNotesData:FormatTips(boss)
  if not boss then return "" end
  return string.format("[%s] %s\n%s", boss.raidName, boss.name, boss.tips)
end
