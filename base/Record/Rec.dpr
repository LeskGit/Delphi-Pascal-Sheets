program Rec;

{$APPTYPE CONSOLE}

{$R *.res}

type
  TAdresse = record
    rue: String[50];
    ville: String[30];
    codePostal: String[10];
  end;

  TEtudiant = record
    id: Integer;
    nom: String[30];
    age: Integer;
    adresse: TAdresse;
  end;

const
  MaxEtudiants = 5;  { Taille maximale du tableau }

var
  etudiants: array[1..MaxEtudiants] of TEtudiant;
  nbEtudiants: Integer = 0;
  fichier: File of TEtudiant;

{ Procédure pour ajouter un étudiant }
procedure AjouterEtudiant(var liste: array of TEtudiant; var nb: Integer);
var
  e: TEtudiant;
begin
  if nb >= Length(liste) then
  begin
    Writeln('Impossible d''ajouter plus d''étudiants.');
    Exit;
  end;

  Inc(nb);
  e.id := nb;
  Write('Nom : '); Readln(e.nom);
  Write('Âge : '); Readln(e.age);
  Write('Rue : '); Readln(e.adresse.rue);
  Write('Ville : '); Readln(e.adresse.ville);
  Write('Code Postal : '); Readln(e.adresse.codePostal);

  liste[nb] := e;
end;

{ Procédure pour afficher un étudiant }
procedure AfficherEtudiant(e: TEtudiant);
begin
  Writeln('--------------------');
  Writeln('ID : ', e.id);
  Writeln('Nom : ', e.nom);
  Writeln('Âge : ', e.age);
  Writeln('Adresse : ', e.adresse.rue, ', ', e.adresse.ville, ' (', e.adresse.codePostal, ')');
  Writeln('--------------------');
end;

{ Procédure pour afficher tous les étudiants }
procedure AfficherTousEtudiants(liste: array of TEtudiant; nb: Integer);
var
  i: Integer;
begin
  if nb = 0 then
    Writeln('Aucun étudiant enregistré.')
  else
    for i := 1 to nb do
      AfficherEtudiant(liste[i]);
end;

{ Procédure pour enregistrer les étudiants dans un fichier }
procedure SauvegarderEtudiants(liste: array of TEtudiant; nb: Integer);
var
  i: Integer;
begin
  Assign(fichier, 'etudiants.dat');
  Rewrite(fichier);

  for i := 1 to nb do
    Write(fichier, liste[i]);

  Close(fichier);
  Writeln('Les étudiants ont été sauvegardés.');
end;

{ Procédure pour charger les étudiants depuis un fichier }
procedure ChargerEtudiants(var liste: array of TEtudiant; var nb: Integer);
var
  e: TEtudiant;
begin
  Assign(fichier, 'etudiants.dat');
  Reset(fichier);

  nb := 0;
  while not Eof(fichier) and (nb < Length(liste)) do
  begin
    Read(fichier, e);
    Inc(nb);
    liste[nb] := e;
  end;

  Close(fichier);
  Writeln('Les étudiants ont été chargés depuis le fichier.');
end;

{ Programme principal }
var
  choix: Integer;
begin
  ChargerEtudiants(etudiants, nbEtudiants);

  repeat
    Writeln('--- MENU ---');
    Writeln('1. Ajouter un étudiant');
    Writeln('2. Afficher tous les étudiants');
    Writeln('3. Sauvegarder les étudiants');
    Writeln('4. Quitter');
    Write('Choix : ');
    Readln(choix);

    case choix of
      1: AjouterEtudiant(etudiants, nbEtudiants);
      2: AfficherTousEtudiants(etudiants, nbEtudiants);
      3: SauvegarderEtudiants(etudiants, nbEtudiants);
    end;

  until choix = 4;

  Writeln('Programme terminé.');
  Readln;
end.

