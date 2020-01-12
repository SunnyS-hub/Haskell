paths(X,Y, D) :-
	X = Y.
paths(X,Y,Paths) :-
	dist(X,Z,_),
	dist(Z,Y,_),
	append([Z], [X] , Paths).
	%paths_between(Z,Y).


neighbour_dist(c1,c2,4).
neighbour_dist(c1,c3,10).
neighbour_dist(c1,c5,2).
neighbour_dist(c2,c1,4).
neighbour_dist(c2,c5,1).
neighbour_dist(c2,c4,6).
neighbour_dist(c2,c6,1).
neighbour_dist(c3,c1,10).
neighbour_dist(c3,c5,2).
neighbour_dist(c3,c4,1).
neighbour_dist(c4,c5,8).
neighbour_dist(c4,c2,6).
neighbour_dist(c4,c3,1).
neighbour_dist(c5,c1,2).
neighbour_dist(c5,c2,1).
neighbour_dist(c5,c3,2).
neighbour_dist(c5,c4,8).
neighbour_dist(c6,c2,1).


all_paths_between(CX,CY,Path) :-
	move(CX,CY,[CX],P),
	reverse(P,Path).

move(CX,CY,P,[CY|P]) :-
	neighbour_dist(CX,CY,_).

move(CX,CY,Seen,Path) :-
	neighbour_dist(CX,C,_),
	C \== CY,
	\+member(C,Seen),
	move(C,CY,[C|Seen],Path).

s_path_between(u,u,Tpath,sX) :-
	write(Tpath),
	write(X).
s_path_between(CX,CY,Path,X) :-
	all_paths_between(CX,CY,P),
	[Head|Tail] = P,
	[H|T] = Tail,
	neighbour_dist(Head, H, U),
	s_path_between(u,u,Tail,U).

sum([],0).
sum([H|T], L) :-
	sum(T,LN),
	L is LN + H.

short_path_between(CX,CY,Path,Leng) :-
	move(CX,CY,[CX],P,[0],Len),
	reverse(P,Path),
	sum(Len,Leng).

move(CX,CY,P,[CY|P],L,[Z|L]) :-
	neighbour_dist(CX,CY,Z).

move(CX,CY,Seen,Path,Ind,Len) :-
	neighbour_dist(CX,C,Z),
	C \== CY,
	\+member(C,Seen),
	move(C,CY,[C|Seen],Path, [Z|Ind], Len).
