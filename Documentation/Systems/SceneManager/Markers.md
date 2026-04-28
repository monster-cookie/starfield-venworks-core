# Scene Manager: Markers

## Placement Markers

### REOverlayCenter (RECenterLocRef) [REQUIRED]

This marker marks the center of the POI no real use other then that. Usually I put a box/cylinder primitive to mark the boundaries of the useable space. SQ_Groups uses this as the default spawn point so needs to be on the ground and clear.

### MapMarker (MapMarkerRefType) [REQUIRED]

This the normal BGS map marker and is required for the player to be able to fast travel and find the POI. You can customize the map marker via override name on the ref alias or DefaultAliasMapMarkerScript.

### XMarkerHeading [REQUIRED]

This the normal BGS XMarker Heading marker and is required for the player move to functionality and to find the POI.

## Scene Markers

These are key area markers for use in quests scenes and spawning

### REOverlaySceneA1 (RESceneA1LocRef) - REOverlaySceneA3 (RESceneA3LocRef)

### REOverlaySceneB1 (RESceneB1LocRef) - REOverlaySceneB3 (RESceneB3LocRef)

### REOverlaySceneC1 (RESceneC1LocRef) - REOverlaySceneC3 (RESceneC3LocRef)

## Travel Markers

These are key area markers for use in quests scenes and spawning. They are usually where NPCs will move to after spawning at the center marker or in a scene.

### REOverlayTravelA1 (RETravelA1LocRef) - REOverlayTravelA3 (RETravelA3LocRef)

### REOverlayTravelB1 (RETravelB1LocRef) - REOverlayTravelB3 (RETravelB3LocRef)

### REOverlayTravelC1 (RETravelC1LocRef) - REOverlayTravelC3 (RETravelC3LocRef)

## Important Markers

These are key markers for the quest usually tied to objects

### REOverlayMarkerSmallImportant (REMarkerSmallImportantLocRef)

This is a key quest item for the player to find that reference another location or place to go.

## Spawn Markers

### NPCs

#### Bosses/Leaders

These markers denote where the group's leader would spawn. This method isn't well used by BGS, they tend to use a REOverlayTrigger_AreaLeader activator instead.

- REOverlayLeaderMarker (RELeaderMarkerLocRef)

#### Captives

These markers denote logical places for a corpse to be spawn as a quest element. Please note these are Furniture items instead of and activator or static.

- REOverlayCaptiveMarker (RECaptiveMarkerLocRef)

#### Wounded

These markers denote a safe area for a wounded quest NPC to spawn. Please note these are Furniture items instead of and activator or static.

- REOverlayWoundedMarker (REWoundedMarkerLocRef)

### Containers

These markers control where containers are spawned.

#### REOverlayContainerClutter (REContainerLocRef) [ADDED IN VENWORKS CORE]

This is a small clutter container like a medkit, toolbox, etc.

#### REOverlayContainerChest (REContainerLocRef) [ADDED IN VENWORKS CORE]

This is a loot container like a chest, contraband case, etc.

#### REOverlayContainer_AreaLeader (REContainerLocRef) [ADDED IN VENWORKS CORE]

This is a boss loot container like a science, military, industrial, creature, etc. Please note this is a container object not a traditional marker.

#### REOverlayContainerHuman (REContainerLocRef)

This is a boss loot container like a science, military, industrial, creature, etc. Please note this is a container object not a traditional marker.

#### REOverlayContainerNatureCreature (REContainerLocRef)

A usable marker for where a poop pile could spawn. Please note this is a container object not a traditional marker.

#### REOverlayContainerNatureBarren (REContainerLocRef)

A usable marker for where a rock pile could spawn. Please note this is a container object not a traditional marker.

### Clutter

These control markers for spawning random clutter objects usually packings

#### Sizing

To be noted, a basic chair and file cabinet are 1m x 1m in game.

#### Floor Clutter

- SMMarker_Clutter_Floor_T1 (SMLocRefType_Clutter_Floor_T1)
  - Size is 1m by 1m
- SMMarker_Clutter_Floor_T2 (SMLocRefType_Clutter_Floor_T2)
  - Size is 4m by 4m
- SMMarker_Clutter_Floor_T3 (SMLocRefType_Clutter_Floor_T3)
  - Size is 8m by 8m
- SMMarker_Clutter_Floor_T4 (SMLocRefType_Clutter_Floor_T4)
  - Size is 16m by 16m

#### Table/Cabinet Surface Clutter

- SMMarker_Clutter_Surface_T1 (SMLocRefType_Clutter_Surface_T1)
  - Size is 5cm by 5cm
- SMMarker_Clutter_Surface_T2 (SMLocRefType_Clutter_Surface_T2)
  - Size is 25cm by 25cm
- SMMarker_Clutter_Surface_T3 (SMLocRefType_Clutter_Surface_T3)
  - Size is 50cm by 50cm
- SMMarker_Clutter_Surface_T4 (SMLocRefType_Clutter_Surface_T4)
  - Size is 1m by 1m

#### Outdoor Clutter

- SMMarker_Clutter_Outdoor_T1 (SMLocRefType_Clutter_Outdoor_T1)
  - Size is 1m by 1m
- SMMarker_Clutter_Outdoor_T2 (SMLocRefType_Clutter_Outdoor_T2)
  - Size is 4m by 4m
- SMMarker_Clutter_Outdoor_T3 (SMLocRefType_Clutter_Outdoor_T3)
  - Size is 8m by 8m
- SMMarker_Clutter_Outdoor_T4 (SMLocRefType_Clutter_Outdoor_T4)
  - Size is 16m by 16m
- SMMarker_Clutter_Outdoor_T5 (SMLocRefType_Clutter_Outdoor_T5)
  - Size is 32m by 32m
