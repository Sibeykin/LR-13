program fsdfs;

var
  inputFile: file of Char;
  tempFile: file of Char;
  filePath: string;
  tempPath: string;
  ch: Char;
  lastSpacePos: Integer;
  count: Integer;

begin
  filePath := 'C:\PABCWork.NET\блокноты\b1.txt'; 
  tempPath := 'C:\PABCWork.NET\блокноты\b1.2.txt'; 

  AssignFile(inputFile, filePath);
  Reset(inputFile);

  AssignFile(tempFile, tempPath);
  Rewrite(tempFile);

  lastSpacePos := -1;
  count := 0;

  while not EOF(inputFile) do
  begin
    Read(inputFile, ch);
    count := count + 1;
    if ch = ' ' then
      lastSpacePos := count;
  end;

  Reset(inputFile);
  count := 0;

  while not EOF(inputFile) do
  begin
    Read(inputFile, ch);
    count := count + 1;

    if (lastSpacePos = -1) or (count < lastSpacePos) then
      Write(tempFile, ch);
  end;

  CloseFile(inputFile);
  CloseFile(tempFile);

  Erase(inputFile);
  Rename(tempFile, filePath);

  WriteLn('символы были успешно удалены.');
end.
