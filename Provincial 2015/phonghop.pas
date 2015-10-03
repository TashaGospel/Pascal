const fi = 'phonghop.inp';
      fo = 'phonghop.out';
      maxn = 1001;

type meeting = record
    u,v,id:longint;
    end;

var n,respos:longint;
    a:array[1..maxn] of meeting;
    b,tr:array[1..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do with a[i] do
    begin
        read(f,u,v);
        id:=i;
    end;
    close(f);
end;
    
procedure quicksort(c,d:longint);
var i,j,mid:longint;
    tmp:meeting;
begin
    i:=c; j:=d; mid:=a[(c + d) div 2].u;
    repeat
        while a[i].u < mid do inc(i);
        while a[j].u > mid do dec(j);
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
var i,j:longint;
begin
    quicksort(1,n);

    respos:=1;

    for i:=1 to n do
    begin
        b[i]:=1;
        for j:=i-1 downto 1 do if (a[i].u >= a[j].v) and (b[i] < b[j] + 1) then
        begin
            b[i]:=b[j] + 1;
            tr[i]:=j;
        end;
        if b[respos] < b[i] then respos:=i;
    end;
end;

function path(i:longint):string;
var tmp:string;
begin
    str(a[i].id,tmp);
    if tr[i] = 0 then exit(tmp + ' ')
    else exit(path(tr[i]) + tmp + ' ');
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    writeln(f,b[respos]);
    write(f,path(respos));
    close(f);
end;

begin
    input;
    main;
    output;
end.
