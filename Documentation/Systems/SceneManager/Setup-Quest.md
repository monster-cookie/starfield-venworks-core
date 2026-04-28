# Scene Manager: Creating and setting up the quest

1. Duplicate (via right click and duplicate) the quest VWKS_SM_TEMPLATE. This is probably the only case right click and duplicate can be used.
2. Fix the quest name this will show on the log/quest notifications.
3. Click Ok to save the quest and then reopen it. This is needed to allow editing scripts and aliases.
4. Add any stages you need but do not remove any of them.
5. On the quest alias remove any markers that you don't need and aren't placed in your cell. If an alias can't be filled the quest will be blocked from starting.
6. You will need a handler quest script to perform work for the stages.

The radiant engine uses Story Manager Script Event node to process the dynamic POI setup and spawning of items and NPCs

## Quest Data Setup

KEY NOTE: Event must be set to Script Event and this quest should be in a Quest Node Branch in Story Manager.

1. Event must be set to Script Event
2. The box under Faction (This is the quest category in the CK only) should be set to one of the values below. NOTE that trailing \ is required.
  a. \Random Encounters\OverlayEncounters\AF\
  b. \Random Encounters\OverlayEncounters\Ecliptic\
  c. \Random Encounters\OverlayEncounters\FC\
  d. \Random Encounters\OverlayEncounters\Pirates\
  e. \Random Encounters\OverlayEncounters\Spacers\
  f. \Random Encounters\OverlayEncounters\Templates\
  g. \Random Encounters\OverlayEncounters\UC\
  h. \Random Encounters\OverlayEncounters\Varuun\
  i. \Random Encounters\OverlayEncounters\Wildlife\
3. Warn on alias fill failure should be checked but its only to help with debugging

## Quest stages

These are only the required stages you can add more as needed

- Stage 0 - OE Started
  - This is initial setup for the quest.
  - Mostly only setup chests, items, and terminals
- Stage 50 - Setup: Spawn NPCs
  - Setup NPCs here
- Stage 100 - Player is in range
  - Enable Quest Objectives if using them
- Stage 500 - Player Looted Nest
  - Can be any index but needs handled
  - Complete any pending objectives
- Stage 900 - Complete
  - Failsafe complete all objective
- Stage 999 - Shutdown
  - Perform any needed clean up
  - This is called on quest stop

## Quest Objectives

Setup as needed for your encounter. These are mostly optional but remember to wire up the stages for the trigger and completion of the objectives.

## Quest Aliases

This is the core of all radiant encounters and most of your work will be here. This grabs markers and required aliases for the scene setup.

- Alias Name: Trigger [REQUIRED]
  - Flags:
    - Reserves Reference
  - Fill Type
    - Use Find Matching Reference
    - Check From Event
    - Event Source is Script Event
    - Event Data is Ref 1
- Alias Name: OE_Location [REQUIRED]
  - Flags:
    - Reserves Location
    - Allow Explored
    - Allow Reuse In Quest [Optional]
  - Fill Type
    - Use Find Matching Location
    - Check From Event
    - Event Source is Script Event
    - Event Data is Location
- Alias Name: Player [REQUIRED]
  - Flags
    - None Required
  - Fill Type
    - Use Unique Reference
    - Select Player
- Alias Name: Companion [REQUIRED]
  - Flags
    - Optional (Player may not have an active companion)
  - Fill Type
    - Use External Alias Ref
    - SQ_Companions
    - Select ActiveCompanion
- Alias Name: MapMarker [REQUIRED]
  - Flags
    - Reserves Reference
    - Allow Disabled [Optional]
  - Fill Type
    - Use Location Alias Reference
    - Reference is OE_Location
    - Reference Type is MapMarkerRefType
- Alias Name: CenterMarker [REQUIRED]
  - Flags
    - Reserves Reference
  - Fill Type
    - Use Location Alias Reference
    - Reference is OE_Location
    - Reference Type is RECenterLocRef

You probably want to at least set up some spawn markers and chest references but these are all subject to your use case and optional.

- Alias Name: SpawnMarker (Will probably have multiple)
  - Flags:
    - None Required
  - Fill Type
    - Use Location Alias Reference
    - Reference is OE_Location
    - Reference Type is any one of the location ref types below:
      - RETravel??LocRef
      - REScene??LocRef
      - REAreaLeaderLocRef
- Alias Name: Chest
  - Flags:
    - Reserves Reference
    - Allow Reserved
  - Fill Type
    - Use Location Alias Reference
    - Reference is OE_Location
    - Reference Type is any one of the location ref types below:
      - REContainerLocRef
      - REContainerHiddenLocRef
  - Inventory
    - Add which ever loot list or items you want to fill the chest
  - Scripts
    - DefaultAliasOnActivate*
      - Use one of these scripts to trigger a stage when the player opens the chest
    - DefaultAliasOnDistanceLessThan
      - Use to trigger a stage when the player is close to this chest.
      - I would do this on a marker/marker not a chest
- Alias Name: Attacker/Defender/Whatever
  - Flags:
    - Reserves Reference
    - Allow Reserved
  - Fill Type
    - Use Create Ref to Object
    - Choose a NPC or Leveled NPC
    - Level set to your whims
    - Create At (Usually) then select one of the spawn makers you defined
  - Can change factions and keywords on the Data tab
  - Can inject drop items using the Inventory tab or use the default form the NPC record.
  - Can adjust the AI behavior using the Packages tab
  - Scripts
    - DefaultAliasOnDeath
      - Set a stage when the creature dies

## Quest Scripts

- DefaultQuestChangeLocationScript [REQUIRED]
  - This sets a quest stage when the player enters or exits a location
- OEScript [REQUIRED]
  - This is the controlling script for a radiant encounter
