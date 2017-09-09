function Add-PieChart {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        #[ValidateNotNullOrEmpty()]
        [System.Xml.XmlElement]
        $Svg
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [array]
        $Data
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [float]
        $x
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [float]
        $y
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [float]
        $Radius
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
    $StartAngle = 0
    foreach ($item in $Data) {
        $EndAngle = $StartAngle + ($item / 100 * 360)

        Add-SvgSlice $svg -CenterX $x -CenterY $y -Radius $Radius -StartAngle $StartAngle -EndAngle $EndAngle -LineWidth $LineWidth -LineColor 'Grey' -LineOpacity $LineOpacity -FillColor $ColorScheme[$ColorIndex] -FillOpacity $FillOpacity

        $StartAngle = $EndAngle
        ++$ColorIndex
    }
}