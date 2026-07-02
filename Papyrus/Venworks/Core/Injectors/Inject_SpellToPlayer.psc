ScriptName Venworks:Core:Injectors:Inject_SpellToPlayer Extends Venworks:Core:Base:BaseQuest


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Properties
;;;
Actor Property PlayerRef Auto Const Mandatory
Spell Property SpellToEnable Auto Const Mandatory


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Events
;;;
Event OnQuestInit()
  LogUserInformational(moduleName="Inject_SpellToPlayer", functionName="OnQuestInit", logMessage="Spell " + SpellToEnable + " added to player.")
  PlayerRef.AddSpell(SpellToEnable, false)
EndEvent
