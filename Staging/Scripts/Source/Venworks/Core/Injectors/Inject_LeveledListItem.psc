ScriptName Venworks:Core:Injectors:Inject_LeveledListItem Extends Venworks:Core:Base:BaseQuest


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Properties
;;;
LeveledItem Property InjectIntoLeveledItemList Auto Const Mandatory
Form Property ToInjectLeveledItemEntryItem Auto Const Mandatory
Int Property ToInjectLeveledItemEntryLevel Auto Const Mandatory
Int Property ToInjectLeveledItemEntryCount Auto Const Mandatory


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Events
;;;
Event OnQuestInit()
  LogUserInformational(moduleName="Inject_LeveledListItem", functionName="OnQuestInit", logMessage="Injecting " + ToInjectLeveledItemEntryCount + " " + ToInjectLeveledItemEntryItem + " items at level " + ToInjectLeveledItemEntryLevel + " into " + InjectIntoLeveledItemList +  ".")
  InjectIntoLeveledItemList.AddForm(ToInjectLeveledItemEntryItem, ToInjectLeveledItemEntryLevel, ToInjectLeveledItemEntryCount)
EndEvent
