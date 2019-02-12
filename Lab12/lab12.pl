% findall(+Template, +Goal, -Bag) - returneaza o lista cu elementele ce respecta un predicat (functioneaza ca un filter)
% avem o lista de elemente (Numbers in exemplul nostru), in  
% in findall, X (Template-ul adica) reprezinta un element din Numbers, noi iterand (recursiv) prin lista respectiva
% Goal reprezinta condtia de filtrare a listei, iar Even (adica Bag-ul din findall) reprezinta lista filtrata cu ajutorul conditiei din findall
even(Numbers, Even) :- findall(X,(member(X, Numbers), X mod 2 =:= 0), Even).

% negatia in Prolog
curva(saracin).
bagaboanta(saracin).
fataOK(X) :- \+ curva(X), \+ bagaboanta(X).

% fail - predicat care esueaza mereu, il folosim pentru a elimina efectele laterale facute de predicatele satisfacute pana la fail
% cut - taie ramuri din cautarea backtracking la incercarea de a satisface un predicat => duce la optimizarea cautarii

% bagof(+Template, +Goal, -Bag) - e ca la findall, numai ca folosim o lista in plus de care va depinde conditia de filtrare pentru a obtina listele finale (aici avem mai multe)
digits([1,2,3,4,5,6,7,8,9]).
numbers([4,7,9,14,15,18,24,28,33,35]).
multiples(D,L):-
    digits(Digits),
    numbers(Numbers),
    bagof(N,(member(D, Digits), member(N, Numbers), N mod D =:= 0), L).

% setof(+Template, +Goal, -Bag) - e ca la bagof, doar sa listele sunt sortate si duplicatele sunt eliminate

multiples2(D,L):-
    digits(Digits),
    numbers(Numbers),
    setof(N,(member(D, Digits), member(N, Numbers), N mod D =:= 0), L).