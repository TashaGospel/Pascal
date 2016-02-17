const fi = 'raz.inp';
      fo = 'raz.out';
      maxn = 1001;

var n,m:longint;
    a,b,c:array[0..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,i);
    for i:=1 to n do read(f,a[i]);
    close(f);
end;

function counted(x:longint):longint;
var i:longint;
begin
    for i:=1 to m do if b[i] = x then exit(i);
    exit(-1);
end;

procedure main;
var i,j:longint;
begin
    for i:=1 to n do
    begin
        j:=counted(a[i]);
        if j = -1 then
        begin
            inc(m);
            b[m]:=a[i];
            c[m]:=1;
        end
        else inc(c[j]);
    end;
end;

procedure output;
var f:text;
    i,j,count,maxVal,maxPos:longint;
begin
    assign(f,fo);
    rewrite(f);
    for count:=1 to m do
    begin
        maxVal:=-1;
        for i:=1 to m do if maxVal < c[i] then
        begin
            maxPos:=i;
            maxVal:=c[i];
        end;
        for i:=1 to maxVal do write(f, b[maxPos],' ');
        c[maxPos]:=-1;
    end;
    close(f);
end;

begin
    input;
    main;
    output;
end.
