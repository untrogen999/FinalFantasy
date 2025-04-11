declare variable $disc1 := collection('Final/Disc1/?select=*.xml');
declare variable $disc2 := collection('Final/Disc2/?select=*.xml');
declare variable $disc3 := collection('Final/Disc3/?select=*.xml');
declare variable $discs := ($disc1, $disc2, $disc3);
declare variable $xspacer := 10;
declare variable $yspacer := 25;
declare variable $ff-speakers := //speaker[data(@name)] => distinct-values();


<svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">
    <g transform="translate(150,100)">
    <g>
    <text x="0" y="-5" font-family="sans-serif" font-size="20px" fill="black">Number of Times Spoken in Final Fantasy VII</text>
    </g>
    <g>
    {
    for $ff-spkr at $pos in $ff-speakers
    let $ff-speech := $discs//Q{}scene//Q{}speaker
    let $ff-speakers := $ff-speech/data(@name)=> distinct-values()
    let $ff-speech-count := $ff-speech => count()
    for $ff-spkr in $ff-speakers
    let $spkr-speech-count := $discs//Q{}speaker[./data(@name) = $ff-spkr] => count()
    order by $spkr-speech-count descending
    return
    <g>
                <text x="-75" y="{$pos * $yspacer + 5}" font-family="sans-serif" font-size="12px" fill="black">{$ff-spkr}</text>
                <line x1="0" y1="{$pos * $yspacer}" x2="{$spkr-speech-count * $xspacer}" y2="{$pos * $yspacer}" stroke="blue" stroke-width="15"/>
                <text x="{$spkr-speech-count * $xspacer + 10}" y="{$pos * $yspacer + 5}" font-family="sans-serif" font-size="12px" fill="black">{$spkr-speech-count}</text>
                <line x1="0" y1="0" x2="0" y2="{max($pos +1) * $yspacer}" stroke="black" stroke-width="2"/>
                </g>
    }
    </g>
    </g>
</svg>