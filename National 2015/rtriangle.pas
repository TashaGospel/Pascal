const fi = 'rtriangle.inp';
      fo = 'rtriangle.out';
      maxn = 1501;
      eps = 0.0000000001;

type point = record
    x,y,u:longint;
    ctg:real;
    end;

    arr = array[0..maxn] of point;

var n:longint;
    res:int64;
    a,b:array[0..maxn] of point;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do read(f,a[i].x,a[i].y);
    close(f);
end;

procedure quicksort(var a:arr; c,d:longint);
var i,j:longint;
    mid:real;
    tmp:point;
begin
    i:=c; j:=d; mid:=a[c + random(d-c+1)].ctg;
    repeat
        while a[i].ctg < mid do inc(i);
        while mid < a[j].ctg do dec(j);
        if i <= j then
        begin
            tmp:=a[i];
            a[i]:=a[j];
            a[j]:=tmp;
            inc(i);
            dec(j);
        end;
    until i > j;
    if c < j then quicksort(a,c,j);
    if i < d then quicksort(a,i,d);
end;

procedure rotate(var p:point);
var tmp:longint;
begin
    with p do
    begin
        while (x <= 0) or (y < 0) do
        begin
            inc(u);
            tmp:=x;
            x:=y;
            y:=-tmp;
        end;
    end;
end;

procedure main;
var i,j:longint;
    c:array[0..3] of longint;
begin
    for j:=1 to n do
    begin
        for i:=1 to n do
        begin
            b[i].x:=a[i].x - a[j].x;
            b[i].y:=a[i].y - a[j].y;
            b[i].u:=0;
            if i <> j then
            begin
                rotate(b[i]);
                b[i].ctg:= b[i].y / b[i].x;
            end
            else b[i].ctg:=maxlongint;
        end;

        quicksort(b,1,n);

        fillchar(c,sizeof(c),0);
        for i:=1 to n-1 do
        begin
            inc(c[b[i].u]);
            if not (abs(b[i].ctg - b[i+1].ctg) <= 0) then
                begin
                    res:=res + c[0] * c[1] + c[1] * c[2] + c[2] * c[3] + c[3] * c[0];
                    fillchar(c,sizeof(c),0);
                end;
        end;
    end;
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,res);
    close(f);
end;

begin
    input;
    main;
    output;
end.
