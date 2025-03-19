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
  ptrGen: Pointer;              { Pointeur g�n�rique }

begin
  { Pointeur sur un entier }
  new(ptrInt);  { Alloue de la m�moire pour un entier }
  ptrInt^ := 42;  { Affecte la valeur 42 � l'entier point� par ptrInt }
  Writeln('Valeur de l''entier point� par ptrInt : ', ptrInt^);
  dispose(ptrInt);  { Lib�re la m�moire allou�e � ptrInt }

  { Pointeur sur un tableau d'entiers }
  new(ptrTab);  { Alloue de la m�moire pour un tableau dynamique }
  SetLength(ptrTab^, 5);  { D�clare un tableau dynamique de 5 �l�ments }

  ptrTab^[0] := 10;
  ptrTab^[1] := 20;
  ptrTab^[2] := 30;
  ptrTab^[3] := 40;
  ptrTab^[4] := 50;

  Writeln('Valeurs du tableau point� par ptrTab : ');
  for i := 0 to 4 do
    Writeln('ptrTab^[' , i , '] = ', ptrTab^[i]);

  dispose(ptrTab);  { Lib�re la m�moire allou�e au tableau dynamique }

  { Pointeur sur un enregistrement (struct-like) }
  new(ptrPersonne);  { Alloue de la m�moire pour un enregistrement TPersonne }
  ptrPersonne^.nom := 'Alice';
  ptrPersonne^.age := 30;

  Writeln('Nom : ', ptrPersonne^.nom);
  Writeln('�ge : ', ptrPersonne^.age);
  dispose(ptrPersonne);  { Lib�re la m�moire allou�e � l'enregistrement }

  { Pointeur g�n�rique (Pointer) }
  new(ptrGen);  { Alloue de la m�moire g�n�rique }
  ptrInt := ptrGen;  { Assigne ptrGen � ptrInt }
  PInteger(ptrGen)^ := 100;  { Assigne la valeur 100 � l'entier point� par ptrGen }
  Writeln('Valeur point�e par ptrGen : ', PInteger(ptrGen)^);
  dispose(ptrGen);  { Lib�re la m�moire allou�e � ptrGen }
end.

