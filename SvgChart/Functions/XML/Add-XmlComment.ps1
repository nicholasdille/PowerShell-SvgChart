function Add-XmlComment {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        #[ValidateNotNullOrEmpty()]
        [System.Xml.XmlElement]
        $Element
        ,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Comment
    )

    $e = $Element.OwnerDocument.CreateComment($Comment)
    $Element.AppendChild($e) | Out-Null
}