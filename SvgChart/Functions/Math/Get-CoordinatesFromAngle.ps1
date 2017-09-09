function Get-CoordinatesFromAngle {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [float]
        $Angle
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [float]
        $Radius = 1.0
    )

    @{
        angle = $Angle
        x = [math]::Sin($Angle) * $Radius
        y = [math]::Cos($Angle) * $Radius
    }
}