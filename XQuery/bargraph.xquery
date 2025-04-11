declare variable $disc1 := collection('../XML/Final/Disc1/?select=*.xml'); 
declare variable $disc2 := collection('../XML/Final/Disc2/?select=*.xml'); 
declare variable $disc3 := collection('../XML/Final/Disc3/?select=*.xml');
declare variable $discs := ($disc1, $disc2, $disc3); 
declare variable $xspacer := 1;
declare variable $yspacer := 25;
declare variable $scenes := $discs//scene;
<html>
  <head>
      <title>Lines of dialogue per Character per Scene</title>
       <link type="text/css" href="ff.css" rel="stylesheet" />
   </head>
   <body>
      <hr/>
      <!--#include virtual="mainmenu.html" -->
      <p>The graph here lets us see the number of times each character speaks. This is relevant
         to our research question, as it lets us see the impact that each character has on
         the story.</p><br/><p>Proportion of speeches per character per scene</p>
      <p >Cloud is Cyan</p>
      <p>Barret is Gray</p>
      <p>Tifa is Black</p>
      <p>Yuffie is Green</p>
      <p>Nanaki is Orange</p>
      <p>Vincent is Red</p>
      <p>Cid is Yellow</p>
      <p>Aerith is Pink</p>
      <p>Cait Sith is White</p>
      <p>Other Characters are Blue</p>
      <svg
            xmlns="http://www.w3.org/2000/svg"
            width="1100"
            height="1350">
            <g
                transform="translate(250,100)">
                <g>
                    <text
                        x="0"
                        y="-5"
                        font-family="sans-serif"
                        font-size="20px"
                        fill="white">Recurring Characters in Final Fantasy</text>
                </g>
                <g>
                    {
                        for $scene at $pos in $scenes
                        let $speeches := $scenes//Q{}sp
                        let $sceneName :=$scene/Q{}sp[1]/text()
                        let $barSize := 800
                            
                            let $count := $scene//Q{}speaker => count()
                            
                            let $CloudCount := $scene//Q{}sp/Q{}speaker[data(@name) = 'Cloud' or data(@name) = 'Little Cloud'] => count()
                            let $CloudPercent := $CloudCount div $count
                            let $CloudBar := $CloudPercent * $barSize
                            
                            let $TifaCount := $scene//Q{}sp/Q{}speaker[data(@name) = 'Tifa'] => count()
                            let $TifaPercent := $TifaCount div $count
                            let $TifaBar := $TifaPercent * $barSize
                            let $TifaBarStart := $CloudBar
                            
                            let $BarretCount := $scene//Q{}sp/Q{}speaker[data(@name) = 'Barret'] => count() 
                            let $BarretPercent := $BarretCount div $count
                            let $BarretBar := $BarretPercent * $barSize
                            let $BarretBarStart := $TifaBarStart + $TifaBar
                            
                            let $YuffieCount := $scene//Q{}sp/Q{}speaker[data(@name) = 'Yuffie'] => count()
                            let $YuffiePercent := $YuffieCount div $count
                            let $YuffieBar := $YuffiePercent * $barSize
                            let $YuffieBarStart := $BarretBarStart + $BarretBar
                            
                            let $NanakiCount := $scene//Q{}sp/Q{}speaker[data(@name) = 'Nanaki' or data(@name) = 'Red XIII'] => count() 
                            let $NanakiPercent := $NanakiCount div $count
                            let $NanakiBar := $NanakiPercent * $barSize
                            let $NanakiBarStart := $YuffieBarStart + $YuffieBar
                            
                            
                            let $VincentCount := $scene//Q{}sp/Q{}speaker[data(@name) = 'Vincent'] => count()
                            let $VincentPercent := $VincentCount div $count
                            let $VincentBar := $VincentPercent * $barSize
                            let $VincentBarStart := $NanakiBarStart + $NanakiBar
                            
                            let $CidCount := $scene//Q{}sp/Q{}speaker[data(@name) = 'Cid'] => count()
                            let $CidPercent := $CidCount div $count
                            let $CidBar := $CidPercent * $barSize
                            let $CidBarStart := $VincentBarStart + $VincentBar
                            
                            let $AerithCount := $scene//Q{}sp/Q{}speaker[data(@name) = 'Aerith' or data(@name) = 'Flower Girl'] => count()
                            let $AerithPercent := $AerithCount div $count
                            let $AerithBar := $AerithPercent * $barSize
                            let $AerithBarStart := $CidBarStart + $CidBar
                            
                            let $CaitSithCount := $scene//Q{}sp/Q{}speaker[data(@name) = 'Cait Sith'] => count()
                            let $CaitSithPercent := $CaitSithCount div $count
                            let $CaitSithBar := $CaitSithPercent * $barSize
                            let $CaitSithBarStart := $AerithBar + $AerithBarStart
                            
                            let $otherCount := $scene//Q{}sp/Q{}speaker[not(contains(@name, 'Cloud')) and not(contains(@name, 'Barret')) and not(contains(@name, 'Tifa')) and not(contains(@name, 'Yuffie')) and not(contains(@name, 'Nanaki')) and not(contains(@name, 'Vincent')) and not(contains(@name, 'Cid')) and not(contains(@name, 'Cait Sith')) and not(contains(@name, 'Aerith')) and not(contains(@name,'Red XIII')) and not(contains(@name, 'Flower Girl')) or (contains(@name,'Kid')) or not(contains(@name,',')) or not(contains(@name,'+'))] => count()
                            let $otherPercent := $otherCount div $count
                            let $otherBar := $otherPercent *$barSize
                            let $otherBarStart := $CaitSithBarStart + $CaitSithBar
                            return
                            <g>
                                <text
                                    x="-250"
                                    y="{$pos * $yspacer + 5}"
                                    font-family="sans-serif"
                                    font-size="12px"
                                    fill="white">{$sceneName}</text>
                                <line 
                                    x1="0"
                                    y1="{$pos * $yspacer}"
                                    x2="{$CloudBar * $xspacer}"
                                    y2="{$pos * $yspacer}"
                                    stroke="cyan"
                                    stroke-width="15"/>
                                                                <line 
                                    x1="{$TifaBarStart * $xspacer}"
                                    y1="{$pos * $yspacer}"
                                    x2="{$TifaBar * $xspacer +$TifaBarStart * $xspacer}"
                                    y2="{$pos * $yspacer}"
                                    stroke="black"
                                    stroke-width="15"/>
                                                                <line 
                                    x1="{$BarretBarStart * $xspacer}"
                                    y1="{$pos * $yspacer}"
                                    x2="{$BarretBar * $xspacer + $BarretBarStart * $xspacer}"
                                    y2="{$pos * $yspacer}"
                                    stroke="gray"
                                    stroke-width="15"/>
                                                                <line 
                                    x1="{$YuffieBarStart * $xspacer}"
                                    y1="{$pos * $yspacer}"
                                    x2="{$YuffieBar * $xspacer +$YuffieBarStart* $xspacer}"
                                    y2="{$pos * $yspacer}"
                                    stroke="green"
                                    stroke-width="15"/>
                                                                <line 
                                    x1="{$NanakiBarStart * $xspacer}"
                                    y1="{$pos * $yspacer}"
                                    x2="{$NanakiBar * $xspacer + $NanakiBarStart* $xspacer}"
                                    y2="{$pos * $yspacer}"
                                    stroke="orange"
                                    stroke-width="15"/>
                                                                <line 
                                    x1="{$VincentBarStart * $xspacer}"
                                    y1="{$pos * $yspacer}"
                                    x2="{$VincentBar * $xspacer +$VincentBarStart * $xspacer}"
                                    y2="{$pos * $yspacer}"
                                    stroke="red"
                                    stroke-width="15"/>                          
                                    <line 
                                    x1="{$CidBarStart * $xspacer}"
                                    y1="{$pos * $yspacer}"
                                    x2="{$CidBar * $xspacer + $CidBarStart * $xspacer}"
                                    y2="{$pos * $yspacer}"
                                    stroke="yellow"
                                    stroke-width="15"/>
                                                                <line 
                                    x1="{$AerithBarStart * $xspacer}"
                                    y1="{$pos * $yspacer}"
                                    x2="{$AerithBar * $xspacer + $AerithBarStart * $xspacer}"
                                    y2="{$pos * $yspacer}"
                                    stroke="pink"
                                    stroke-width="15"/>
                                                                <line 
                                    x1="{$CaitSithBarStart * $xspacer}"
                                    y1="{$pos * $yspacer}"
                                    x2="{$CaitSithBar * $xspacer + $CaitSithBarStart * $xspacer}"
                                    y2="{$pos * $yspacer}"
                                    stroke="white"
                                    stroke-width="15"/>
                                                                                                    <line 
                                    x1="{$otherBarStart * $xspacer}"
                                    y1="{$pos * $yspacer}"
                                    x2="{$otherBar * $xspacer + $otherBarStart * $xspacer}"
                                    y2="{$pos * $yspacer}"
                                    stroke="blue"
                                    stroke-width="15"/>
                                <line
                                    x1="0"
                                    y1="0"
                                    x2="0"
                                    y2="{max($pos + 1) * $yspacer}"
                                    stroke="white"
                                    stroke-width="2"/>
                            </g>
                    }
                </g>
            </g>
        </svg>      
      <p>Cloud is Cyan</p>
      <p>Barret is Gray</p>
      <p>Tifa is Black</p>
      <p>Yuffie is Green</p>
      <p>Nanaki is Orange</p>
      <p>Vincent is Red</p>
      <p>Cid is Yellow</p>
      <p>Aerith is Pink</p>
      <p>Cait Sith is White</p>
      <p>Other Characters are Blue</p>
    </body>
</html>