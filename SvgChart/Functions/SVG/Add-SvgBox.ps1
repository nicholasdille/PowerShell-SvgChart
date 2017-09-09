function Add-SvgBox {
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
        $StartX
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [float]
        $StartY
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [float]
        $Width
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [float]
        $Height
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

    if ($Width -lt 0) {
        $Width *= -1
        $StartX -= $Width
    }
    if ($Height -lt 0) {
        $Height *= -1
        $StartY -= $Height
    }

    $element = $Svg.OwnerDocument.CreateElement('rect')
    $element.SetAttribute('x', $StartX)
    $element.SetAttribute('y', $StartY)
    $element.SetAttribute('width', $Width)
    $element.SetAttribute('height', $Height)

    $element.SetAttribute('stroke', $LineColor)
    $element.SetAttribute('stroke-width', $LineWidth)
    $element.SetAttribute('stroke-opacity', $LineOpacity)
    $element.SetAttribute('opacity', $FillOpacity)
    $element.SetAttribute('fill', $FillColor)

    $Svg.AppendChild($element) | Out-Null
}