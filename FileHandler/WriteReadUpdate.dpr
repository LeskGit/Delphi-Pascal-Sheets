program WriteReadUpdate;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  fichier: Text;
  ligne: String;
begin
  Assign(fichier, 'C:\Users\Hacks\OneDrive\Documents\GitHub\Delphi-Pascal-Sheets\FileHandler\test.txt');
  Rewrite(fichier);
  Writeln(fichier, 'Bonjour, ceci est une ligne de texte.');
  Writeln(fichier, 'Deuxi�me ligne.');
  Close(fichier);

  Writeln('Fichier �crit, maintenant on le lit :');

  Assign(fichier, 'test.txt');
  Reset(fichier);
  while not eof(fichier) do
  begin
    Readln(fichier, ligne);
    Writeln('> ', ligne);
  end;
  Close(fichier);
  Readln;
end.

