ScriptName Venworks:Core:GlobalFunctions Extends ScriptObject hidden


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Functions
;;;
Bool Function IsVenworksCoreInstalled() global
  Return (Game.IsPluginInstalled("Venworks-Core.esp") || Game.IsPluginInstalled("Venworks-Core.esm"));
EndFunction

Var Function Ternary(Bool conditional, Var result1, Var result2) global
  If (conditional)
    Return result1;
  EndIf
  Return result2;
EndFunction
