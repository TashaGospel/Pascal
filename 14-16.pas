const maxn = 1000;
var n:longint;
        a:array[1..maxn] of longint;

procedure input;
begin
        readln(n);
end;

procedure output;
var i:longint;
begin
        for i:=1 to n do write(a[i]);
        write(' ');
end;

procedure main(i:longint);
var j:longint;
begin
        for j:=0 to 1 do
        begin
                a[i]:=j;
                if i < n then main(i+1)
                else output;
        end;
end;

begin
        input;
        main(1);
        readln;
end.
