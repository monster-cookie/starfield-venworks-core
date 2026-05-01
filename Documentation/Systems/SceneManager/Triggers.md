# Scene Manager: Triggers

Like the BGS Radiant Engine, Scene Manager uses a variety of triggers and marker in a POI to redesign the POI to match the story elements needed for a quest/story.

## Scene Manager Trigger Variants [REQUIRED]

One of these is required in all Scene Manager managed POI and should be in the middle of the POI like SMMarker_Center.

### SMTriggerStoryPOI

This controls contacting the story manager to request a overlay quest (using the SMEncounterTypeStoryOverlay event keyword) for the POI.

### SMTriggerStoryClutter

This controls contacting the story manager to request a overlay quest (using the SMEncounterTypeStoryOverlay event keyword) for the POI.

### SMTriggerStoryShip

This controls contacting the story manager to request a overlay quest (using the SMEncounterTypeStoryShip event keyword) for the POI.

### SMTriggerStorySpace

This controls contacting the story manager to request a overlay quest (using the SMTriggerSpace event keyword) for the POI.

## NPC Markers

### REOverlayTrigger_AreaLeader (RETriggerAreaLeaderLocRef)

This marker denotes where the group's leader would spawn. These aren't well used BGS seems to use the Scene and Travel markers instead.

NOTE: This is by far the way that BGS uses to spawn a boss.
