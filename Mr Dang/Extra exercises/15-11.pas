const fi = '15-11.inp';
      fo = '15-11.out';
      maxn = 1001;

type thing = record
    u,v,w,index:longint;
    end;

var n,respos:longint;
    a:array[1..maxn] of thing;
    b,tr,num:array[0..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do with a[i] do 
    begin
        read(f,u,v,w);
        index:=i;
    end;
    close(f);
end;

procedure quicksort(c,d:longint);
var i,j,mid:longint;
    tmp:thing;
begin
    i:=c; j:=d; mid:=a[(c+d) div 2].u;
    repeat
        while a[i].u < mid do inc(i);
        while a[j].u > mid do dec(j);
        if i<=j then
        begin
            tmp:=a[i];
            a[i]:=a[j];
            a[j]:=tmp;
            inc(i);
            dec(j);
        end;
    until i>j;
    if c < j then quicksort(c,j);
    if i < d then quicksort(i,d);
end;

procedure main;
var i,j:longint;
begin
    for i:=2 to n do
    begin
        b[i]:=a[i].w;
        num[i]:=1;
        for j:=i-1 downto 1 do if (a[i].u > a[j].v) and (b[i] < b[j] + a[i].w) then
        begin
            b[i]:=b[j]+a[i].w;
            tr[i]:=j;
            num[i]:=num[j]+1;
        end;
        if b[respos] < b[i] then respos:=i;
    end;
end;    

function path(i:longint):string;
var tmp:string;
begin
    str(i,tmp);
    if tr[i] = 0 then exit(tmp + ' ')
    else exit(path(tr[i]) + tmp + ' ');
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    writeln(f,num[respos],' ',b[respos]);
    write(f,path(respos));
    close(f);
end;

begin
    input;
    quicksort(1,n);
    main;
    output;
end.
