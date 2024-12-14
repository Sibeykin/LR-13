program SumEvenIndexIntegers;

var
  inputFile: TextFile;
  number: Integer;
  sum: Integer;
  i: Integer;

begin
  AssignFile(inputFile, 'C:\PABCWork.NET\блокноты\4.txt');
  Rewrite(inputFile);
  Randomize;
  for i := 1 to 4 do
  begin
    WriteLn(inputFile, Random(20));
  end;
  CloseFile(inputFile);

  AssignFile(inputFile, 'C:\PABCWork.NET\блокноты\4.txt');
  Reset(inputFile);

  sum := 0;
  i := 1;
  while not EOF(inputFile) do
  begin
    ReadLn(inputFile, number);
    if i mod 2 = 0 then
      sum := sum + number;
    Inc(i);
  end;

  CloseFile(inputFile);
  
  WriteLn('Сумма элементов с четными номерами: ', sum);
end.
