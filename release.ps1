
Write-Host "Step 1: Building Flutter App..." -ForegroundColor Cyan
# Run the flutter build command first
flutter clean
flutter pub get

flutter build apk --split-per-abi




Write-Host "Reading pubspec.yaml..." -ForegroundColor Cyan
# 1. Extract the app name and version from pubspec.yaml
$nameMatch = Select-String -Path "pubspec.yaml" -Pattern "^name:\s*(.+)$"
$appName = $nameMatch.Matches.Groups[1].Value.Trim()

$versionMatch = Select-String -Path "pubspec.yaml" -Pattern "^version:\s*(.+)$"
$rawVersion = $versionMatch.Matches.Groups[1].Value.Trim()

# 2. Format the version for tags and filenames
# Replaces the '+' in Flutter build numbers (e.g., 1.0.0+1) with a '-' for safe filenames
$safeVersion = $rawVersion.Replace('+', '-')
# Drops the build number for the official GitHub Release Tag (e.g., v1.0.0)
$releaseTag = "v" + $rawVersion.Split('+')[0]

Write-Host "Found App: $appName" -ForegroundColor Green
Write-Host "Found Version: $rawVersion (Using Tag: $releaseTag)" -ForegroundColor Green

# 3. Define your files using the {name+version} format dynamically
$files = @{
    "build/app/outputs/flutter-apk/app-arm64-v8a-release.apk"   = "$appName-$safeVersion-arm64.apk"
#     "build/app/outputs/flutter-apk/app-armeabi-v7a-release.apk" = "$appName-$safeVersion-arm32.apk"
#     "build/app/outputs/flutter-apk/app-x86_64-release.apk" = "$appName-$safeVersion-x86_64.apk"
}

# 4. Create a temporary folder
$tempDir = "build/app/outputs/github_temp"
New-Item -ItemType Directory -Force -Path $tempDir | Out-Null
$assetsToUpload = @()

Write-Host "`nPreparing files for upload..." -ForegroundColor Cyan

# 5. Copy and rename the files into the temp folder
foreach ($originalPath in $files.Keys) {
    $newName = $files[$originalPath]
    $tempPath = Join-Path $tempDir $newName

    if (Test-Path $originalPath) {
        Copy-Item -Path $originalPath -Destination $tempPath -Force
        $assetsToUpload += $tempPath
        Write-Host " - Ready: $newName" -ForegroundColor Green
    } else {
        Write-Host " - Warning: Could not find $originalPath. Skipping." -ForegroundColor Yellow
    }
}

if ($assetsToUpload.Count -eq 0) {
    Write-Host "Error: No files were found to upload! Aborting." -ForegroundColor Red
    Remove-Item -Path $tempDir -Recurse -Force
    exit
}

Write-Host "`nCreating GitHub release $releaseTag..." -ForegroundColor Cyan

# 6. Run the GitHub CLI command using dynamic variables
gh release create $releaseTag $assetsToUpload --title "$appName $releaseTag" --notes "Production release for $appName version $safeVersion. Download the files below."

# 7. Clean up
Remove-Item -Path $tempDir -Recurse -Force

if ($LASTEXITCODE -eq 0) {
    Write-Host "`nRelease $releaseTag created successfully!" -ForegroundColor Green
} else {
    Write-Host "`nFailed to create release. Check the error message above." -ForegroundColor Red
}