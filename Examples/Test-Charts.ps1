Get-ChildItem -Path "$PSScriptRoot\..\SvgChart" -Filter '*.ps1' -Recurse -File | ForEach-Object {
    #$_.FullName
    . "$($_.FullName)"
}

$Data1 = @(
    @{ x =   0; y =  10 }
    @{ x = 100; y = 300 }
    @{ x = 200; y = 150 }
)
$Data2 = @(
    @{ x =  50; y = -30 }
    @{ x = 150; y = 100 }
    @{ x = 250; y = 300 }
)

$svg = New-Svg -StartX -400 -StartY -500 -Height 700 -Width 1500

Add-SvgText $svg.svg -Anchor @{ x = 200; y = -100; anchor = 'middle' } -Text 'Foobar'

# Create group for flipping y axis
Add-XmlComment -Element $svg.svg -Comment 'Group for transformation of y axis'
$g = Add-SvgGroup -Svg $svg.svg -Transform 'scale(1 -1)' -PassThru

Add-XmlComment -Element $g -Comment 'Axis'
Add-Axis -Svg $g -Data $Data1 -MinX -100 -MaxX 1000 -MinY -100 -MaxY 250 -SpacingX 100 -SpacingY 50

Add-XmlComment -Element $g -Comment 'Line charts'
Add-LineChart $g -Data $Data1
Add-LineChart $g -Data $Data2

Add-XmlComment -Element $g -Comment 'Marker for line charts'
Add-Marker $g -Data $Data1
Add-Marker $g -Data $Data2

Add-XmlComment -Element $g -Comment 'Bar charts'
Add-BarChart $g -Data $Data1 -FillOpacity 0.25
Add-BarChart $g -Data $Data2 -FillOpacity 0.25

Add-XmlComment -Element $g -Comment 'Pie charts'
Add-PieChart $g -Data @(20, 25, 30, 5, 20) -x 350 -y 150 -Radius 45

Add-XmlComment -Element $g -Comment 'Bubble charts'
Add-BubbleChart $g -Data @(
    @{ x =  50; y =  50; z = 15 }
    @{ x = 150; y = -50; z = 35 }
    @{ x = 300; y =  60; z = 25 }
)

Add-XmlComment -Element $g -Comment 'Category bar charts'
Add-CategoryBarChart $g -Data @(
    @(
        @{ x = 450; y = 30 }
        @{ x = 500; y = 20 }
        @{ x = 550; y = 35 }
    ),
    @(
        @{ x = 450; y = 50 }
        @{ x = 500; y = 10 }
        @{ x = 550; y = 45 }
    ),
    @(
        @{ x = 450; y = 45 }
        @{ x = 500; y = 60 }
        @{ x = 550; y = 55 }
    )
)

Add-XmlComment -Element $g -Comment 'Stacked bar charts'
Add-StackedBarChart $g -Data @(
    @(
        @{ x = 650; y = 30 }
        @{ x = 675; y = 20 }
        @{ x = 700; y = 45 }
    ),
    @(
        @{ x = 650; y = 20 }
        @{ x = 675; y = 10 }
        @{ x = 700; y = 60 }
    ),
    @(
        @{ x = 650; y = 35 }
        @{ x = 675; y = 45 }
        @{ x = 700; y = 55 }
    )
)

Add-XmlComment -Element $g -Comment 'Stacked line charts'
Add-StackedLineChart $g -Data @(
    @(
        @{ x = 850; y = 30 }
        @{ x = 900; y = 20 }
        @{ x = 950; y = 45 }
    ),
    @(
        @{ x = 850; y = 20 }
        @{ x = 900; y = 10 }
        @{ x = 950; y = 60 }
    ),
    @(
        @{ x = 850; y = 35 }
        @{ x = 900; y = 45 }
        @{ x = 950; y = 55 }
    )
)

Add-XmlComment -Element $g -Comment 'radar charts'
Add-RadarChart $g -CenterX 600 -CenterY 150 -MaximumX 5 -MaximumY 7 -Spacing 15 -Data @(
    @{ x = 1; y = 2 }
    @{ x = 2; y = 3 }
    @{ x = 3; y = 6 }
    @{ x = 4; y = 1 }
    @{ x = 5; y = 3 }
)

# Fix for text
$svg.SelectNodes('/svg/g//text') | ForEach-Object {
    $_.SetAttribute('transform', "scale(1 -1)")
    $y = $_.y
    $_.SetAttribute('y', ( -1 * $y ) )
}

#Out-Xml $svg
Export-Xml -Xml $svg -Path "$PSScriptRoot\Test.svg"
#& "$PSScriptRoot\New-LineChart.svg"