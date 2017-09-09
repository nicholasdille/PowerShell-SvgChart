function Add-SvgGroup {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        #[ValidateNotNullOrEmpty()]
        [System.Xml.XmlElement]
        $Svg
        ,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]
        $Transform
        ,
        [Parameter()]
        [switch]
        $PassThru
    )

    $element = $Svg.OwnerDocument.CreateElement('g')
    $element.SetAttribute('transform', $Transform)
    $Svg.AppendChild($element) | Out-Null

    if ($PassThru) {
        $element
    }
}