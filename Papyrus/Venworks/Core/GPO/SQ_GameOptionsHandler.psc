ScriptName Venworks:Core:GPO:SQ_GameOptionsHandler extends PEO:SQ_PEO_QuestScript
{ Shared script for configuring the game options }


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Imports
;;;
Import Venworks:Core:Enumerations
Import Venworks:Core:Logging


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Global Variables
;;;
GlobalVariable Property Venworks_DebugEnabled Auto Const Mandatory
String Property Venworks_ModName="VenworksCore" Auto Const Mandatory


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Debug/Trace Handlers
;;;
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "PEO",  string SubLogName = "SQ_PEO", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
  MainLogName = Venworks_ModName
  SubLogName = "GPO:SQ_GameOptionsHandler"
  LogUser(creationName=Venworks_ModName, moduleName="GPO:SQ_GameOptionsHandler", functionName=CallingObject, logMessage=asTextToPrint, severity=aiSeverity)
  return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "PEO",  string SubLogName = "SQ_PEO", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
  MainLogName = Venworks_ModName
  SubLogName = "GPO:SQ_GameOptionsHandler"
  LogUser(creationName=Venworks_ModName, moduleName="GPO:SQ_GameOptionsHandler", functionName=CallingObject, logMessage=asTextToPrint, severity=aiSeverity)
  return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction