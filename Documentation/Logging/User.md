# Logging: User Log

These utility functions write to the papyrus log in [Documents]/My Games/Starfield/Logs/Script/User/[CreationName].?.log/.

## Utility Class Function

### LogUser(string creationName, string moduleName, string functionName, string logMessage, int severity)

This outputs log messages to the papyrus creation script log.

#### LogUser - Arguments

- creationName: The name to show as the creation that generated the log message
- moduleName: The name to show for the module the function that generated the log message is in
- functionName: The name to show for the function that generated the log message
- logMessage: The log message to record
- severity: The severity of the log message see Enumerations:LogSeverity

## Base Class Functions

All 3 base classes have these same function defined.

### LogUserInformational(string creationName, string moduleName, string functionName, string logMessage)

This outputs informational log messages to the papyrus creation script log.

#### LogUserInformational - Arguments

- creationName: The name to show as the creation that generated the log message
- moduleName: The name to show for the module the function that generated the log message is in
- functionName: The name to show for the function that generated the log message
- logMessage: The log message to record

### LogUserWarning(string creationName, string moduleName, string functionName, string logMessage)

This outputs warning log messages to the papyrus creation script log.

#### LogUserWarning - Arguments

- creationName: The name to show as the creation that generated the log message
- moduleName: The name to show for the module the function that generated the log message is in
- functionName: The name to show for the function that generated the log message
- logMessage: The log message to record

### LogUserError(string creationName, string moduleName, string functionName, string logMessage)

This outputs error log messages to the papyrus creation script log.

#### LogUserError - Arguments

- creationName: The name to show as the creation that generated the log message
- moduleName: The name to show for the module the function that generated the log message is in
- functionName: The name to show for the function that generated the log message
- logMessage: The log message to record

### LogUserCritical(string creationName, string moduleName, string functionName, string logMessage)

This outputs critical log messages to the papyrus creation script log.

#### LogUserCritical - Arguments

- creationName: The name to show as the creation that generated the log message
- moduleName: The name to show for the module the function that generated the log message is in
- functionName: The name to show for the function that generated the log message
- logMessage: The log message to record
