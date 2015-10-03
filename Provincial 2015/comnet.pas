const fi = 'comnet.inp';
      fo = 'comnet.out';
      maxn = 5001;

var n,res,m,treeNum:longint;
    t:array[1..maxn] of longint;
    path:array[1..maxn,1..2] of longint;

procedure union(u,v:longint);
var i:longint;
begin
    for i:=1 to n do if t[i] = v then t[i]:=u;
    dec(treeNum);
end;
    
procedure input;
var f:text;
    i,d1,d2:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m);

    for i:=1 to n do t[i]:=i;
    treeNum:=n;

    for i:=1 to m do
    begin
        read(f,d1,d2);
        if t[d1] <> t[d2] then union(t[d1],t[d2]);
    end;

    close(f);
end;

procedure main;
var i,j:longint;
begin
    for i:=1 to n do
        for j:=i+1 to n do
        begin
            if t[i] <> t[j] then
            begin
                union(t[i],t[j]);
                inc(res);
                path[res,1]:=i;
                path[res,2]:=j;
                if treeNum = 1 then exit;
            end;
        end;
end;

procedure output;
var f:text;
    i:longint;
begin
    assign(f,fo);
    rewrite(f);
    writeln(f,res);
    for i:=1 to res do writeln(f,path[i,1],' ',path[i,2]);
    close(f);
end;

begin
    input;
    main;
    output;
end.
