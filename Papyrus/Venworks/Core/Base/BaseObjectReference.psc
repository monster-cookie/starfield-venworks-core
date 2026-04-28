ScriptName Venworks:Core:Base:BaseObjectReference Extends ObjectReference
{ Shared base class that all Venworks ObjectReference classes derive from.  This injects some shared functions, constants, etc }


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Imports
;;;
Import Venworks:Core:Enumerations
Import Venworks:Core:Logging


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Functions - Helper (Spawning)
;;;
Function HelperSpawnObject(ObjectReference marker, FormList possibleObjects)
  Form objectToSpawn = possibleObjects.GetAt(Utility.RandomInt(0, possibleObjects.GetSize()-1))
  ObjectReference spawnedObjectRef = marker.PlaceAtMe(objectToSpawn)
  spawnedObjectRef.SetPosition(marker.GetPositionX(), marker.GetPositionY(), marker.GetPositionZ())
  spawnedObjectRef.SetAngle(0, 0, marker.GetAngleZ())
EndFunction


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
Function LogSystemInformational(String creationName, String moduleName, String functionName, String logMessage)
  LogSeverity severityTable = new LogSeverity;
  LogSystem(creationName=creationName, moduleName=moduleName, functionName=functionName, logMessage=logMessage, severity=severityTable.Info)
EndFunction

Function LogSystemWarning(String creationName, String moduleName, String functionName, String logMessage)
  LogSeverity severityTable = new LogSeverity;
  LogSystem(creationName=creationName, moduleName=moduleName, functionName=functionName, logMessage=logMessage, severity=severityTable.Warning)
EndFunction

Function LogSystemError(String creationName, String moduleName, String functionName, String logMessage)
  LogSeverity severityTable = new LogSeverity;
  LogSystem(creationName=creationName, moduleName=moduleName, functionName=functionName, logMessage=logMessage, severity=severityTable.Error)
EndFunction

Function LogSystemCritical(String creationName, String moduleName, String functionName, String logMessage)
  LogSeverity severityTable = new LogSeverity;
  LogSystem(creationName=creationName, moduleName=moduleName, functionName=functionName, logMessage=logMessage, severity=severityTable.Critical)
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Functions - Logging (User)
;;;
Function LogUserInformational(String creationName, String moduleName, String functionName, String logMessage)
  LogSeverity severityTable = new LogSeverity;
  LogUser(creationName=creationName, moduleName=moduleName, functionName=functionName, logMessage=logMessage, severity=severityTable.Info)
EndFunction

Function LogUserWarning(String creationName, String moduleName, String functionName, String logMessage)
  LogSeverity severityTable = new LogSeverity;
  LogUser(creationName=creationName, moduleName=moduleName, functionName=functionName, logMessage=logMessage, severity=severityTable.Warning)
EndFunction

Function LogUserError(String creationName, String moduleName, String functionName, String logMessage)
  LogSeverity severityTable = new LogSeverity;
  LogUser(creationName=creationName, moduleName=moduleName, functionName=functionName, logMessage=logMessage, severity=severityTable.Error)
EndFunction

Function LogUserCritical(String creationName, String moduleName, String functionName, String logMessage)
  LogSeverity severityTable = new LogSeverity;
  LogUser(creationName=creationName, moduleName=moduleName, functionName=functionName, logMessage=logMessage, severity=severityTable.Critical)
EndFunction
