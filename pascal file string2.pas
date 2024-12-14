program dfgdr;

var
  inputFile: TextFile;
  outputFile: TextFile;
  filePath: string;
  longestLines: array of string;
  line: string;
  maxLength: Integer;
  count: Integer;

begin
  filePath := 'C:\PABCWork.NET\блокноты\243.txt'; 
  AssignFile(inputFile, filePath);
  Reset(inputFile);

  AssignFile(outputFile, 'C:\PABCWork.NET\блокноты\244.txt'); 
  Rewrite(outputFile);

  maxLength := 0;
  count := 0;

  while not EOF(inputFile) do
  begin
    ReadLn(inputFile, line);
    if Length(line) > maxLength then
      maxLength := Length(line);
  end;

  Reset(inputFile);

  while not EOF(inputFile) do
  begin
    ReadLn(inputFile, line);
    if Length(line) = maxLength then
    begin
      SetLength(longestLines, count + 1);
      longestLines[count] := line;
      count := count + 1;
    end;
  end;

  for var i := count - 1 downto 0 do
  begin
    WriteLn(outputFile, longestLines[i]);
  end;

  CloseFile(inputFile);
  CloseFile(outputFile);
end.
