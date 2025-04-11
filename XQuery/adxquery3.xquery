declare variable $disc1 := collection('Final/Disc1/?select=*.xml');
declare variable $disc2 := collection('Final/Disc2/?select=*.xml');
declare variable $disc3 := collection('Final/Disc3/?select=*.xml');
declare variable $discs := ($disc1, $disc2, $disc3);

<html>
<table>
<tr><th>Speaker</th><th>Speeches</th></tr> 

{
let $ff-speech := $discs//scene//speaker
let $ff-speakers := $ff-speech/data(@name)=> distinct-values()
let $ff-speech-count := $ff-speech => count()
for $ff-spkr in $ff-speakers
let $spkr-speech-count := $discs//speaker[./data(@name) = $ff-spkr] => count()
order by $spkr-speech-count descending
return
<tr><td>{$ff-spkr}</td> <td>{$spkr-speech-count}</td></tr>
}
</table>
</html>