# Logging: System Log

These utility functions write to the papyrus log in [Documents]/My Games/Starfield/Logs/Script/Papyrus.?.log.

## Utility Class Function

### LogSystem(string creationName, string moduleName, string functionName, string logMessage, int severity)

This outputs log messages to the papyrus script log.

#### LogSystem - Arguments

- creationName: The name to show as the creation that generated the log message
- moduleName: The name to show for the module the function that generated the log message is in
- functionName: The name to show for the function that generated the log message
- logMessage: The log message to record
- severity: The severity of the log message see Enumerations:LogSeverity

## Base Class Functions

All 3 base classes have these same function defined.

### LogSystemInformational(string creationName, string moduleName, string functionName, string logMessage)

This outputs informational log messages to the papyrus script log.

#### LogSystemInformational - Arguments

- creationName: The name to show as the creation that generated the log message
- moduleName: The name to show for the module the function that generated the log message is in
- functionName: The name to show for the function that generated the log message
- logMessage: The log message to record

### LogSystemWarning(string creationName, string moduleName, string functionName, string logMessage)

This outputs warning log messages to the papyrus script log.

#### LogSystemWarning - Arguments

- creationName: The name to show as the creation that generated the log message
- moduleName: The name to show for the module the function that generated the log message is in
- functionName: The name to show for the function that generated the log message
- logMessage: The log message to record

### LogSystemError(string creationName, string moduleName, string functionName, string logMessage)

This outputs error log messages to the papyrus script log.

#### LogSystemError - Arguments

- creationName: The name to show as the creation that generated the log message
- moduleName: The name to show for the module the function that generated the log message is in
- functionName: The name to show for the function that generated the log message
- logMessage: The log message to record

### LogSystemCritical(string creationName, string moduleName, string functionName, string logMessage)

This outputs critical log messages to the papyrus script log.

#### LogSystemCritical - Arguments

- creationName: The name to show as the creation that generated the log message
- moduleName: The name to show for the module the function that generated the log message is in
- functionName: The name to show for the function that generated the log message
- logMessage: The log message to record
