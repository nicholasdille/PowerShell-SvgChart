function Add-LineChart {
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
        $Width = 1
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]
        $Color = 'black'
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [float]
        $Opacity = 1
    )

    Add-SvgLine $Svg -Points $Data -Color $Color -Width $Width -Opacity $Opacity
}