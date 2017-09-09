function Add-SvgText {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        #[ValidateNotNullOrEmpty()]
        [System.Xml.XmlElement]
        $Svg
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [hashtable]
        $Anchor
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Text
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]
        $FontFamily = 'Verdana'
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [int]
        $Size = 8
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [int]
        $LineWidth = 1
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]
        $LineColor = 'none'
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
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]
        $Transform
    )

    $element = $Svg.OwnerDocument.CreateElement('text')
    $element.SetAttribute('x', $Anchor.x)
    $element.SetAttribute('y', $Anchor.y)
    $element.SetAttribute('anchor', $Anchor.anchor)
    $element.innerText = $Text

    $element.SetAttribute('font-family', $FontFamily)
    $element.SetAttribute('font-size', $Size)

    $element.SetAttribute('stroke', $LineColor)
    $element.SetAttribute('stroke-width', $LineWidth)
    $element.SetAttribute('stroke-opacity', $LineOpacity)
    $element.SetAttribute('opacity', $FillOpacity)
    $element.SetAttribute('fill', $FillColor)

    if ($PSBoundParameters.ContainsKey('Transform')) {
        $element.SetAttribute('transform', $Transform)
    }

    $Svg.AppendChild($element) | Out-Null
}