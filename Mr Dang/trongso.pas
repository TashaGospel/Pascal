const fi = 'trongso.inp';
      fo = 'trongso.out';
      maxn = 1000001;

var n, res, resPos, maxVal:longint;
    a:array[1..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do
    begin
        read(f,a[i]);
        if a[i] > maxVal then maxVal:=a[i];
    end;
    close(f);
end;

procedure main;
var i, cur:longint;
begin
    cur:=0;
    for i:=1 to n do
    begin
        inc(cur,a[i]);
        if cur < 0 then cur:=0;
        if res < cur then
        begin
            res:=cur;
            resPos:=i;
        end;
    end;
end;

function path(c,sum:longint):string;
var tmp:string;
begin
    if (c <= 0) or (sum <= 0) then exit('');
    str(a[c],tmp);
    exit(path(c-1,sum-a[c]) + tmp + ' ');
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    if maxVal > 0 then
    begin
        main;
        writeln(f,res);
        write(f,path(resPos,res));
    end
    else
    begin
        writeln(f,maxVal);
        write(f,maxVal);
    end;
    close(f);
end;

begin
    input;
    main;
    output;
end.
