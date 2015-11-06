const fi = 'bongda.inp';
      fo = 'bongda.out';
      maxn = 1001;

var n,count:longint;
    a:array[1..maxn,1..maxn] of boolean;
    l,d,tr:array[1..maxn] of longint;
    chosen:array[1..maxn] of boolean;

procedure input;
var f:text;
    i,j:longint;
    tmp:char;
begin
    assign(f,fi);
    reset(f);
    readln(f,n);
    for i:=1 to n do
        for j:=1 to n+1 do
        begin
            read(f,tmp);
            if tmp = '1' then a[i,j]:=true;
        end;
    close(f);
    count:=n;
end;

procedure topo(u:longint);
var i:longint;
begin
    chosen[u]:=true;
    for i:=1 to n do if (not chosen[i]) and a[u,i] then topo(i);
    l[count]:=u;
    dec(count);
end;

procedure main;
var i,j,u,v:longint;
begin
    for i:=1 to n do if not chosen[i] then topo(i);
    for i:=1 to n-1 do
        for j:=i+1 to n do
        begin
            u:=l[i]; v:=l[j];
            if d[v] < d[u] + 1 then
            begin
                d[v]:=d[u] + 1;
                tr[v]:=u;
            end;
        end;
end;

function path(i:longint):ansistring;
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
    if d[l[n]] <> n - 1 then write(f,-1)
    else write(f,path(l[n]));
    close(f);
end;

begin
    input;
    main;
    output;
end.
