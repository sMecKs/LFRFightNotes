--[[
  LFRFightNotes — boss tip data for Midnight LFR raids + Mythic+ Season 2 (Sep 2026 / 12.1).
  Tips are short essentials only (LFR / M+ reminder style).
]]

LFRFightNotesData = {
  raids = {
    ---------------------------------------------------------------------------
    -- LFR raids
    ---------------------------------------------------------------------------
    {
      id = "venomous_abyss",
      name = "The Venomous Abyss",
      category = "lfr",
      instanceNames = { "The Venomous Abyss", "Venomous Abyss" },
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
          encounterNames = { "The Coiled Altar", "Malacras", "Malacrass" },
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
      category = "lfr",
      instanceNames = { "The Voidspire", "Voidspire" },
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
      category = "lfr",
      instanceNames = { "The Dreamrift", "Dreamrift" },
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
      category = "lfr",
      instanceNames = { "March on Quel'Danas", "Quel'Danas", "Quel Danas" },
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
      category = "lfr",
      instanceNames = { "Sporefall" },
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

    ---------------------------------------------------------------------------
    -- Mythic+ Season 2
    ---------------------------------------------------------------------------
    {
      id = "altar_of_fangs",
      name = "Altar of Fangs",
      category = "mythicplus",
      instanceNames = { "Altar of Fangs" },
      bosses = {
        {
          name = "Rav'i",
          encounterNames = { "Rav'i", "Ravi" },
          tips = [[TANK: Hold boss away from Fresh Meat on Carrion Piles.
HEAL: Spread Triple Shot; ramp while boss is eating (Carrion Burst stacks).
DPS: Break Ssscavenging / Feeding Frenzy absorb shield ASAP.
ALL: Dodge Regurgitate acid waves; soak Messy Eater meat chunks.
Don't let boss eat Fresh Meat piles — Feeding Frenzy is much worse.]],
        },
        {
          name = "The Writhing Coil",
          encounterNames = { "The Writhing Coil", "Writhing Coil" },
          tips = [[TANK: Defensive for Tail Scythe; dodge Burrowing Charge / Venom Jet.
HEAL: Death Rattle stacks hard until everyone runs out on Vine Grip.
DPS: Interrupt Toxic Atrophy (3 casts in a row); cleave Uncoil snakes.
ALL: When Vine Grip attaches — ALL run away to Uncoil the boss.
Uncoil damage sticks after Assimilation — burn hard while split.]],
        },
        {
          name = "Zul'jan",
          encounterNames = { "Zul'jan", "Zuljan" },
          tips = [[TANK: Face away for Chop Down; help soak Ritual of the Fang beams.
HEAL: Ramp for Ritual Venom soakers; watch Bloodletting pool damage.
DPS: Soak all 4 Ritual beams — empty beams empower the boss hard.
ALL: Clear Ritual Venom by soaking Boneslicer / Axegrinder hits.
Dodge bouncing Axegrinders; don't stand in Bloodletting pools.]],
        },
      },
    },
    {
      id = "murder_row",
      name = "Murder Row",
      category = "mythicplus",
      instanceNames = { "Murder Row" },
      bosses = {
        {
          name = "Kystia Manaheart",
          encounterNames = { "Kystia Manaheart", "Kystia", "Nibbles" },
          tips = [[TANK: Face Nibbles Fel Spray away; interrupt Mirror Image Felstorms.
HEAL: Big heals during Destabilized burn (raid pulses).
DPS: Kill Nibbles while Felshield is up, then burst Destabilized boss.
ALL: Dodge Fel Nova; CC/interrupt Mirror Images casting Felstorm.
Dispel Corroding Spittle when you can.]],
        },
        {
          name = "Zaen Bladesorrow",
          encounterNames = { "Zaen Bladesorrow", "Zaen" },
          tips = [[TANK: Defensive for Envenom / Heartstop Poison.
HEAL: Ramp for Killing Spree; spot-heal Murder in a Row hits.
DPS: Use first Fire Bombs to clear a barrel; save one for cover.
ALL: Hide behind Forbidden Freight for Murder in a Row.
Dodge Same-Day Delivery and Fire Bomb circles.]],
        },
        {
          name = "Xathuux the Annihilator",
          encounterNames = { "Xathuux the Annihilator", "Xanthuux the Annihilator", "Xathuux", "Xanthuux" },
          tips = [[TANK: Face Legion Strike away; kite during Demonic Rage / Burning Steps.
HEAL: Legion Strike cuts healing 80% — top the tank before it.
DPS: Destroy Axe Toss immediately (stops Fel Lightning stacks).
ALL: Kite boss around the edge during Burning Steps puddles.
Dodge Infernal Crush circles under players.]],
        },
        {
          name = "Lithiel Cinderfury",
          encounterNames = { "Lithiel Cinderfury", "Lithiel" },
          tips = [[TANK: Pick up Vilefiend / Infernal; interrupt Chaos Bolt.
HEAL: Gateway through Malefic Wave — lingering Fire DoT if you miss.
DPS: Kill Imps from Fingers of Gul'dan before Malefic Wave empowers them.
ALL: Use Demonic Gateway to skip Malefic Wave ring safely.
Kill adds before the wave or they gain huge haste.]],
        },
      },
    },
    {
      id = "den_of_nalorakk",
      name = "Den of Nalorakk",
      category = "mythicplus",
      instanceNames = { "Den of Nalorakk" },
      bosses = {
        {
          name = "The Hoardmonger",
          encounterNames = { "The Hoardmonger", "Hoardmonger" },
          tips = [[TANK: Face Earthshatter / Bonespike Slam away from group.
HEAL: Ramp for Ravenous / Hearty Bellow; dispel Toxic Spores.
DPS: Soak Rotten Mushrooms before Putrid Burst (12s fuse).
ALL: On Mythic+, Resourceful Measures upgrades are permanent — plan order.
Typical: meat first, bones second, mushrooms last.]],
        },
        {
          name = "Sentinel of Winter",
          encounterNames = { "Sentinel of Winter" },
          tips = [[TANK: Hold near add corpses to blunt storm push when possible.
HEAL: Dispel Glacial Torment; big heals during Frozen Tempest.
DPS: Kill Fractured Shivercores fast; soak every Rimeshatter shard.
ALL: Stand in the eye of Frozen Tempest — outside = extra damage.
Use Snowdrifts to resist knockback; dodge Raging Squalls.]],
        },
        {
          name = "Nalorakk",
          encounterNames = { "Nalorakk" },
          tips = [[TANK: Soak Forceful Slam near Zul'jarra; hide behind her shield for Onslaught.
HEAL: Big heals on Overwhelming Onslaught even while shielded.
DPS: Place Echoing Maul echoes at edges away from Zul'jarra.
ALL: Intercept charging Echoes during Fury of the War God.
Never let an Echo reach Zul'jarra — Demoralizing Scream stacks wipe.]],
        },
      },
    },
    {
      id = "blinding_vale",
      name = "The Blinding Vale",
      category = "mythicplus",
      instanceNames = { "The Blinding Vale", "Blinding Vale" },
      bosses = {
        {
          name = "Lightblossom Trinity",
          encounterNames = { "Lightblossom Trinity", "Meittik", "Lekshi", "Kezkitt", "Thicket's Trinity" },
          tips = [[TANK: Face Meittik; place Fertile Loam / Bedrock Slam carefully.
HEAL: Bleed from Thornblade; ramp for Lightbloom Overgrowth.
DPS: Shared HP — cleave all three; interrupt Light Bolt.
ALL: Stand IN Lightblossom beams to stop Light-Gorged stacks.
Soak blossoms; dodge Lekshi Lightsower Dash and Fan of Thorns.]],
        },
        {
          name = "Ikuzz the Light Hunter",
          encounterNames = { "Ikuzz the Light Hunter", "Ikuzz" },
          tips = [[TANK: Kite during Bloodthirsty Gaze if you're targeted.
HEAL: Ramp for Verdant Stomp + Thorncaller Roar channel.
DPS: Kill Bloodthorn Roots to free rooted players ASAP.
ALL: Fixate targets run; use roots as obstacles so Ikuzz clips them.
Don't get Incised — stun + huge bleed if he reaches you.]],
        },
        {
          name = "Lightwarden Ruia",
          encounterNames = { "Lightwarden Ruia", "Ruia", "Rootwarden Ruia" },
          tips = [[TANK: Interrupt Warden's Wrath in Moonkin; face Bear carefully.
HEAL: Grievous Thrash only clears at FULL HP — top people fast.
DPS: Spread for Pulverizing Strikes cones (they lock on — don't dodge into allies).
ALL: Drop Lightfire beams away from group; dodge Lightfall impacts.
Below 40%: Spirits of the Vale — all abilities overlap, save CDs.]],
        },
        {
          name = "Ziekket",
          encounterNames = { "Ziekket" },
          tips = [[TANK: Defensive for Thornspike; pick up Lightspawn Lashers.
HEAL: Soak Lightbloom Essence carefully (buff + DoT); raid ticks from Oozing Xylem.
DPS: Kill Lashers to Dormant, then aim Concentrated Lightbeam at corpses.
ALL: Grab Essence orbs before they reach boss (Fluorescent Shield).
Don't let Dormant Lashers reawaken with Vicious Regrowth.]],
        },
      },
    },
    {
      id = "voidscar_arena",
      name = "Voidscar Arena",
      category = "mythicplus",
      instanceNames = { "Voidscar Arena" },
      bosses = {
        {
          name = "Taz'Rah",
          encounterNames = { "Taz'Rah", "TazRah", "Tazrah" },
          tips = [[TANK: Defensive for Void Blast; keep arena readable.
HEAL: Ramp for Dark Bloom; heal Nether Dash DoTs.
DPS: Spread so Ethereal Shade Nether Dash lines don't cleave.
ALL: Dodge Nether Dash lines and Void Fissures from Dark Bloom.
Don't stack Ethereal Shards on the same person (Mythic+).]],
        },
        {
          name = "Atroxus",
          encounterNames = { "Atroxus" },
          tips = [[TANK: Face Noxious Breath away; kite Toxic Creeper if needed.
HEAL: Dispel Mind-Numbing Poison; big heal on Monstrous Roar.
DPS: Kill Toxic Creeper immediately (Toxic Aura is deadly).
ALL: Dodge Poison Splash puddles and Noxious Breath frontal.
Don't stand in poison pools.]],
        },
        {
          name = "Charonus",
          encounterNames = { "Charonus" },
          tips = [[TANK: Hold steady; don't get pulled into Unstable Singularities.
HEAL: Ramp while Condensed Mass stacks on orb targets.
DPS: Pre-assign singularities; kite your Gravitic Orb into one ASAP.
ALL: Don't enter singularities (Atomized = can't act).
Dodge Cosmic Crash circles and Void Cascade projectiles.]],
        },
      },
    },
    {
      id = "kings_rest",
      name = "Kings' Rest",
      category = "mythicplus",
      instanceNames = { "Kings' Rest", "King's Rest", "Kings Rest" },
      mapIds = { 1004 },
      bosses = {
        {
          name = "The Golden Serpent",
          encounterNames = { "The Golden Serpent", "Golden Serpent" },
          tips = [[TANK: Hold near edge so Spit Gold puddles drop safely.
HEAL: Ramp for Serpentine Gust channel.
DPS: Kill / CC Animated Gold — never let them reach the boss (Luster).
ALL: Drop Spit Gold puddles together at the edge.
Dodge Molten Gold after Lucre's Call.]],
        },
        {
          name = "Mchimba the Embalmer",
          encounterNames = { "Mchimba the Embalmer", "Mchimba" },
          tips = [[TANK: Interrupt mummy casts; keep boss moving if needed.
HEAL: Top Drain Fluids targets immediately.
DPS: Click the shaking coffin (extra action) to free Entombed players FAST.
ALL: Spread for burn; free allies before they die in coffins.
Interrupt important Embalming casts.]],
        },
        {
          name = "The Council of Tribes",
          encounterNames = { "The Council of Tribes", "Council of Tribes", "Aka'ali the Conqueror", "Kula the Butcher", "Zanazal the Wise", "Aka'ali", "Kula", "Zanazal" },
          tips = [[TANK: Kite after Debilitating Backhand (200% damage taken).
HEAL: Stack for Barrel Through; spot-heal Severing Axe DoTs.
DPS: Interrupt Poison Nova; kill Explosive Totem then Thundering Totem.
ALL: Dodge Whirling Axes; stack for Barrel Through.
Call of the Elements — totems are priority.]],
        },
        {
          name = "Dazar, the First King",
          encounterNames = { "Dazar, the First King", "Dazar, The First King", "King Dazar", "Dazar" },
          tips = [[TANK: Defensive for Blade Combo + Savage Maul; face away during Gilded Destruction.
HEAL: Big CDs for Gilded Destruction; triage bleeds all fight.
DPS: Kill Reban first; interrupt Deathly Roar; cleave T'zala after 80%.
ALL: Spread Aerial Smash / Quaking Leap circles; dodge Impaling Spears.
Don't get feared into spears.]],
        },
      },
    },
    {
      id = "temple_of_sethraliss",
      name = "Temple of Sethraliss",
      category = "mythicplus",
      instanceNames = { "Temple of Sethraliss" },
      mapIds = { 1039 },
      bosses = {
        {
          name = "Adderis and Aspix",
          encounterNames = { "Adderis and Aspix", "Adderis & Aspix", "Adderis", "Aspix" },
          tips = [[TANK: Tank both; defensive when Adderis Overloads.
HEAL: Stack after Gale Force for Thunder and Lightning soak.
DPS: Only hit the unshielded boss (Storm Blessed = immune).
ALL: Spread for Gale Force knockback (use walls); then STACK for soak.
Drop Tempest Winds puddles at edges. Aspix frenzies when Adderis dies.]],
        },
        {
          name = "Merektha",
          encounterNames = { "Merektha" },
          tips = [[TANK: Face away; kite during Burrow if needed.
HEAL: Dispel / cleanse poison; top Knot of Snakes victims.
DPS: Interrupt Poison Spit; free players from A Knot of Snakes; kill burrow snakes.
ALL: Drop poison puddles at edges; don't stand in them.
CC the blue-arrow stun target together when possible.]],
        },
        {
          name = "Galvazzt",
          encounterNames = { "Galvazzt" },
          tips = [[TANK: Drag boss out of Induction puddles.
HEAL: Spot-heal Lightning Spire soakers.
DPS: Non-tanks rotate soaking Lightning Spires (use defensives).
ALL: Don't let spires channel freely into the boss.
Assign soak order before pull.]],
        },
        {
          name = "Avatar of Sethraliss",
          encounterNames = { "Avatar of Sethraliss", "Avatar" },
          tips = [[TANK: Pick Corrupted Guardians; defensive for Tainted Strike.
HEAL: After Defiling Taint drops — heal Avatar to 100% to win.
DPS: Kill Essence Defilers first; soak Corrupted Lifeforce orbs (DPS soak).
ALL: Interrupt Flame Shock; CC/slow Faithless Tormentors on healer.
Dodge lightning swirls; don't miss purple soaks (Corruption Burst).]],
        },
      },
    },
    {
      id = "ruby_life_pools",
      name = "Ruby Life Pools",
      category = "mythicplus",
      instanceNames = { "Ruby Life Pools" },
      mapIds = { 2095 },
      bosses = {
        {
          name = "Melidrussa Chillworn",
          encounterNames = { "Melidrussa Chillworn", "Melidrussa" },
          tips = [[TANK: Interrupt Frigid Shard to cut tank damage.
HEAL: Ramp for Chillstorm pull-in pulses.
DPS: Stack Hailburst bombs at edge then rotate together; kill Infused Whelps.
ALL: Chillstorm target steps out; break Frost Overload shields at 66%/33%.
Don't scatter hail mines across the room.]],
        },
        {
          name = "Kokia Blazehoof",
          encounterNames = { "Kokia Blazehoof", "Kokia" },
          tips = [[TANK: Face away; defensive for Searing Blows; keep edge space clear.
HEAL: Spot-heal boulder hits; ramp on Ritual of Blazebinding.
DPS: Kill Blazebound Firestorms ASAP; interrupt them; run out 20 yd on Burnout.
ALL: Bait Molten Boulders into safe lanes; place ritual adds carefully.
Don't fill the room with fire.]],
        },
        {
          name = "Kyrakka and Erkhart Stormvein",
          encounterNames = { "Kyrakka and Erkhart Stormvein", "Kyrakka and Erkhart", "Kyrakka", "Erkhart Stormvein", "Erkhart" },
          tips = [[TANK: Face Erkhart away; defensive + call dispel for Stormslam.
HEAL: Dispel Stormslam Nature vuln ASAP; top Inferno Spit targets.
DPS: Priority Kyrakka whenever possible; drop Inferno Spit safely.
ALL: Stop casting for Interrupting Cloudburst; dodge Roaring Firebreath.
Watch Winds of Change push directions; bring Erkhart to Kyrakka when she lands.]],
        },
      },
    },
  },
}

-- Flat lookup by normalized encounter / boss name + encounter ID
LFRFightNotesData.byEncounterName = {}
LFRFightNotesData.byEncounterId = {}
LFRFightNotesData.byInstanceKey = {}

do
  local function norm(s)
    return (s or ""):lower():gsub("[%s%p]+", "")
  end

  for _, raid in ipairs(LFRFightNotesData.raids) do
    raid.category = raid.category or "lfr"
    -- Instance name / mapID → raid index for pre-select
    if raid.instanceNames then
      for _, n in ipairs(raid.instanceNames) do
        LFRFightNotesData.byInstanceKey[norm(n)] = raid
      end
    end
    if raid.mapIds then
      for _, mid in ipairs(raid.mapIds) do
        LFRFightNotesData.byInstanceKey["map:" .. tostring(mid)] = raid
      end
    end

    for _, boss in ipairs(raid.bosses) do
      boss.raidName = raid.name
      boss.raidId = raid.id
      boss.category = raid.category
      LFRFightNotesData.byEncounterName[norm(boss.name)] = boss
      if boss.encounterNames then
        for _, n in ipairs(boss.encounterNames) do
          LFRFightNotesData.byEncounterName[norm(n)] = boss
        end
      end
      if boss.encounterIds then
        for _, eid in ipairs(boss.encounterIds) do
          LFRFightNotesData.byEncounterId[eid] = boss
        end
      end
    end
  end
end

function LFRFightNotesData:NormalizeName(name)
  if not name then return "" end
  -- Strip color codes, normalize curly/smart quotes & apostrophes, then drop punctuation/spaces
  local s = name:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", "")
  s = s:gsub("[\226\128\152\226\128\153\226\128\154\226\128\155']", "'") -- smart quotes → '
  s = s:lower():gsub("[%s%p]+", "")
  return s
end

function LFRFightNotesData:FindBoss(name)
  if not name then return nil end
  local key = self:NormalizeName(name)

  -- Collect exact + partial candidates
  local candidates = {}
  local exact = self.byEncounterName[key]
  if exact then
    table.insert(candidates, exact)
  end
  if #key >= 4 then
    for k, b in pairs(self.byEncounterName) do
      if k ~= key and (k:find(key, 1, true) or key:find(k, 1, true)) then
        local seen = false
        for _, c in ipairs(candidates) do
          if c == b then seen = true break end
        end
        if not seen then table.insert(candidates, b) end
      end
    end
  end
  if #candidates == 0 then return nil end
  if #candidates == 1 then return candidates[1] end

  -- Prefer a boss whose raid matches the current instance
  local iname, _, _, _, _, _, _, mapID = GetInstanceInfo()
  local raid = self:FindRaidByInstance(iname, mapID)
  if raid then
    for _, b in ipairs(candidates) do
      if b.raidId == raid.id then return b end
    end
  end
  return candidates[1]
end

function LFRFightNotesData:FindBossByEncounterId(encounterID)
  if not encounterID then return nil end
  return self.byEncounterId[encounterID]
end

function LFRFightNotesData:FindRaidByInstance(instanceName, mapID)
  if mapID then
    local byMap = self.byInstanceKey["map:" .. tostring(mapID)]
    if byMap then return byMap end
  end
  if instanceName and instanceName ~= "" then
    local key = self:NormalizeName(instanceName)
    local raid = self.byInstanceKey[key]
    if raid then return raid end
    -- Fuzzy instance match
    if #key >= 4 then
      for k, r in pairs(self.byInstanceKey) do
        if type(k) == "string" and not k:find("^map:") then
          if k:find(key, 1, true) or key:find(k, 1, true) then
            return r
          end
        end
      end
    end
  end
  return nil
end

function LFRFightNotesData:FormatTips(boss)
  if not boss then return "" end
  local tag = (boss.category == "mythicplus") and "M+" or "LFR"
  return string.format("[%s] %s — %s\n%s", tag, boss.raidName, boss.name, boss.tips)
end
