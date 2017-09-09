function Add-StackedBarChart {
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

    for ($i = 0; $i -lt $Data[0].Length; ++$i) {
        $y = 0
        $ColorIndex = 0
        foreach ($item in $Data) {
            $element = $Svg.OwnerDocument.CreateElement('rect')
            $Svg.AppendChild($element) | Out-Null

            $element.SetAttribute('x', ( $item[$i].x - $Width / 2 ))
            $element.SetAttribute('y', $y)
            $element.SetAttribute('width', $Width)
            $element.SetAttribute('height', $item[$i].y)

            $element.SetAttribute('stroke', $ColorScheme[$ColorIndex])
            $element.SetAttribute('stroke-width', $LineWidth)
            $element.SetAttribute('stroke-opacity', $LineOpacity)
            $element.SetAttribute('fill', $ColorScheme[$ColorIndex])
            $element.SetAttribute('opacity', $FillOpacity)

            $y += $item[$i].y
            ++$ColorIndex
        }
    }
}