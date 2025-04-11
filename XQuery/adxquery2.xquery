let $disc1 := collection('Final/Disc1/?select=*.xml') 
let $disc2 := collection('Final/Disc2/?select=*.xml') 
let $disc3 := collection('Final/Disc3/?select=*.xml') 
let $discs := ($disc1, $disc2, $disc3)
let $ff-speech := //scene//speaker
let $ff-speakers := $ff-speech/data(@name)=> distinct-values()
let $ff-speech-count := $ff-speech => count()
for $ff-spkr in $ff-speakers
let $spkr-speech-count := //speaker[./data(@name) = $ff-spkr] => count()
order by $spkr-speech-count descending
return (concat ("&#xa;", "In the Final Fantasy script, the character ", $ff-spkr, " speaks ", $spkr-speech-count, " times."))