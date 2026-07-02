ScriptName Venworks:Core:Base:BaseActiveMagicEffect Extends ActiveMagicEffect Hidden
{ 
  Shared base class that all Venworks ActiveMagicEffect classes derive from.
  
  This injects some shared functions, constants, etc.
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Imports
;;;
Import Venworks:Core:Enumerations
Import Venworks:Core:Logging

Import Venworks:Core:GlobalConfig


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Functions - Utility
;;;
var Function Ternary(Bool conditional, Var result1, Var result2) global
  If (conditional)
    Return result1
  EndIf

  Return result2
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Functions - Logging (System)
;;;
Function LogSystemInformational(String moduleName, String functionName, String logMessage)
  LogSeverity severityTable = new LogSeverity;
  LogSystem(creationName=GetCreationName(), moduleName=moduleName, functionName=functionName, logMessage=logMessage, severity=severityTable.Info)
EndFunction

Function LogSystemWarning(String moduleName, String functionName, String logMessage)
  LogSeverity severityTable = new LogSeverity;
  LogSystem(creationName=GetCreationName(), moduleName=moduleName, functionName=functionName, logMessage=logMessage, severity=severityTable.Warning)
EndFunction

Function LogSystemError(String moduleName, String functionName, String logMessage)
  LogSeverity severityTable = new LogSeverity;
  LogSystem(creationName=GetCreationName(), moduleName=moduleName, functionName=functionName, logMessage=logMessage, severity=severityTable.Error)
EndFunction

Function LogSystemCritical(String moduleName, String functionName, String logMessage)
  LogSeverity severityTable = new LogSeverity;
  LogSystem(creationName=GetCreationName(), moduleName=moduleName, functionName=functionName, logMessage=logMessage, severity=severityTable.Critical)
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Functions - Logging (User)
;;;
Function LogUserInformational(String moduleName, String functionName, String logMessage)
  LogSeverity severityTable = new LogSeverity;
  LogUser(creationName=GetCreationName(), moduleName=moduleName, functionName=functionName, logMessage=logMessage, severity=severityTable.Info)
EndFunction

Function LogUserWarning(String moduleName, String functionName, String logMessage)
  LogSeverity severityTable = new LogSeverity;
  LogUser(creationName=GetCreationName(), moduleName=moduleName, functionName=functionName, logMessage=logMessage, severity=severityTable.Warning)
EndFunction

Function LogUserError(String moduleName, String functionName, String logMessage)
  LogSeverity severityTable = new LogSeverity;
  LogUser(creationName=GetCreationName(), moduleName=moduleName, functionName=functionName, logMessage=logMessage, severity=severityTable.Error)
EndFunction

Function LogUserCritical(String moduleName, String functionName, String logMessage)
  LogSeverity severityTable = new LogSeverity;
  LogUser(creationName=GetCreationName(), moduleName=moduleName, functionName=functionName, logMessage=logMessage, severity=severityTable.Critical)
EndFunction
