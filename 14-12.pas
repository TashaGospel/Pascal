const maxn = 1000;
var n:longint;
        a:array[1..maxn] of longint;
        ok:array[1..maxn] of boolean;

procedure input;
begin
        readln(n);
        fillchar(ok,sizeof(ok),true);
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
        for j:=1 to n do
                if ok[j] then
                begin
                        ok[j]:=false;
                        a[i]:=j;
                        if i = n then output
                        else main(i+1);
                        ok[j]:=true;
                end;
end;

begin
        input;
        main(1);
        readln;
end.

