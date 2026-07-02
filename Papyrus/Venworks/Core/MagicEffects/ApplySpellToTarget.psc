ScriptName Venworks:Core:MagicEffects:ApplySpellToTarget Extends Venworks:Core:Base:BaseActiveMagicEffect


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Properties
;;;
Spell Property AbilityToApply Auto Const Mandatory


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Events
;;;
Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Actor target = akTarget.GetSelfAsActor()
	target.AddSpell(AbilityToApply, false)
  LogUserInformational(moduleName="ApplySpellToTarget", functionName="OnEffectStart", logMessage="Added ability with form ID " + AbilityToApply + " to target with form ID " + target + ".")
EndEvent