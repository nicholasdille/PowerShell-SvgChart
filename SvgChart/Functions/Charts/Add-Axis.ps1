function Add-Axis {
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
        [float]
        $MinX = -400
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [float]
        $MaxX = 400
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [float]
        $MinY = -400
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [float]
        $MaxY = 400
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [float]
        $SpacingX = 50
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [float]
        $SpacingY = 50
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
        $LineOpacity = 0.75
    )

    Add-SvgLine $Svg -Points @(
        @{ x = 0; y = $MinY }
        @{ x = 0; y = $MaxX }
    )
    for ($i = $SpacingY; $i -le $MaxY; $i += $SpacingY) {
        Add-SvgLine $Svg -Points @(
            @{ x =-2; y = $i }
            @{ x = 2; y = $i }
        )
    }
    Add-SvgText $svg -Anchor @{ x = 900; y = -16; anchor = 'middle' } -Text '900'

    Add-SvgLine $Svg -Points @(
        @{ x = $MinX; y = 0 }
        @{ x = $MaxX; y = 0 }
    )
    for ($i = $SpacingX; $i -le $MaxX; $i += $SpacingX) {
        Add-SvgLine $Svg -Points @(
            @{ x = $i; y = -2 }
            @{ x = $i; y =  2 }
        )
    }
    Add-SvgText $svg -Anchor @{ x = -16; y = 200; anchor = 'end' } -Text '1'
}