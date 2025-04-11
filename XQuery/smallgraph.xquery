declare variable $disc1 := collection('../XML/Final/Disc1/?select=*.xml');
declare variable $disc2 := collection('../XML/Final/Disc2/?select=*.xml');
declare variable $disc3 := collection('../XML/Final/Disc3/?select=*.xml');
declare variable $discs := ($disc1, $disc2, $disc3);
declare variable $xspacer := .5;
declare variable $yspacer := 25;
declare variable $scenes := $discs//scene;
<svg
    xmlns="http://www.w3.org/2000/svg"
    width="2500"
    height="500">
    <g
        transform="translate(250,100)">

        <g>
            {
                let $speeches := $scenes//Q{}sp
                let $CloudCount := $scenes//Q{}sp/Q{}speaker[data(@name) = 'Cloud' or data(@name) = 'Little Cloud'] => count()
                let $TifaCount := $scenes//Q{}sp/Q{}speaker[data(@name) = 'Tifa'] => count()
                let $BarretCount := $scenes//Q{}sp/Q{}speaker[data(@name) = 'Barret'] => count()
                let $YuffieCount := $scenes//Q{}sp/Q{}speaker[data(@name) = 'Yuffie'] => count()
                let $NanakiCount := $scenes//Q{}sp/Q{}speaker[data(@name) = 'Nanaki' or data(@name) = 'Red XIII'] => count()
                let $VincentCount := $scenes//Q{}sp/Q{}speaker[data(@name) = 'Vincent'] => count()
                let $CidCount := $scenes//Q{}sp/Q{}speaker[data(@name) = 'Cid'] => count()
                let $AerithCount := $scenes//Q{}sp/Q{}speaker[data(@name) = 'Aerith' or data(@name) = 'Flower Girl'] => count()
                let $CaitSithCount := $scenes//Q{}sp/Q{}speaker[data(@name) = 'Cait Sith'] => count()
                let $otherCount := $scenes//Q{}sp/Q{}speaker[not(contains(@name, 'Cloud')) and not(contains(@name, 'Barret')) and not(contains(@name, 'Tifa')) and not(contains(@name, 'Yuffie')) and not(contains(@name, 'Nanaki')) and not(contains(@name, 'Vincent')) and not(contains(@name, 'Cid')) and not(contains(@name, 'Cait Sith')) and not(contains(@name, 'Aerith')) and not(contains(@name, 'Red XIII')) and not(contains(@name, 'Flower Girl')) or (contains(@name, 'Kid')) or not(contains(@name, ',')) or not(contains(@name, '+'))] => count()
                return
                    <g>
                        <line
                            x1="0"
                            y1="{10+0}"
                            x2="{$xspacer *$CloudCount}"
                            y2="{10+0}"
                            stroke="cyan"
                            stroke-width="15"/>
                        <text
                            x="{$xspacer *$CloudCount}"
                            y="{15+0}"
                            font-family="sans-serif"
                            font-size="12px"
                            fill="white">{$CloudCount}</text>
                                                    <line
                            x1="0"
                            y1="{10+25}"
                            x2="{$xspacer *$TifaCount}"
                            y2="{10+25}"
                            stroke="black"
                            stroke-width="15"/>
                        <text
                            x="{$xspacer *$TifaCount}"
                            y="{15+25}"
                            font-family="sans-serif"
                            font-size="12px"
                            fill="gray">{$TifaCount}</text>
                                                            <line
                            x1="0"
                            y1="{10+50}"
                            x2="{$xspacer *$BarretCount}"
                            y2="{10+50}"
                            stroke="grey"
                            stroke-width="15"/>
                        <text
                            x="{$xspacer *$BarretCount  }"
                            y="{15+50}"
                            font-family="sans-serif"
                            font-size="12px"
                            fill="white">{$BarretCount}</text>
                                                                                        <line
                            x1="0"
                            y1="{10+75}"
                            x2="{$xspacer *$YuffieCount}"
                            y2="{10+75}"
                            stroke="green"
                            stroke-width="15"/>
                        <text
                            x="{$xspacer *$YuffieCount  }"
                            y="{15+75}"
                            font-family="sans-serif"
                            font-size="12px"
                            fill="white">{$YuffieCount}</text>                                                            <line
                            x1="0"
                            y1="{10+100}"
                            x2="{$xspacer *$NanakiCount}"
                            y2="{10+100}"
                            stroke="orange"
                            stroke-width="15"/>
                        <text
                            x="{$xspacer *$NanakiCount }"
                            y="{15+100}"
                            font-family="sans-serif"
                            font-size="12px"
                            fill="white">{$NanakiCount}</text>
                                                                                        <line
                            x1="0"
                            y1="{10+125}"
                            x2="{$xspacer *$VincentCount}"
                            y2="{10+125}"
                            stroke="red"
                            stroke-width="15"/>
                        <text
                            x="{$xspacer *$VincentCount }"
                            y="{15+125}"
                            font-family="sans-serif"
                            font-size="12px"
                            fill="white">{$VincentCount}</text>
                                                                                        <line
                            x1="0"
                            y1="{10+150}"
                            x2="{$xspacer *$CidCount}"
                            y2="{10+150}"
                            stroke="yellow"
                            stroke-width="15"/>
                        <text
                            x="{$xspacer *$CidCount }"
                            y="{15+150}"
                            font-family="sans-serif"
                            font-size="12px"
                            fill="white">{$CidCount}</text>
                                                                                        <line
                            x1="0"
                            y1="{10+175}"
                            x2="{$xspacer *$AerithCount}"
                            y2="{10+175}"
                            stroke="pink"
                            stroke-width="15"/>
                        <text
                            x="{$xspacer *$AerithCount}"
                            y="{15+175}"
                            font-family="sans-serif"
                            font-size="12px"
                            fill="white">{$AerithCount}</text>
                                                                                        <line
                            x1="0"
                            y1="{10+200}"
                            x2="{$xspacer *$CaitSithCount}"
                            y2="{10+200}"
                            stroke="white"
                            stroke-width="15"/>
                        <text
                            x="{$xspacer *$CaitSithCount}"
                            y="{15+200}"
                            font-family="sans-serif"
                            font-size="12px"
                            fill="white">{$CaitSithCount}</text>
                            <line x1="0" x2="0"
                            y1="0"
                            y2="225"
                            stroke="white"
                            />
                    </g>
            }
        </g></g></svg>