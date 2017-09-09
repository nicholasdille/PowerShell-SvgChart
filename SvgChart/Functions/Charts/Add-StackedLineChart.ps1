function Add-StackedLineChart {
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

    for ($CurrentSeries = 0; $CurrentSeries -lt $Data.Length; ++$CurrentSeries) {

        $LowerPoints = @()
        $UpperPoints = @()
        for ($i = 0; $i -lt $Data[$CurrentSeries].Length; ++$i) {
            $x = $Data[$CurrentSeries][$i].x

            $y = 0
            for ($j = 0; $j -lt ($CurrentSeries); ++$j) {
                $y += $Data[$j][$i].y
            }

            $LowerPoints += @{ x = $x; y = $y }
            $y2 = $Data[$CurrentSeries][$i].y
            $UpperPoints += @{ x = $x; y = $($y + $y2) }
        }

        # create line with fill
        [array]::Reverse($UpperPoints)
        $Points = $LowerPoints + $UpperPoints

        Add-SvgLine $svg -Points $Points -Color $ColorScheme[$CurrentSeries] -Width $LineWidth -Opacity $LineOpacity -FillColor $ColorScheme[$CurrentSeries]
    }
}