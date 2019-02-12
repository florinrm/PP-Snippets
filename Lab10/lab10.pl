% in Prolog, avem predicate, adica niste statement-ul, propozitii sau fapte
% in fisierul Prolog, predicatele care se afla aici sunt adevarate, iar cele care NU se afla sunt automat false

areMere(anca). % A NU SE UITA DE . (PUNCT) IN PROLOG, PENTRU A MARCA INCHEIEREA UNUI STATEMENT / PREDICAT
% valorile / constantele incep cu litera mica
% variabilele incep cu litera mare

esteCancer(decebal).
esteProasta(saracin).

% structuri - avem fapte ca variabile, care se comporta aici ca simple variabile
combinatieFatala(esteCancer(decebal), esteProasta(saracin)).

esteBunaciune(andreea).
ascultaManele(andreea).
ascultaManele(malone).
nuEsteProfitoare(andreea).

arePapuciGucci(abi).
bateRoacheri(abi).

% regula - un set de fapte
fataViselor(X) :- esteBunaciune(X), ascultaManele(X), nuEsteProfitoare(X).
morZdreteleDupaMine(Y) :- arePapuciGucci(Y), bateRoacheri(Y).
combinatieFatala(X, Y) :- esteCancer(X), esteProasta(Y). % avem warning cu Clauses of combinatieFatala/2 are not together in the source-file

% backtrackingul sta la baza interogarilor in swipl de fapte
% operatorii =:= si is forteaza evaluarea expresiilor, pe cand = verifica egalitatea structurala

% liste in Prolog
% [] - lista vida
% [a, b, c] - lista cu elementele a, b, c
% [Head | Tail] - lista cu primul element Head si cu restul elementelor in Tail
% [A, B, C, D | Tail] - lista formata prin adaugarea A, B, C, D in fata listei Tail

% argumentele predicatelor
% predicat (+Arg1, -Arg2, ?Arg3).
% + = parametru de intrare, instantiat cand se incearca satisfacerea predicatului
% - = parametru de iesire, instantiat cand este satisfacut predicatul
% ? = poate fi parametru de intrare sau de iesire

%list_length(+Lista, -Lungime)
list_length([], 0). % mai intai facem cazul de baza pentru backtracking / recursivitate
list_length([_ | Tail], N) :- list_length(Tail, N1), N is N1 + 1. % continuam cautarea
% de ce nu punem Head in loc de _? vom avea warning cu Singleton variables, pt ca Head nu este folosit aici => folosim _, la caz general

is_member(X, [X | _]). % caz de baza
is_member(X, [_ | Tail]) :- is_member(X, Tail). % continuam cautarea

