ScriptName Venworks:Core:Injectors:Inject_InventoryItem Extends Venworks:Core:Base:BaseQuest


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Properties
;;;
Actor Property PlayerRef Auto Const Mandatory
Form Property ItemToInject Auto Const Mandatory


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Events
;;;
Event OnQuestInit()
  LogUserInformational(moduleName="Inject_InventoryItem", functionName="OnQuestInit", logMessage="OnQuestInit triggered.")
  If PlayerRef.GetItemCount(ItemToInject) <= 0
    PlayerRef.AddItem(ItemToInject, 1, false)
    LogUserInformational(moduleName="Inject_InventoryItem", functionName="OnQuestInit", logMessage="Item added to player inventory.")
  EndIf
EndEvent
