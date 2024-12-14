program my52;

var
  inputFile: File of Real;  
  tempFile: TextFile;  
  numbers: array of Real;
  minVal, maxVal: Real;
  minIdx, maxIdx: Integer;
  i, count: Integer;
  tempValue: Real;

begin
  AssignFile(inputFile, 'C:\PABCWork.NET\блокноты\6.1.dat');
  Rewrite(inputFile);

  Randomize;
  for i := 0 to 9 do 
  begin
    Write(inputFile, Random * 100); 
  end;

  CloseFile(inputFile);


  AssignFile(inputFile, 'C:\PABCWork.NET\блокноты\6.1.dat');
  Reset(inputFile);
  
  count := 0;
  while not EOF(inputFile) do
  begin
    SetLength(numbers, count + 1);
    Read(inputFile, numbers[count]);
    writeln(numbers[count]);
    count := count + 1;
  end;
  CloseFile(inputFile);
  

  minVal := numbers[0];
  maxVal := numbers[0];
  minIdx := 0;
  maxIdx := 0;

  for i := 0 to count - 1 do
  begin
    if numbers[i] < minVal then
    begin
      minVal := numbers[i];
      minIdx := i;
    end;
    if numbers[i] > maxVal then
    begin
      maxVal := numbers[i];
      maxIdx := i;
    end;
  end;

  AssignFile(tempFile, 'C:\PABCWork.NET\блокноты\temp.txt');
  Rewrite(tempFile);
  
  for i := 0 to count - 1 do
  begin
    if i = minIdx then
      WriteLn(tempFile, maxVal) 
    else if i = maxIdx then
      WriteLn(tempFile, minVal) 
    else
      WriteLn(tempFile, numbers[i]);
  end;
  
  CloseFile(tempFile);
  
  Erase(inputFile);
  Rename(tempFile, 'C:\PABCWork.NET\блокноты\6.2.txt');
end.