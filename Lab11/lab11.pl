% findall(+Template, +Goal, -Bag) - returneaza o lista cu elementele ce respecta un predicat (functioneaza ca un filter)
% avem o lista de elemente (Numbers in exemplul nostru), in  
% in findall, X (Template-ul adica) reprezinta un element din Numbers, noi iterand (recursiv) prin lista respectiva
% Goal reprezinta condtia de filtrare a listei, iar Even (adica Bag-ul din findall) reprezinta lista filtrata cu ajutorul conditiei din findall
even(Numbers, Even) :- findall(X,(member(X, Numbers), X mod 2 =:= 0), Even).