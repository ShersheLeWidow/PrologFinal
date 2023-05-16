%+List,-New List
lists_pro_main1(L,L1):-
    length(L,N),
    K2 is N//4+1,
    K3 is N//2+1,
    K4 is 3*N//4+1,
    parts(L,1,K2,K3,K4,P1,P2,P3),
    reverse(P1,P1rev),
    append(P1rev,P2,P12),
    append(P12,P3,L1).

parts([X|Xs],I,K2,K3,K4,[X|P1],P2,P3):-
% 1st quarter
    I<K2,
    I1 is I+1,
    parts(Xs,I1,K2,K3,K4,P1,P2,P3).

parts([X|Xs],I,K2,K3,K4,P1,[X|P2],P3):-
% 2nd quarter
    I>=K2, I<K3,
    I1 is I+1,
    parts(Xs,I1,K2,K3,K4,P1,P2,P3).

parts([X|Xs],I,K2,K3,K4,P1,P2,[X|P3]):-
% 3rd quarter
    I>=K3, I<K4,
    I1 is I+1,
    parts(Xs,I1,K2,K3,K4,P1,P2,P3).

parts(_,K4,_,_,K4,[],[],[]). % 4th quarter



list(L, LExit):-
    length(L,N),
    K1 is N/3 + 1,
    K2 is 2*N/3 + 1,

    part(L, 1, K1, K2,P1,P2,P3),

    append(P1, P2, P12),
    reverse(P3, P3rev),
    append(P12, P3rev, LExit).


part([H|T],I,K1,K2,[H|P1],P2,P3):-
    I < K1,
    I1 is I + 1,
    part(T,I1,K1,K2,P1,P2,P3).

part([H|T],I,K1,K2,P1,[H|P2],P3):-
    I >= K1, I < K2,
    I1 is I + 1,
    part(T,I1,K1,K2,P1,P2,P3).

part(T,K2,_,K2,[],[],T).








