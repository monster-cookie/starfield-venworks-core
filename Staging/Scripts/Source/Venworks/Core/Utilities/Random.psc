ScriptName Venworks:Core:Utilities:Random
{Misc utility functions for handling random numbers.}


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
bool Function GetDiceRollChanceSuccess(int chanceSuccess, int numDice = 10, int diceSides = 10) Global
  If (chanceSuccess == 100)
    Return True
  EndIf

  int result = 0
  int roll = 1
  While (roll <= numDice)
    result += Utility.RandomInt(1, diceSides)
    roll += 1
  EndWhile

  Bool success=(result <= chanceSuccess)
  Return success
EndFunction

bool Function GetDiceRollChanceNone(int chanceNone, int numDice = 10, int diceSides = 10) Global
  If (chanceNone == 0)
    Return True
  EndIf
  
  int result = 0
  int roll = 1
  While (roll <= numDice)
    result += Utility.RandomInt(1, diceSides)
    roll += 1
  EndWhile
  
  Bool success=(result >= chanceNone)
  Return success
EndFunction

bool Function GetRandomChanceSuccess(int chanceSuccess, int minValue = 0, int maxValue = 100) Global
  If (chanceSuccess == 100)
    Return True
  EndIf

  Int result=Utility.RandomInt(minValue, maxValue)
  Bool success=(result <= chanceSuccess)
  Return success
EndFunction

bool Function GetRandomChanceNone(int chanceNone, int minValue = 0, int maxValue = 100) Global
  If (chanceNone == 0)
    Return True
  EndIf

  Int result=Utility.RandomInt(minValue, maxValue)
  Bool success=(result >= chanceNone)
  Return success
EndFunction
