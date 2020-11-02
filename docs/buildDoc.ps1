# Delete all existing md files.
Remove-Item .\docs\*.md -Exclude README.md
# Create all new  md files adding the first line title. 
Get-ChildItem .\docs |
ForEach-Object -Process {if ($_.PSIsContainer) {$_.Name;New-Item -Path .\docs -Name $_"2.md" -ItemType "file" -Value "# "$_; " " }}
# Adding the content from all chuld MD files.
Get-ChildItem .\docs |
ForEach-Object -Process {if ($_.PSIsContainer) {$_.Name;Add-Content -Path .\docs\$_"2.md" -Value (Get-Content .\docs\$_\*.md); " " }}
