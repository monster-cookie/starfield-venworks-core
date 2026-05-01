ScriptName Venworks:Core:SceneManager:SMController Extends Venworks:Core:Base:BaseQuest
{ My version of the radiant engine quest controller. This needs added to all SceneManager Managed Quests.}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Imports
;;;
Import Venworks:Core:Enumerations


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Global Variables
;;;
GlobalVariable Property Venworks_DebugEnabled Auto Const Mandatory
String Property Venworks_ModName="VenworksCore" Auto Const Mandatory


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Properties
;;;

;; These properties perform a standardized range check (distance between the player and the trigger).
Group RangeCheck
  Float Property RangeCheckDistance=700.00 Auto Const Mandatory
  { When player's distance to trigger is less than this, stage RangeCheckStage will be set. }
  
  Int Property RangeCheckStage=100 Auto Const Mandatory
  { When player's distance to trigger is less than RangeCheckDistance, set this stage. }
EndGroup

;; These Are key markers we will need
Group ImportantReferences
  ReferenceAlias Property Alias_Marker_Center Auto Const Mandatory
EndGroup 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Variables
;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Events
;;;

;; Event received when the quest is initialized, aliases are filled, and it is about to run the startup stage
Event OnQuestInit()
  LogModuleInformational(functionName="OnQuestInit", logMessage="OnQuestInit Fired")
EndEvent

;; Event received when the quest has been started
Event OnQuestStarted()
  LogModuleInformational(functionName="OnQuestStarted", logMessage="OnQuestStarted Fired")

  ;; register for range check to center marker
  If (RangeCheckDistance > 0)
    ObjectReference centerMarkerRef = Alias_Marker_Center.GetRef()
    LogModuleInformational(functionName="OnQuestShutdown", logMessage="Start range check for " + RangeCheckDistance + " units to Marker_Center=" + centerMarkerRef)
    RegisterForDistanceLessThanEvent(Game.GetPlayer(), centerMarkerRef, RangeCheckDistance)
  EndIf 
EndEvent

;; Event received when the quest has been shut down. Note that the aliases will be empty by the time this event is received.
Event OnQuestShutdown()
  LogModuleInformational(functionName="OnQuestShutdown", logMessage="OnQuestShutdown Fired")
EndEvent

; Distance event - sent when the two objects are less then the registered distance apart.
Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance, int aiEventID)
  LogModuleInformational(functionName="OnDistanceLessThan", logMessage="Player in range. " + afDistance + " setting stage to " + RangeCheckStage)
  SetStage(RangeCheckStage)
EndEvent


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Functions
;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Functions - Logging Helpers
;;;

Function LogModuleInformational(string functionName, string logMessage)
	LogUserInformational(creationName=Venworks_ModName, moduleName="SceneManager:SMController", functionName=functionName, logMessage=logMessage)
EndFunction

Function LogModuleWarning(string functionName, string logMessage)
	LogUserWarning(creationName=Venworks_ModName, moduleName="SceneManager:SMController", functionName=functionName, logMessage=logMessage)
EndFunction

Function LogModuleError(string functionName, string logMessage)
	LogUserError(creationName=Venworks_ModName, moduleName="SceneManager:SMController", functionName=functionName, logMessage=logMessage)
EndFunction

Function LogModuleCritical(string functionName, string logMessage)
	LogUserCritical(creationName=Venworks_ModName, moduleName="SceneManager:SMController", functionName=functionName, logMessage=logMessage)
EndFunction
