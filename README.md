# LFRFightNotes

Tiny World of Warcraft **Retail (Midnight)** addon with short fight tips for **LFR raids** and **Mythic+ Season 2** dungeons.

No Ace3. Just a TOC + Lua. Repo root **is** the addon root (`LFRFightNotes.toc` lives at the repository root).

## Content (v1.2.0)

### LFR raids
1. **The Venomous Abyss**
2. **The Voidspire**
3. **The Dreamrift**
4. **March on Quel'Danas**
5. **Sporefall**

### Mythic+ Season 2
1. **Altar of Fangs** (3) — Rav'i, The Writhing Coil, Zul'jan
2. **Murder Row** (4) — Kystia Manaheart, Zaen Bladesorrow, Xathuux, Lithiel Cinderfury
3. **Den of Nalorakk** (3) — The Hoardmonger, Sentinel of Winter, Nalorakk
4. **The Blinding Vale** (4) — Lightblossom Trinity, Ikuzz, Lightwarden Ruia, Ziekket
5. **Voidscar Arena** (3) — Taz'Rah, Atroxus, Charonus
6. **Kings' Rest** (4) — Golden Serpent, Mchimba, Council of Tribes, Dazar
7. **Temple of Sethraliss** (4) — Adderis & Aspix, Merektha, Galvazzt, Avatar
8. **Ruby Life Pools** (3) — Melidrussa, Kokia, Kyrakka & Erkhart

## Install

Copy the **`LFRFightNotes`** folder into:

```text
World of Warcraft/_retail_/Interface/AddOns/LFRFightNotes/
```

That folder must contain `LFRFightNotes.toc`, `Data.lua`, and `LFRFightNotes.lua` (and this README is optional in-game).

If you clone this repo, either:

- rename/clone into `Interface/AddOns/LFRFightNotes`, or
- copy the repo contents into `Interface/AddOns/LFRFightNotes/`.

Then `/reload` or restart the client.

**Updating:** download/replace the whole `LFRFightNotes` folder (or `git pull`), then `/reload`.

## Usage

- Slash commands: **`/lfrtips`** or **`/fightnote`**
- Optional: `/lfrtips <boss name>` to jump to a boss (partial/normalized match)
- `/lfrtips send` — post tips to party/raid/instance chat (one line at a time)
- `/lfrtips detect` — re-scan boss frames / last encounter
- UI: pick **Raid / Dungeon** (LFR + M+ sections) and **Boss**
- **Auto-detect**:
  - `ENCOUNTER_START` (name + optional encounter ID)
  - `INSTANCE_ENCOUNTER_ENGAGE_UNIT` + periodic boss1–5 poll in combat / M+
  - `CHALLENGE_MODE_START` / entering a known dungeon pre-selects that dungeon
  - Opening `/lfrtips` inside a key maps the instance to the M+ dropdown when possible
- **Send Chat** (recommended): posts one short line at a time (~255 char WoW chat cap)
- **Copy**: click **Copy**, then **Ctrl+C** for Discord/etc.

## CurseForge packaging

Zip so the **archive root contains a `LFRFightNotes/` folder** with the addon files inside:

```text
LFRFightNotes.zip
└── LFRFightNotes/
    ├── LFRFightNotes.toc
    ├── Data.lua
    ├── LFRFightNotes.lua
    └── README.md   (optional)
```

Because this git repo’s root *is* the addon root, from a checkout:

```bash
mkdir -p dist/LFRFightNotes
cp LFRFightNotes.toc Data.lua LFRFightNotes.lua README.md dist/LFRFightNotes/
cd dist && zip -r LFRFightNotes.zip LFRFightNotes
```

## Interface

`## Interface: 120100` (Midnight patch **12.1.0** / Curse of Ula’tek era, Sep 2026).

## License

All rights reserved unless otherwise noted. Fight tips are community LFR/M+ reminders, not a substitute for full guides.
