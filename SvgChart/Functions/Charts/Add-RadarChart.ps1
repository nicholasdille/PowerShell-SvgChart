function Add-RadarChart {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        #[ValidateNotNullOrEmpty()]
        [System.Xml.XmlElement]
        $Svg
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [float]
        $CenterX
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [float]
        $CenterY
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [float]
        $MaximumX
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [float]
        $MaximumY
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [float]
        $Spacing
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [array]
        $Data
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [int]
        $LineWidth = 1
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]
        $LineColor = 'black'
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [float]
        $LineOpacity = 1
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]
        $FillColor = 'none'
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [float]
        $FillOpacity = 1
    )

    Add-SvgCircle $svg -CenterX $CenterX -CenterY $CenterY -Radius 2
    
    for ($y_i = 1; $y_i -le $MaximumY; ++$y_i) {
        $Points = @()
        for ($x_i = 0; $x_i -le $MaximumX; ++$x_i) {
            $Coordinates = Get-CoordinatesFromAngle -Radius ( $y_i * $Spacing ) -Angle ( Get-Radiant -Angle ( $x_i * 360 / $MaximumX ) )
            $Coordinates.x += $CenterX
            $Coordinates.y += $CenterY
            #Write-Host "x_i=$x_i y_i=$y_i"
            $Points += $Coordinates
        }
        Add-SvgPolygon $svg -Points $Points
    }

    $Points = @()
    foreach ($item in $Data) {
        $Coordinates = Get-CoordinatesFromAngle -Radius ( $item.y * $Spacing ) -Angle ( Get-Radiant -Angle ( $item.x * 360 / $MaximumX ) )
        $Coordinates.x += $CenterX
        $Coordinates.y += $CenterY
        $Points += $Coordinates
    }
    Add-SvgPolygon $svg -Points $Points -Color Red
}