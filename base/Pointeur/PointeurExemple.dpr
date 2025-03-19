program PointeurExemple;

{$APPTYPE CONSOLE}

uses
  System.SysUtils;

type
  TPersonne = record
    nom: String[50];
    age: Integer;
  end;

var
  i: Integer;
  ptrInt: ^Integer;             { Pointeur sur un entier }
  ptrTab: ^TArray<Integer>;     { Pointeur sur un tableau dynamique d'entiers }
  ptrPersonne: ^TPersonne;      { Pointeur sur un enregistrement TPersonne }
  ptrGen: Pointer;              { Pointeur générique }

begin
  { Pointeur sur un entier }
  new(ptrInt);  { Alloue de la mémoire pour un entier }
  ptrInt^ := 42;  { Affecte la valeur 42 à l'entier pointé par ptrInt }
  Writeln('Valeur de l''entier pointé par ptrInt : ', ptrInt^);
  dispose(ptrInt);  { Libère la mémoire allouée à ptrInt }

  { Pointeur sur un tableau d'entiers }
  new(ptrTab);  { Alloue de la mémoire pour un tableau dynamique }
  SetLength(ptrTab^, 5);  { Déclare un tableau dynamique de 5 éléments }

  ptrTab^[0] := 10;
  ptrTab^[1] := 20;
  ptrTab^[2] := 30;
  ptrTab^[3] := 40;
  ptrTab^[4] := 50;

  Writeln('Valeurs du tableau pointé par ptrTab : ');
  for i := 0 to 4 do
    Writeln('ptrTab^[' , i , '] = ', ptrTab^[i]);

  dispose(ptrTab);  { Libère la mémoire allouée au tableau dynamique }

  { Pointeur sur un enregistrement (struct-like) }
  new(ptrPersonne);  { Alloue de la mémoire pour un enregistrement TPersonne }
  ptrPersonne^.nom := 'Alice';
  ptrPersonne^.age := 30;

  Writeln('Nom : ', ptrPersonne^.nom);
  Writeln('Âge : ', ptrPersonne^.age);
  dispose(ptrPersonne);  { Libère la mémoire allouée à l'enregistrement }

  { Pointeur générique (Pointer) }
  new(ptrGen);  { Alloue de la mémoire générique }
  ptrInt := ptrGen;  { Assigne ptrGen à ptrInt }
  PInteger(ptrGen)^ := 100;  { Assigne la valeur 100 à l'entier pointé par ptrGen }
  Writeln('Valeur pointée par ptrGen : ', PInteger(ptrGen)^);
  dispose(ptrGen);  { Libère la mémoire allouée à ptrGen }
end.

