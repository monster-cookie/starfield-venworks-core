ScriptName Venworks:Core:AliasHelpers:AliasEnableDisableToggleOnLoad Extends Venworks:Core:Base:BaseObjectReference
{Toggles between enabling and disabling this object based on a global variable}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Properties
;;;
Group Configuration Collapsed
  GlobalVariable Property EnablementGlobal Auto Const Mandatory
  {This global when set >0 enables the referenced object otherwise it disables it}
EndGroup


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; States
;;;
Auto State Waiting
  Event OnLoad()
    LogUserInformational(moduleName="EnableDisableToggleOnLoad", functionName="OnLoad", logMessage="OnLoad triggered.")
    Int enablementGlobalValueInt = EnablementGlobal.GetValueInt()
    bool enableObject = enablementGlobalValueInt > 0
    
    If (enableObject)
      LogUserInformational(moduleName="EnableDisableToggleOnLoad", functionName="OnLoad", logMessage="Enabling object " + self + ".")
      self.Enable()
    Else
      LogUserInformational(moduleName="EnableDisableToggleOnLoad", functionName="OnLoad", logMessage="Disabling object " + self + ".")
      self.Disable()
    EndIf
  EndEvent
EndState

State DoneWaiting
	; Do Nothing
EndState