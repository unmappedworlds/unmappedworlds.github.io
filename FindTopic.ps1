# Check if an argument was provided
if ($args.Count -eq 0) {
    Write-Host "Usage: .\Find-Lore.ps1 'pattern1|pattern2'" -ForegroundColor Yellow
    exit
}

$pattern = $args[0]

# Find the files
$matchingFiles = Get-ChildItem -Filter *.markdown -Recurse | 
                 Select-String -Pattern $pattern | 
                 Select-Object -ExpandProperty Path -Unique

# Output Filenames
Write-Host "--- Files Found ---" -ForegroundColor Cyan
if ($matchingFiles) {
    $matchingFiles | ForEach-Object { Split-Path $_ -Leaf }
} else {
    Write-Host "No matches found."
}

# Output Count
$count = if ($matchingFiles) { $matchingFiles.Count } else { 0 }
Write-Host "`nTotal files matching: $count" -ForegroundColor Green
