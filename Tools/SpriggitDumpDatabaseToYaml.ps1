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
  if (![System.IO.File]::Exists("./Staging/$database")) {
    Write-Host -ForegroundColor DarkRed "No database file named '$database' found in Staging. Skipping."
    continue
  }

  Write-Host -ForegroundColor Green "Disassembling in data file $database to YAML in ./Staging/$database"

  & "$ENV:TOOL_PATH_SPRIGGIT/Spriggit.CLI.exe" serialize --InputPath "./Staging/$database" --PackageVersion $ENV:SPRIGGIT_VERSION --OutputPath "./Spriggit/$database" --Check --GameRelease Starfield --PackageName Spriggit.Yaml --DataFolder "$ENV:STEAM_DATA_FOLDER"
}

Write-Host -ForegroundColor Cyan "`n`n"
Write-Host -ForegroundColor Cyan "**************************************************"
Write-Host -ForegroundColor Cyan "**   Spriggit Datafile Dump Workflow Complete   **"
Write-Host -ForegroundColor Cyan "**************************************************"
Write-Host -ForegroundColor Cyan "`n`n"