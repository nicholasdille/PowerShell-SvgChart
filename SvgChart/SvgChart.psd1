@{
    RootModule = 'SvgChart.psm1'
    ModuleVersion = '0.5'
    GUID = 'dc0b8987-971b-4c70-b603-cdec585d0417'
    Author = 'Nicholas Dille'
    # CompanyName = ''
    Copyright = '(c) 2017 Nicholas Dille. All rights reserved.'
    Description = 'Cmdlets for creating chart in SVG'
    PowerShellVersion = '5.0'
    FunctionsToExport = @(
    	# Math
        'Get-CorrdinatesFromAngle'
        'Get-Radiant'

        # SVG
        'New-Svg'
        'Add-SvgBox'
        'Add-SvgCircle'
        'Add-SvgGroup'
        'Add-SvgLine'
        'Add-SvgPolyline'
        'Add-SvgSlice'
        'Add-SvgTest'

        #XML
        'Add-XmlComment'
        'Export-Xml'
        'Out-Xml'

        # Charts
        'Add-Axis'
        'Add-BarChart'
        'Add-BubbleChart'
        'Add-CategoryBarChart'
        'Add-LineChart'
        'Add-Marker'
        'Add-PieChart'
        'Add-RadarChart'
        'Add-StackedBarChart'
        'Add-StackedLineChart'
    )
    CmdletsToExport = ''
    VariablesToExport = ''
    #AliasesToExport = @()
    #FormatsToProcess = @()
    PrivateData = @{
        PSData = @{
            Tags = @(
                'Chart'
                'SVG'
            )
            LicenseUri = 'https://github.com/nicholasdille/PowerShell-SvgChart/blob/master/LICENSE'
            ProjectUri = 'https://github.com/nicholasdille/PowerShell-SvgChart'
            ReleaseNotes = 'https://github.com/nicholasdille/PowerShell-SvgChart/releases'
        }
    }
}
