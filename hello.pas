const maxn = 101;
var i:longint;
    bet,lost:int64;
begin
    bet:=1;
    lost:=0;
    for i:=1 to maxn do
    begin
        if bet * 3 <= lost then bet:= lost div 3 + 1;
        lost:=lost + bet;
        writeln(i,' ',bet,' ',lost);
    end;
end.
        
