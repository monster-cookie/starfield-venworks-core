ScriptName Venworks:Core:Logging Extends ScriptObject hidden


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Imports
;;;
Import Venworks:Core:Enumerations


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Functions
;;;

Int Function GetBGSSeverity(int severity) Global
  LogSeverity severityTable = new LogSeverity;
  If (severity == severityTable.Critical)
      Return severityTable.Error ;; This is intentional as BGS doesn't support Critical
  ElseIf (severity == severityTable.Error)
      Return severityTable.Error
  ElseIf (severity == severityTable.Warning)
      Return severityTable.Warning
  ElseIf (severity == severityTable.Verbose)
      Return severityTable.Info ;; This is intentional as BGS doesn't support Verbose
  Else
      Return severityTable.Info
  EndIf
EndFunction

String Function GetFormattedMessage(string creationName, string moduleName, string functionName, string logMessage, int severity) Global
  LogSeverity severityTable = new LogSeverity;
  String severityMessage=""
  If (severity == severityTable.Critical)
    severityMessage += " [Critical]";
  ElseIf (severity == severityTable.Error)
    severityMessage += " [   Error]";
  ElseIf (severity == severityTable.Warning)
    severityMessage += " [ Warning]";
  ElseIf (severity == severityTable.Verbose)
    severityMessage += " [ Verbose]";
  Else
    severityMessage += " [    Info]";
  EndIf

  return ">> " + severityMessage + " {" + creationName + "} <" + moduleName + "> (" + functionName + "): " + logMessage
EndFunction

Function LogSystem(string creationName, string moduleName, string functionName, string logMessage, int severity) Global DebugOnly
  Int bgsSeverity = GetBGSSeverity(severity)
  String finalMessageFormat=GetFormattedMessage(creationName=creationName, moduleName=moduleName, functionName=functionName, logMessage=logMessage, severity=severity)
  Debug.Trace(asTextToPrint=finalMessageFormat, aiSeverity=bgsSeverity)
EndFunction

Function LogUser(string creationName, string moduleName, string functionName, string logMessage, int severity) Global DebugOnly
  ;; All users messages should also go to the papyrus log for consistency
  LogSystem(creationName=creationName, moduleName=moduleName, functionName=functionName, logMessage=logMessage, severity=severity)

  If (!Debug.OpenUserLog("Venworks"))
    Int bgsSeverity = GetBGSSeverity(severity)
    String finalMessageFormat=GetFormattedMessage(creationName=creationName, moduleName=moduleName, functionName=functionName, logMessage=logMessage, severity=severity)
    Debug.TraceUser(asUserLog="Venworks", asTextToPrint=finalMessageFormat, aiSeverity=bgsSeverity)
  EndIf
EndFunction
