uses math;
const fi = 'tfield.inp';
      fo = 'tfield.out';
      maxn = 1002;

type polygon = record
    s:int64;
    c:longint;
    end;

var n,m:longint;
    res:int64;
    a:array[0..maxn] of polygon;

procedure input;
var f:text;
    i,j,t:longint;
    x,y:array[0..maxn] of longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m);
    for i:=1 to n do
    begin
        read(f,t,a[i].c);
        read(f,x[1],y[1]);
        for j:=2 to t do
        begin
            read(f,x[j],y[j]);
            a[i].s:=a[i].s + int64(x[j-1] - x[j]) * (y[j-1] + y[j]);
        end;
        a[i].s:=a[i].s + int64(x[t] - x[1]) * (y[t] + y[1]);
        a[i].s:=abs(a[i].s);
        { Shouldn't half it, instead keep it an integer, only halfing the result. }
    end;
    close(f);
end;

procedure quicksort(c,d:longint);
var i,j:longint;
    mid:int64;
    tmp:polygon;
begin
    i:=c; j:=d; mid:=a[c + random(d-c+1)].s;
    repeat
        while a[i].s < mid do inc(i);
        while a[j].s > mid do dec(j);
        if i <= j then
        begin
            tmp:=a[i];
            a[i]:=a[j];
            a[j]:=tmp;
            inc(i);
            dec(j);
        end;
    until i > j;
    if c < j then quicksort(c,j);
    if i < d then quicksort(i,d);
end;

procedure main;
var i,j,maxC:longint;
    color:array[0..maxn] of longint;
begin
    quicksort(1,n);
    for i:=1 to n do
    begin
        fillchar(color,sizeof(color),0);
        maxC:=0;
        for j:=i to n do
        begin
            inc(color[a[j].c]);
            maxC:=max(maxC,color[a[j].c]);
            if (j - i + 1) - maxC > m then break;
            res:=max(res,a[j].s - a[i-1].s);
        end;
    end;
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,res div 2,'.');
    if res mod 2 = 0 then write(f,'0') else write(f,'5');
    close(f);
end;

begin
    input;
    main;
    output;
end.
