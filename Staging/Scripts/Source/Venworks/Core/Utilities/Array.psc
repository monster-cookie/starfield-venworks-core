ScriptName Venworks:Core:Utilities:Array
{Misc utility functions for handling arrays.}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Imports
;;;
Import Venworks:Core:Enumerations
Import Venworks:Core:Logging


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Functions
;;;
ObjectReference Function GetRandomObjectFromArray(ObjectReference[] arrayToParse) Global
  int randomIndex = Utility.RandomInt(0, arrayToParse.Length-1)
  return arrayToParse[randomIndex]
EndFunction