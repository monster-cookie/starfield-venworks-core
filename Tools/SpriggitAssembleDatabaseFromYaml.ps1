# Abort on first error
$PSNativeCommandUseErrorActionPreference = $true
$ErrorActionPreference = "Stop"

# If not loaded already pull in the shared config
if (!$Global:SharedConfigurationLoaded) {
  Write-Host -ForegroundColor Green "Importing Shared Configuration"
  . "$PSScriptRoot/sharedConfig.ps1"
}

# Export Data File to YAML
foreach ($database in $Global:Databases) {
  if (![System.IO.Directory]::Exists("./Spriggit/$database")) {
    Write-Host -ForegroundColor DarkRed "No yaml source named '$database' found in Spriggit. Skipping."
    continue
  }

  Write-Host -ForegroundColor Green "Assembling YAML in ./Spriggit/$database back in data file $database"

  & "$ENV:TOOL_PATH_SPRIGGIT/Spriggit.CLI.exe" deserialize --InputPath "./Spriggit/$database" --OutputPath "./Staging/$database" --DataFolder "$ENV:STEAM_DATA_FOLDER"
}

Write-Host -ForegroundColor Cyan "`n`n"
Write-Host -ForegroundColor Cyan "**************************************************"
Write-Host -ForegroundColor Cyan "** Spriggit Datafile Assembly Workflow Complete **"
Write-Host -ForegroundColor Cyan "**************************************************"
Write-Host -ForegroundColor Cyan "`n`n"