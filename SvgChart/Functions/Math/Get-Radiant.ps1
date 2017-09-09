function Get-Radiant {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [float]
        $Angle
    )

    $Angle / 180 * [math]::PI
}