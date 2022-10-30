program Lab5;

{$APPTYPE CONSOLE}

uses
  SysUtils, Windows;

const Nmax = 20;
const inputPATH = 'input3.txt';
const outputPATH = 'output.txt';

var
  A: array[1..Nmax] of Integer;
  N, S, Smin, Mmin, M, i: Integer;
  f: TextFile;

begin
  SetConsoleOutputCP(1251);

  AssignFile(f, inputPATH);
  Reset(f);

  ReadLn(f, N);

  ReadLn(f);

  for i := 1 to N do
    ReadLn(f, A[i]);

  Smin := A[1];
  Mmin := 1;
  for m:=2 to N do begin
    S := 0;
    for i:=1 to M do S := S + A[i];
    if S < Smin then begin
      Smin := S;
      Mmin := M;
    end;
  end;

  CloseFile(f);

  AssignFile(f, outputPATH);
  Rewrite(f);

  WriteLn(f, '���. 5':50);

  WriteLn(f);

  WriteLn(f, '������ ������� N = ', N);

  WriteLn(f);

  WriteLn(f, '������ �:');

 For i:=1 to N do
 begin
   Write(f, ' ');
   WriteLn(f, '�[', i, '] = ', A[i]);
 end;

  WriteLn(f);

  WriteLn(f, '���������� ����� = ', Smin,' ��� m = ', Mmin);

  WriteLn('PRESS Enter to exit');

  CloseFile(f);

  ReadLn;
end.
