function New-Svg {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute(
        "PSUseShouldProcessForStateChangingFunctions", 
        "", 
        Justification = "Creates in-memory object only."
    )]
    
    [CmdletBinding(DefaultParameterSetName='Individual')]
    param(
        [Parameter(ParameterSetName='Individual')]
        [ValidateNotNullOrEmpty()]
        [float]
        $StartX = -400
        ,
        [Parameter(ParameterSetName='Individual')]
        [ValidateNotNullOrEmpty()]
        [float]
        $StartY = -400
        ,
        [Parameter(ParameterSetName='Individual')]
        [ValidateNotNullOrEmpty()]
        [float]
        $Width = 800
        ,
        [Parameter(ParameterSetName='Individual')]
        [ValidateNotNullOrEmpty()]
        [float]
        $Height = 800
        ,
        [Parameter(ParameterSetName='Array')]
        [ValidateNotNullOrEmpty()]
        [hashtable]
        $Dimension
    )

    if ($PSCmdlet.ParameterSetName -ieq 'Array') {
        $StartX = $Dimension.x
        $StartY = $Dimension.y
        $Width  = $Dimension.width
        $Height = $Dimension.height
    }

    $Svg = New-Object System.XML.XMLDocument

    $root = $Svg.CreateElement('svg')
    $root.SetAttribute('version', '1.2')
    $root.SetAttribute('xmlns', 'http://www.w3.org/2000/svg')
    $root.SetAttribute('xmlns:xlink', 'http://www.w3.org/1999/xlink')
    $root.SetAttribute('width', "$Width")
    $root.SetAttribute('height', "$Height")
    $root.SetAttribute('viewBox', "$StartX $StartY $Width $Height")
    $Svg.AppendChild($root) | Out-Null
    
    $Svg
}