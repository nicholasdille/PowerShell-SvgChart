function Add-SvgLine {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        #[ValidateNotNullOrEmpty()]
        [System.Xml.XmlElement]
        $Svg
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [array]
        $Points
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]
        $Color = 'black'
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [int]
        $Width = 1
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [float]
        $Opacity = 1
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

    $Pairs = $Points | ForEach-Object {
        "$($_.x),$($_.y)"
    }
    $PointsString = $Pairs -join ' '

    $element = $Svg.OwnerDocument.CreateElement('polyline')
    $element.SetAttribute('points', $PointsString)

    $element.SetAttribute('stroke', $Color)
    $element.SetAttribute('stroke-width', $Width)
    $element.SetAttribute('stroke-opacity', $Opacity)
    $element.SetAttribute('fill', $FillColor)
    $element.SetAttribute('opacity', $FillOpacity)
    
    $Svg.AppendChild($element) | Out-Null
}