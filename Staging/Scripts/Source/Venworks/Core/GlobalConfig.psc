ScriptName Venworks:Core:GlobalConfig Extends ScriptObject Hidden

Struct Creation
  String Name = "Venworks-Core"
EndStruct

String Function GetCreationName() Global
  Creation mod = new Creation
  Return mod.Name
EndFunction