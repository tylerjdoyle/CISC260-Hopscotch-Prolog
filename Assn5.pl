%hopscotch(Squares,Best)
hopscotch(Squares,Best) :-
	setof(Path,legalPath(Squares,Path),ListOfPaths),
	bestPathOfList(ListOfPaths,Best).

%legalPath(Squares,Path) True if path is legal
legalPath([],[]).
legalPath([X],[X]).
legalPath([X,_|Rest],[X|Path]) :-
	legalPath(Rest,Path).
legalPath([X,_,_|Rest],[X|Path]) :-
	legalPath(Rest,Path).

%betterPath(Path1,Path2,Better) Returns the higher path
betterPath(Path1,Path2,Path1) :-
	sum_list(Path1,Sum1), sum_list(Path2,Sum2), Sum1 >= Sum2.
betterPath(Path1,Path2,Path2) :-
	sum_list(Path1,Sum1), sum_list(Path2,Sum2), Sum1 =< Sum2.

%bestPathOfList(ListOfPaths,Path) Path is the best path from ListOfPaths
bestPathOfList([X],X).
bestPathOfList([X,Y|Rest],Best) :-
	betterPath(X,Y,Better), bestPathOfList([Better|Rest],Best).
