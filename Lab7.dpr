program Lab7;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows;

const Nmax = 20;
const inputPATH = 'input3.txt';
const outputPATH = 'output.txt';

var
  A: array[1..Nmax] of Integer;
  N, t, i, j, k: Integer;
  f: TextFile;

begin
  SetConsoleOutputCP(1251);

  AssignFile(f, inputPATH);
  Reset(f);

  ReadLn(f, N);

  ReadLn(f);

  for i := 1 to N do
    ReadLn(f, A[i]);

  CloseFile(f);

  AssignFile(f, outputPATH);
  Rewrite(f);

  WriteLn(f, 'Лаб. 5':50);

  WriteLn(f);

  WriteLn(f, 'Размер массива N = ', N);

  WriteLn(f);

  WriteLn(f, 'Исходный массив А:');

 For i:=1 to N do
 begin
   Write(f, ' ');
   WriteLn(f, 'А[', i, '] = ', A[i]);
 end;

  WriteLn(f);

  //Метод Пузырька - НАЧАЛО
                              {
  for j := N downto 2 do  begin
    For i := 2 to j do begin
      if abs(A[i-1]) > abs(A[i]) then begin
        t := A[i];
        A[i] := A[i-1];
        A[i-1] := t;
      end;
    end;

    WriteLn('Step ', N-j+1, ':');
    For i := 1 to N do begin
      WriteLn(' А[', i, '] = ', A[i]);
    end;
    WriteLn;
  end;
             }
  //Метод Пузырька - КОНЕЦ

  //Метод выбора - НАЧАЛО

  for j := N downto 2 do  begin
    k := j;
    For i := 1 to j-1 do begin
      if abs(A[k]) < abs(A[i]) then begin
        k := i;
      end;
    end;

    if k <> j then begin
      t := A[j];
      A[j] := A[k];
      A[k] := t;
    end;

    WriteLn('Step ', N-j+1, ':');
    For i := 1 to N do begin
      WriteLn(' А[', i, '] = ', A[i]);
    end;
    WriteLn;
  end;

  //Метод выбора - КОНЕЦ

  WriteLn(f, 'Обработанный массив А:');

  For i:=1 to N do
  begin
    Write(f, ' ');
    WriteLn(f, 'А[', i, '] = ', A[i]);
  end;

  WriteLn('PRESS Enter to exit');

  CloseFile(f);

  ReadLn;
end.

