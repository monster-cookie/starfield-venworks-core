# Abort on first error
$PSNativeCommandUseErrorActionPreference = $true
$ErrorActionPreference = "Stop"

# If not loaded already pull in the shared config
if (!$Global:SharedConfigurationLoaded) {
  Write-Host -ForegroundColor Green "Importing Shared Configuration"
  . "$PSScriptRoot/sharedConfig.ps1"
}

$ourPapyrusSourcePath="./Papyrus"
$bgsPapyrusSourcePath="$ENV:PAPYRUS_SCRIPTS_SOURCE_PATH"
$targetCompiledScriptsPath="$ENV:MODULE_SCRIPTS_PATH" 
$targetSourceScriptsPath="$ENV:MODULE_SCRIPTS_SOURCE_PATH" 

# Purge existing compiled Scripts folder. This purges removed scripts. 
Write-Host -ForegroundColor Green "Purging '$targetCompiledScriptsPath' to clear any removed scripts"
If ([System.IO.Directory]::Exists("$targetCompiledScriptsPath")) {
  Remove-Item -Path "$targetCompiledScriptsPath" -Force -Recurse | Out-Null
}

# Purge existing source Scripts folder. This purges removed scripts. 
Write-Host -ForegroundColor Green "Purging '$targetSourceScriptsPath' to clear any removed source scripts"
If ([System.IO.Directory]::Exists("$targetSourceScriptsPath")) {
  Remove-Item -Path "$targetSourceScriptsPath" -Force -Recurse | Out-Null
}

# Scaffold Compiled Pathing if needed
If (![System.IO.Directory]::Exists("$targetCompiledScriptsPath\$Global:ScriptingNamespaceModuleCompany")) {
  New-Item -ItemType "Directory" -Path "$targetCompiledScriptsPath\$Global:ScriptingNamespaceModuleCompany" | Out-Null
}
If (![System.IO.Directory]::Exists("$targetCompiledScriptsPath\$Global:ScriptingNamespaceModuleCompany\$Global:ScriptingNamespaceModuleName")) {
  New-Item -ItemType "Directory" -Path "$targetCompiledScriptsPath\$Global:ScriptingNamespaceModuleCompany\$Global:ScriptingNamespaceModuleName" | Out-Null
}

# Scaffold Source Pathing if needed
If (![System.IO.Directory]::Exists("$targetSourceScriptsPath\$Global:ScriptingNamespaceModuleCompany")) {
  New-Item -ItemType "Directory" -Path "$targetSourceScriptsPath\$Global:ScriptingNamespaceModuleCompany" | Out-Null
}
If (![System.IO.Directory]::Exists("$targetSourceScriptsPath\$Global:ScriptingNamespaceModuleCompany\$Global:ScriptingNamespaceModuleName")) {
  New-Item -ItemType "Directory" -Path "$targetSourceScriptsPath\$Global:ScriptingNamespaceModuleCompany\$Global:ScriptingNamespaceModuleName" | Out-Null
}

# Compile and deploy Scripts to CK Scripts folder
Write-Host -ForegroundColor Green "Compiling all scripts in $ourPapyrusSourcePath to $targetCompiledScriptsPath folder"

& "$ENV:TOOL_PATH_PAPYRUS_COMPILER\PapyrusCompiler.exe" "$ourPapyrusSourcePath" -all -f -optimize -flags="$ENV:PAPYRUS_COMPILER_FLAGS\Starfield_Papyrus_Flags.flg" -output="$targetCompiledScriptsPath" -import="$ourPapyrusSourcePath;$bgsPapyrusSourcePath" -ignorecwd

# Copy Source Scripts to CK Source Scripts folder
Write-Host -ForegroundColor Green "Copying all source scripts in $ourPapyrusSourcePath to $targetSourceScriptsPath folder"

$resolvedOurPapyrusSourcePath = [System.IO.Path]::GetFullPath($ourPapyrusSourcePath)
foreach ($sourceScriptPath in [System.IO.Directory]::EnumerateFiles($resolvedOurPapyrusSourcePath, "*.psc", [System.IO.SearchOption]::AllDirectories)) {
  $relativeScriptPath = [System.IO.Path]::GetRelativePath($resolvedOurPapyrusSourcePath, $sourceScriptPath)
  $targetScriptPath = [System.IO.Path]::Combine($targetSourceScriptsPath, $relativeScriptPath)
  $targetScriptDirectory = [System.IO.Path]::GetDirectoryName($targetScriptPath)
  If (![System.IO.Directory]::Exists($targetScriptDirectory)) {
    [System.IO.Directory]::CreateDirectory($targetScriptDirectory) | Out-Null
  }
  [System.IO.File]::Copy($sourceScriptPath, $targetScriptPath, $true)
}

Write-Host -ForegroundColor Cyan "`n`n"
Write-Host -ForegroundColor Cyan "**************************************************"
Write-Host -ForegroundColor Cyan "**       Compile Scripts Workflow complete      **"
Write-Host -ForegroundColor Cyan "**************************************************"
Write-Host -ForegroundColor Cyan "`n`n"
