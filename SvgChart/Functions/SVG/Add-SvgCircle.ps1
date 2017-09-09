function Add-SvgCircle {
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
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [float]
        $StartAngle
        ,
        [Parameter()]
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
        $FillColor = 'black'
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [float]
        $FillOpacity = 1
    )

    if ($PSBoundParameters.ContainsKey('StartAngle') -and $PSBoundParameters.ContainsKey('EndAngle')) {
        Add-SvgSlice @PSBoundParameters
        return
    }

    $element = $Svg.OwnerDocument.CreateElement('circle')
    $element.SetAttribute('cx', $CenterX)
    $element.SetAttribute('cy', $CenterY)
    $element.SetAttribute('r', $Radius)

    $element.SetAttribute('stroke', $LineColor)
    $element.SetAttribute('stroke-width', $LineWidth)
    $element.SetAttribute('stroke-opacity', $LineOpacity)
    $element.SetAttribute('opacity', $FillOpacity)
    $element.SetAttribute('fill', $FillColor)

    $Svg.AppendChild($element) | Out-Null
}