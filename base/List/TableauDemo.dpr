program TableauDemo;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

const
  TAILLE = 5; // D�finition d'une constante pour un tableau statique

type
  TTableauEntier = array[1..TAILLE] of Integer; // D�finition d'un type de tableau statique

// Proc�dure pour afficher un tableau
procedure AfficherTableau(tab: TTableauEntier);
var
  i: Integer;
begin
  Writeln('Contenu du tableau :');
  for i := 1 to TAILLE do
    Write(tab[i], ' ');
  Writeln; // Nouvelle ligne
end;

// Fonction qui calcule la somme des �l�ments d'un tableau
function SommeTableau(tab: TTableauEntier): Integer;
var
  i, somme: Integer;
begin
  somme := 0;
  for i := 1 to TAILLE do
    somme := somme + tab[i];
  SommeTableau := somme; // Retourne la somme
end;

var
  tabStatique: TTableauEntier; // Tableau statique
  tabDynamique: array of Integer; // Tableau dynamique
  i: Integer;
begin
  try
    // ====== Initialisation du tableau statique ======
    Writeln('Initialisation du tableau statique...');
    for i := 1 to TAILLE do
      tabStatique[i] := i * 2; // Remplit le tableau avec des valeurs

    // Affichage du tableau statique
    AfficherTableau(tabStatique);

    // Calcul de la somme des �l�ments du tableau
    Writeln('Somme des �l�ments : ', SommeTableau(tabStatique));

    // ====== Initialisation d'un tableau dynamique ======
    Writeln('Initialisation du tableau dynamique...');
    SetLength(tabDynamique, TAILLE); // D�finition de la taille du tableau dynamique

    for i := 0 to High(tabDynamique) do
      tabDynamique[i] := (i + 1) * 3; // Remplit le tableau dynamique

    // Affichage du tableau dynamique
    Writeln('Contenu du tableau dynamique :');
    for i := 0 to High(tabDynamique) do
      Write(tabDynamique[i], ' ');
    Writeln;

    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.

