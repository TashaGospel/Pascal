const fi = 'szero.inp';
      fo = 'szero.out';
      maxn = 100001;

type thing = record
    v,index:longint;
    end;

    arr = array[0..maxn] of thing;

var n,res,s1,s2:longint;
    a:array[0..maxn] of longint;
    s:array[0..maxn] of thing;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do read(f,a[i]);
    close(f);
end;

procedure quicksort(var x:arr; c,d:longint);
var i,j:longint;
    tmp,mid:thing;
begin
    i:=c; j:=d; mid:=x[(c + d) div 2];
    repeat
        while (x[i].v < mid.v) or ((x[i].v = mid.v) and (x[i].index < mid.index)) do
               
            inc(i);
        while (x[j].v > mid.v) or ((x[j].v = mid.v) and (x[j].index > mid.index)) do
            dec(j);
        if i <= j then
        begin
            tmp:=x[i];
            x[i]:=x[j];
            x[j]:=tmp;
            inc(i);
            dec(j);
        end;
    until i > j;
    if c < j then quicksort(x,c,j);
    if i < d then quicksort(x,i,d);
end;

procedure main;
var front,i,tmp:longint;
begin
    for i:=1 to n do
    begin
        s[i].v:=s[i-1].v + a[i];
        s[i].index:=i;
    end;

    quicksort(s,1,n);

    for i:=1 to n do write(s[i].index,' ');

    front:=1;
    for i:=2 to n do
    begin
        if s[i].v <> s[front].v then front:=i
        else
        begin
            tmp:= s[i].index - s[front].index;  
            if tmp > res then
            begin
                res:=tmp;
                s1:=s[front].index+1;
                s2:=s[i].index;
            end;
        end;
    end;
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,s1,' ',s2);
    close(f);
end;

begin
    input;
    main;
    output;
end.
