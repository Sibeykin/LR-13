program SplitEvenOddIntegers;

var
  inputFile, oddFile, evenFile: TextFile;
  number: Integer;
  i: Integer;

begin
  AssignFile(inputFile, 'C:\PABCWork.NET\блокноты\3.txt');
  Rewrite(inputFile);

  Randomize;
  for i := 1 to 5 do
  begin
    WriteLn(inputFile, Random(9));  
  end;
  
  CloseFile(inputFile);


  AssignFile(inputFile, 'C:\PABCWork.NET\блокноты\3.txt');
  Reset(inputFile);

  AssignFile(oddFile, 'C:\PABCWork.NET\блокноты\3.1.txt');
  Rewrite(oddFile);

  AssignFile(evenFile, 'C:\PABCWork.NET\блокноты\3.2.txt');
  Rewrite(evenFile);

  i := 1;
  while not EOF(inputFile) do
  begin
    ReadLn(inputFile, number);
    if i mod 2 = 1 then
      WriteLn(oddFile, number)  
    else
      WriteLn(evenFile, number); 
    Inc(i);
  end;

  CloseFile(inputFile);
  CloseFile(oddFile);
  CloseFile(evenFile);
  
  WriteLn('проверь ');
end.
