declare option saxon:output "method=text";
declare variable $disc1 := collection('../XML/Final/Disc1/?select=*.xml'); 
declare variable $disc2 := collection('../XML/Final/Disc2/?select=*.xml'); 
declare variable $disc3 := collection('../XML/Final/Disc3/?select=*.xml');
declare variable $discs := ($disc1, $disc2, $disc3); 
let $ff-speech := $discs//scene//sp
let $ff-speakers := $ff-speech/speaker/data(@name)=> distinct-values()
for $ff-spkr in $ff-speakers

let $ff-speeches-per := $discs//scene//sp[./speaker/data(@name)= $ff-spkr]
/string() ! normalize-space()
for $ff-spch-pr in $ff-speeches-per

let $referents := $ff-speech[./string() ! normalize-space() = $ff-spch-pr]
//referent/data(@name) ! normalize-space() => distinct-values()
for $r in $referents

return concat($ff-spkr, "&#x9;", "Speaker", "&#x9;", $ff-spch-pr, "&#x9;", 
$r, "&#x9;", "Referent", "&#10;")
