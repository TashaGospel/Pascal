uses math;
const fi = 'dantem.inp';
      fo = 'dantem.out';
      maxn = 1001;

var n,s:longint;
    a,tr:array[0..maxn] of longint;
    b:array[0..maxn,0..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,s);
    for i:=1 to n do read(f,a[i]);
    close(f);
end;

procedure main;
var i,j:longint;
begin
    for i:=1 to s do b[0,i]:=maxlongint div 2;
    for i:=1 to n do
        for j:=1 to s do
        begin
            b[i,j]:=b[i-1,j];
            if j >= a[i] then b[i,j]:=min(b[i,j-a[i]] + 1, b[i,j]);
        end;
end;

procedure chosenPath(i,j:longint);
begin
    if (i <= 0) or (j <= 0) then exit;
    if b[i,j] = b[i-1,j] then chosenPath(i-1,j)
    else 
    begin
        inc(tr[i]);
        chosenPath(i,j-a[i]);
    end;
end;  

procedure output;
var f:text;
    i:longint;
begin
    assign(f,fo);
    rewrite(f);
    for i:=1 to n do writeln(f,tr[i]);
    close(f);
end;

begin
    input;
    main;
    chosenPath(n,s);
    output;
end.
