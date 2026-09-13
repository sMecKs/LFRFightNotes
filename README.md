# LFRFightNotes

Tiny World of Warcraft **Retail (Midnight)** addon with short LFR fight tips for:

1. **The Venomous Abyss**
2. **The Voidspire**
3. **The Dreamrift**
4. **March on Quel'Danas**
5. **Sporefall**

No Ace3. Just a TOC + Lua. Repo root **is** the addon root (`LFRFightNotes.toc` lives at the repository root).

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

## Usage

- Slash commands: **`/lfrtips`** or **`/fightnote`**
- Optional: `/lfrtips <boss name>` to jump to a boss (partial/normalized match)
- UI: pick **Raid** and **Boss** from the dropdowns
- **Auto-detect**: on `ENCOUNTER_START` / boss units, the addon selects the matching boss when possible
- **Send Chat** (recommended): while in LFR/party/raid, click **Send Chat**. The addon posts one short line at a time so nothing gets clipped (WoW chat is ~255 characters). Same thing from slash: `/lfrtips send`
- **Copy**: still there for Discord/etc — click **Copy**, then **Ctrl+C**. Don't paste the whole block into WoW chat.

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

**Do not** zip so that `.toc` sits at the zip root without the folder — CurseForge / clients expect `AddOns/LFRFightNotes/*.toc`.

Because this git repo’s root *is* the addon root, from a checkout:

```bash
mkdir -p dist/LFRFightNotes
cp LFRFightNotes.toc Data.lua LFRFightNotes.lua README.md dist/LFRFightNotes/
cd dist && zip -r LFRFightNotes.zip LFRFightNotes
```

## Interface

`## Interface: 120100` (Midnight patch **12.1.0** / Curse of Ula’tek era, Sep 2026).

## License

All rights reserved unless otherwise noted. Fight tips are community LFR reminders, not a substitute for full guides.
