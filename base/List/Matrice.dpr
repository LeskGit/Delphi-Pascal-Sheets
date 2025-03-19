program Matrice;

{$APPTYPE CONSOLE}

uses
  System.SysUtils;

const
  LIGNES = 3;
  COLONNES = 3;

type
  TTableau2D = array[1..LIGNES, 1..COLONNES] of Integer;

// Fonction qui calcule la somme des éléments d’un tableau 2D
function SommeMatrice(mat: TTableau2D): Integer;
var
  i, j, somme: Integer;
begin
  somme := 0;
  for i := 1 to LIGNES do
    for j := 1 to COLONNES do
      somme := somme + mat[i, j];
  SommeMatrice := somme;
end;

var
  mat: TTableau2D;
  i, j: Integer;
begin
  // Remplissage du tableau
  for i := 1 to LIGNES do
    for j := 1 to COLONNES do
      mat[i, j] := i * j; // Valeurs de test

  // Affichage du tableau
  Writeln('Matrice :');
  for i := 1 to LIGNES do
  begin
    for j := 1 to COLONNES do
      Write(mat[i, j]:4);  // Affichage formaté
    Writeln;
  end;

  // Affichage de la somme des éléments
  Writeln('Somme des éléments : ', SommeMatrice(mat));
  Readln;
end.

