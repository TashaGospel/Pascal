uses math;
const fi = 'ketnghia.inp';
      fo = 'ketnghia.out';
      maxn = 1001;

var n, m:longint;
    a,b:array[0..maxn] of longint;
    c:array[0..maxn,0..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m);
    for i:=1 to n do read(f,a[i]);
    for i:=1 to m do read(f,b[i]);
    close(f);
end;

procedure main;
var i,j:longint;
begin
    for i:=1 to n do
        for j:=1 to m do
            if a[i] = b[j] then c[i,j]:=c[i-1,j-1] + 1
            else c[i,j]:=max(c[i-1,j], c[i,j-1]);
end;

function path(i,j:longint):ansistring;
var tmp, tmp2:ansistring;
begin
    if (i <= 0) or (j <= 0) then exit('');
    if a[i] = b[j] then
    begin
        str(i,tmp);
        str(j,tmp2);
        tmp:= tmp + ' ' + tmp2;
        exit(path(i-1,j-1) + tmp);
    end
    else if c[i,j] = c[i-1,j] then exit(path(i-1,j))
    else exit(path(i,j-1));
end;

procedure output;
var f:text;
    i:longint;
    tmp:ansistring;
begin
    assign(f,fo);
    rewrite(f);
    writeln(f,c[n,m]);
    tmp:=path(n,m);
    for i:=1 to length(tmp) do
    begin
        write(f,tmp[i]);
        if i mod 3 = 0 then writeln(f);
    end;
    close(f);
end;

begin
    input;
    main;
    output;
end.
