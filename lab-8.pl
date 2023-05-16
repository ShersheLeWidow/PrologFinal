:- dynamic
    point/3.

%?Point_Sign, ?Abscissa, ?Ordinate
db_filling:-
    point(_,_,_),!.
db_filling:-
    assert(point(a,1,1)),
    assert(point(b,2,2)),
    assert(point(c,1,3)),
    assert(point(e,0,0)),
    assert(point(f,3,0)).

points_main(R1,X1,Y1,R2,X2,Y2,Res):-
    db_filling,
    findall(P,inside(R1,X1,Y1,R2,X2,Y2,P),Res).

inside(R1,X1,Y1,R2,X2,Y2,P):-
    point(P,X,Y),
    R1*R1 >= (X-X1)*(X-X1) + (Y-Y1)*(Y-Y1),
    R2*R2 < (X-X2)*(X-X2) + (Y-Y2)*(Y-Y2).

inside(R1,X1,Y1,R2,X2,Y2,P):-
    point(P,X,Y),
    R1*R1 < (X-X1)**2 + (Y-Y1)**2,
    R2*R2 >= (X-X2)**2 + (Y-Y2)**2.
