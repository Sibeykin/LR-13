program LastLocalMax;
var f: Text; chsl: array of Real; i, n: Integer; psldnmx: Real; chtn: Real;
begin
 Assign(f, 'C:\PABCWork.NET\блокноты\5.txt');
 Reset(f);
 n := 0;
 while not Eof(f) do 
 begin
    Readln(f, chtn);
    SetLength(chsl, n + 1); 
    chsl[n] := chtn; 
    Inc(n);
  end;
  Close(f);
  if n < 3 then
  begin
    Writeln('максимумов нет.');
    Exit;
  end;
  for i := 1 to n - 2 do
  begin
    if (chsl[i] > chsl[i - 1]) and (chsl[i] > chsl[i + 1]) then
    begin
      psldnmx := chsl[i];
    end;
  end;
  if psldnmx <> -1 then
    Writeln('последний максимум: ', psldnmx)
  else  
    Writeln('максимумов нет.');
end.
