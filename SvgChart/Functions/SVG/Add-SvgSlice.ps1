function Add-SvgSlice {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
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
        $Radius
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [float]
        $StartAngle
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [float]
        $EndAngle
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [int]
        $LineWidth = 1
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]
        $LineColor = 'grey'
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [float]
        $LineOpacity = 1
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]
        $FillColor = 'black'
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [float]
        $FillOpacity = 1
    )

    $element = $Svg.OwnerDocument.CreateElement('path')

    $CenterCoords = @{
        x = $CenterX
        y = $CenterY
    }
    $StartCoords = Get-CoordinatesFromAngle -Radius $Radius -Angle (Get-Radiant -Angle $StartAngle)
    $EndCoords   = Get-CoordinatesFromAngle -Radius $Radius -Angle (Get-Radiant -Angle $EndAngle)

    $StartCoords.x += $CenterCoords.x
    $StartCoords.y += $CenterCoords.y
    $EndCoords.x   += $CenterCoords.x
    $EndCoords.y   += $CenterCoords.y

    $d = 'M {0};{1} L {2};{3} A {4};{4} 0 0;0 {5};{6} z' -f $CenterCoords.x, $CenterCoords.y, $StartCoords.x, $StartCoords.y, $Radius, $EndCoords.x, $EndCoords.y
    $d = $d.Replace(',', '.').Replace(';', ',')
    $element.SetAttribute('d', $d)

    $element.SetAttribute('stroke', $LineColor)
    $element.SetAttribute('stroke-width', $LineWidth)
    $element.SetAttribute('stroke-opacity', $LineOpacity)
    $element.SetAttribute('opacity', $FillOpacity)
    $element.SetAttribute('fill', $FillColor)

    $Svg.AppendChild($element) | Out-Null
}