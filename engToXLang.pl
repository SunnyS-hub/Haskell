french(john, john).
french(is, est).
french(mad, fau). 
french(hello, bonjour).
french(happy, heureux).
french(kate, kate). 
french(loves, aime).
french(has, a).
french(that, que).
french(apples, pommes).
french(good, bonne).
french(the, la).
french(music, musique).
french(hates, deteste).


translate_eng([], Fr) :- 
	write(Fr),
	reverse(Fr,Fr).
translate_eng(List, Fr) :-
	[Head|Tail] = List, 
	french(Head, A),
	append([A], Fr, C),
	translate_eng(Tail, C).
