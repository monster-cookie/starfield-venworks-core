ScriptName Venworks:Core:PlayerLevelHandlerScript extends Venworks:Core:Base:BaseQuest


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Imports
;;;
Import Venworks:Core:Enumerations
Import Venworks:Core:Logging


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Properties
;;;
ActorValue Property PlayerLevel Auto Const Mandatory


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Events
;;;
Event OnQuestInit()
  LogUserInformational(moduleName="PlayerLevelHandlerScript", functionName="OnQuestInit", logMessage="OnQuestInit triggered. Initializing PlayerLevel AV to player's current level.")
  Game.GetPlayer().SetValue(PlayerLevel, Game.GetPlayerLevel() as Float)
  Self.Stop()
EndEvent

Event OnStoryIncreaseLevel(int aiNewLevel)
  LogUserInformational(moduleName="PlayerLevelHandlerScript", functionName="OnStoryIncreaseLevel", logMessage="OnStoryIncreaseLevel SM Event triggered. Updating PlayerLevel AV to player's current level.")
  Game.GetPlayer().SetValue(PlayerLevel, Game.GetPlayerLevel() as Float)
  Self.Stop()
endEvent
