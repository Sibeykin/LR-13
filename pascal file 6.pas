program lbrtrn13tsk7;
var f: file of char; ch: char; i: integer;
begin
  Assign(f, 'C:\PABCWork.NET\блокноты\7.txt'); 
  Reset(f); 
  i := 1;  
  while not EOF(f) do
  begin
    Seek(f, i - 1); 
    Read(f, ch);    
    if i mod 2 = 0 then
    begin
      Seek(f, i - 1); 
      ch := '!'; 
      Write(f, ch); 
    end;
    Inc(i); 
  end;  
  Close(f); 
end.
