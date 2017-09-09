function Out-Xml {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [xml]
        $InputObject
    )

    process {
        $StringWriter = New-Object System.IO.StringWriter
        $XmlWriter = New-Object System.Xml.XmlTextWriter $StringWriter
        $XmlWriter.Formatting = "indented"

        $InputObject.WriteTo($XmlWriter)

        $XmlWriter.Flush()
        $StringWriter.Flush()

        $StringWriter.ToString().Replace(' xmlns=""', '')
    }
}