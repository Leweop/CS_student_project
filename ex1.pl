left(1, 2).
left(2, 3).
left(3, 4).
left(4, 1).

front(X, Y) :- left(X, Z), left(Z, Y).

free([]).
free([H|T]) :- \+ member(H, T), free(T).

execute(Result) :-
    Pos = [PosWolf, PosNif, PosNaf, PosNuf],
    member(PosWolf, [1,2,3,4]),
    member(PosNif,  [1,2,3,4]),
    member(PosNaf,  [1,2,3,4]),
    member(PosNuf,  [1,2,3,4]),

    free(Pos),
    left(PosNaf, PosWolf),
    front(PosNaf, PosNuf),

    Fil = [FilWolf, FilNif, FilNaf, FilNuf],
    member(FilWolf, [flora, sports, space, fauna]),
    member(FilNif,  [flora, sports, space, fauna]),
    member(FilNaf,  [flora, sports, space, fauna]),
    member(FilNuf,  [flora, sports, space, fauna]),

    free(Fil),
    FilWolf = fauna,
    FilNuf \= sports,
    ( FilNif == space -> PosSpace = PosNif
    ; FilNaf == space -> PosSpace = PosNaf
    ; FilNuf == space -> PosSpace = PosNuf),
    left(PosNif, PosSpace),
    Result = [wolf(FilWolf), nif(FilNif), naf(FilNaf), nuf(FilNuf)].