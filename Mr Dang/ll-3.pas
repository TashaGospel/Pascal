uses math;
const fi = 'll-3.inp';
      fo = 'll-3.out';
      maxn = 1001;

type job = record
    t,v,index:longint;
    end;

var n,count,maxT:longint;
    a:array[0..maxn] of job;
    res:array[0..maxn,0..maxn] of longint;


procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do
    begin
        read(f,a[i].t,a[i].v);
        a[i].index:=i;
        if maxT < a[i].t then maxT:=a[i].t;
    end;
    close(f);
end;

procedure quicksort(c,d:longint);
var i,j,mid:longint;
    tmp:job;
begin
    i:=c; j:=d; mid:=a[(c+d) div 2].t;
    repeat
        while a[i].t < mid do inc(i);
        while a[j].t > mid do dec(j);
        if i <= j then
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
    quicksort(1,n);

    for i:=1 to n do 
    begin
        for j:=1 to a[i].t do res[i,j]:=max(res[i-1,j-1] + a[i].v, res[i-1,j]);
        for j:=a[i].t + 1 to maxT do res[i,j]:=res[i,j-1];
    end;
end;

function path(i,j:longint):string;
var tmp:string;
begin
    if (i <= 0) or (j <= 0) then exit('');
    if res[i,j] = res[i-1,j] then exit(path(i-1,j))
    else if res[i,j] = res[i,j-1] then exit(path(i,j-1))
    else
    begin
        inc(count);
        str(a[i].index,tmp);
        exit(path(i-1,j-1) + tmp + ' ');
    end;
end;

procedure output;
var f:text;
    tmp:string;
begin
    assign(f,fo);
    rewrite(f);
    tmp:=path(n,maxT);
    writeln(f,res[n,maxT],' ',count);
    write(f,tmp);
    close(f);
end;

begin
    input;
    main;
    output;
end.           
