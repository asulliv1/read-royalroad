
# Get functions definition files and dot source them
$Functions = Get-ChildItem -Recurse -filter "*.ps1" -Path $PSScriptRoot -ErrorAction SilentlyContinue | Where-Object {$_.fullname -like "*functions\*"}

foreach ($Function in @($Functions)) {
    try {
        . $Function.FullName
    } catch {
        Write-Error -Message "Failed to import function $($Function.FullName): $_"
    }
}

Export-ModuleMember -Function $Functions.BaseName