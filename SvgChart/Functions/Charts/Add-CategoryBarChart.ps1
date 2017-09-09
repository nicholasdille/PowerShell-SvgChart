function Add-CategoryBarChart {
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
        $Data
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [int]
        $Width = 10
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [int]
        $Spacing = 2
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

    $ColorScheme = @( 'Red', 'Blue', 'Yellow', 'Green', 'Grey' )

    $ColorIndex = 0
    for ($i = 0; $i -lt $Data[0].Length; ++$i) {
        foreach ($item in $Data[$i]) {
            $element = $Svg.OwnerDocument.CreateElement('rect')
            $Svg.AppendChild($element) | Out-Null

            $x = $item.x - $Data[$i].Length * $Width / 2 + $i * $Width

            $element.SetAttribute('x', $x)
            $element.SetAttribute('y', 0)
            $element.SetAttribute('width', $Width)
            $element.SetAttribute('height', $item.y)

            $element.SetAttribute('stroke', $ColorScheme[$ColorIndex])
            $element.SetAttribute('stroke-width', $LineWidth)
            $element.SetAttribute('stroke-opacity', $LineOpacity)
            $element.SetAttribute('fill', $ColorScheme[$ColorIndex])
            $element.SetAttribute('opacity', $FillOpacity)

        }

        ++$ColorIndex
    }
}