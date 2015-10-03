const fi = 'tourist.inp';
      fo = 'tourist.out';
      maxn = 102;

var n, res:longint;
    a:array[0..maxn,0..maxn] of longint;
    b,path:array[0..maxn] of longint;
    chosen:array[0..maxn] of boolean;

procedure input;
var f:text;
    i,j:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do 
        for j:=1 to n do read(f,a[i,j]);
    close(f);
    res:=maxlongint;
end;

procedure check(c:longint);
begin
    if c < res then
    begin
        res:=c;
        path:=b;
    end;
end;

procedure main(c, count, curSum:longint);
var i:longint;
begin
    b[count]:=c;
    if count = n then check(curSum + a[c,1])
    else
    begin
        chosen[c]:=true;
        for i:=2 to n do if not chosen[i] then main(i,count + 1, curSum + a[c,i]);
        chosen[c]:=false;
    end;
end;

procedure output;
var f:text;
    i:longint;
begin
    assign(f,fo);
    rewrite(f);
    writeln(f,res);
    for i:=1 to n do write(f, path[i], ' ');
    write(f,1);
    close(f);
end;

begin
    input;
    main(1,1,0);
    output;
end.
