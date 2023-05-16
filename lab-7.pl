%+MatrixNums,+I,+J,-NewMatrix
ch_middle(N,Rs11):-
    matrix_data(N,Rs),
    length(Rs, Length),
    writeln(Length),
    J is (Length+1)//2,
    I is (Length+1)//2,
    nth1(J,Rs,Rj),
    set_clm(Rs,I,Rj,Rs1,ClmI),
    set_el(Rs1,J,ClmI,Rs11).

%+Matrix,+I,+RowJ,-NewMatrix,-ColumnI
set_clm([R|Rs],I,[X|Rj],[R1|Rs1],[Xc|Clm]):-
    set_ret_el(R,I,X,R1,Xc),
    set_clm(Rs,I,Rj,Rs1,Clm).
set_clm([],_,[],[],[]).

%+List,+N,+NewNthEl,-NewList
set_el([X|Xs],I,El,[X|Xs1]):-
    I>1,I1 is I-1,
    set_el(Xs,I1,El,Xs1).
set_el([_|L],1,Term,[Term|L]).

%+Row,+I,+Xi,-NewRow,-ElForColumn
set_ret_el([X|Xs],I,Xi,[X|Xs1],Xc):-
    I>1,I1 is I-1,
    set_ret_el(Xs,I1,Xi,Xs1,Xc).
set_ret_el([Xc|Xs],1,Xi,[Xi|Xs],Xc).


matrix_data(1,[[0,0,3,0,0],
               [0,0,3,0,0],
               [2,2,23,2,2],
               [0,0,3,0,0],
               [0,0,3,0,0]]).
