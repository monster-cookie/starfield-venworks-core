# Scene Manager: Overview

This is a smaller scope and quest bound version of Bethesda's radiant quest engine. Scene Manager ties into Story Manager Script Events and uses them and its conditions to decide what radiant quest to spawn on the attached POI.

## Features

Scene manager supports anything you can do with quest reference alias in the POI/Location currently attached to, spawning and controlling the loot of a "boss" chest, Spawning NPCs and Bosses using the MCS spawner system.

### Enabling/Disabling/Spawning Cell Objects

Using reference aliases and markers you can completely redesign and rename a location/poi to match your story telling needs.

### Story Chest

You can provide an important chest in the cell for Scene Manager to manage and a loot list for it to update the chest's contents with.  

### Spawning NPCs (and bosses)

Scene Manager uses the SQ_Groups system so it can spawn NPCs and Bosses.

## Other Documents

- [Known Issues](./KnownIssues.md)
