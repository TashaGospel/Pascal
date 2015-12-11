const fi = 'infor.inp';
      fo = 'infor.out';
      maxn = 10001;

var n,res:longint;
    parent,resVertices:array[0..maxn] of longint;

procedure input;
var f:text;
    i,j:longint;
begin
    assign(f,fi);
    reset(f);
    readln(f,n);
    for i:=1 to n do
    begin
        while not seekeoln(f) do
        begin
            read(f,j);
            if parent[i] <> j then parent[j]:=i;
        end;
        readln(f);
    end;
    close(f);
end;

procedure output;
var f:text;
    i:longint;
begin
    assign(f,fo);
    rewrite(f);
    for i:=1 to n do if parent[i] = 0 then
    begin
        inc(res);
        resVertices[res]:=i;
    end;
    writeln(f,res);
    for i:=1 to res do writeln(f,resVertices[i]);
    close(f);
end;

begin
    input;
    output;
end.
