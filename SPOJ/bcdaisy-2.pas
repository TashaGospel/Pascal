const fi = 'bcdaisy.inp';
      fo = 'bcdaisy.out';
      maxn = 10001;

var n,m:longint;
    t:array[1..maxn] of longint;

procedure union(c,d:longint); // unite two trees
var i:longint;
begin
    for i:=1 to n do 
        if t[i]=d then t[i]:=c;
end;

procedure input;
var f:text;
    i,d1,d2:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m);
    for i:=1 to n do t[i]:=i;
    for i:=1 to m do
    begin
        read(f,d1,d2);
        union(t[d1],t[d2]);
    end;
end;

procedure output;
var f:text;
    i:longint;
begin
    assign(f,fo);
    rewrite(f);
    for i:=2 to n do if t[i] <> t[1] then writeln(f,i);
    close(f);
end;

begin
    input;
    output;
end.
