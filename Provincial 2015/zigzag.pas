uses math;
const maxn = 100;
var i,j,count,state,n,m:longint;
    a:array[1..maxn,1..maxn] of longint;

begin
    read(n,m);
    i:=1; j:=1;
    count:=0; state:=-1;
    while count < m * n do
    begin
        inc(count);
        a[i,j]:=count;
        if ((i+state <= 0) or (i + state > n)) and (j < m) then 
        begin
            inc(j);
            state:=-state;
        end
        else if ((j-state <= 0) or (j - state > m)) and (i < n) then 
        begin
            inc(i);
            state:=-state;
        end
        else
        begin
            i:=i+state;
            j:=j-state;
        end;
    end;

    for i:=1 to n do
    begin
        for j:=1 to m do write(a[i,j],' ');
        writeln;
    end;
end.
