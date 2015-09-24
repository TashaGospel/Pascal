const fi = 'alpha.inp';
      fo = 'alpha.out';
      maxn = 1001;

var n,m,sum:longint;
    t,v:array[1..maxn] of longint;
    a:array[0..maxn,0..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m);
    for i:=1 to n do
    begin
        read(f,t[i],v[i]);
        sum:=sum+v[i];
    end;
    close(f);
end;

function max(i,j:longint):longint;
begin
    if i>=j then exit(i) else exit(j);
end;

procedure main;
var i,j:longint;
begin
    for i:=1 to n do
        for j:=1 to m do
        begin
            if j-t[i] < 0 then a[i,j]:=a[i-1,j]
            else a[i,j]:=max(a[i-1,j-t[i]] + v[i],a[i-1,j])
        end;
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,sum-a[n,m]);
    close(f);
end;

begin
    input;
    main;
    output;
end.
