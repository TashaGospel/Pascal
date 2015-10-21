const fi = '15-2.inp';
      fo = '15-2.out';
      maxn = 1001;

var n,u,v:longint;
    a,tr:array[1..maxn,1..maxn] of longint;

procedure input;
var f:text;
    i,j:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do
        for j:=1 to n do
        begin
            read(f,a[i,j]);
            if (a[i,j] = 0) and (i <> j) then a[i,j]:=maxlongint div 2;
        end;
    read(f,u,v);
    close(f);
end;

procedure main;
var i,j,k:longint;
begin
    for k:=1 to n do
        for i:=1 to n do
            for j:=1 to n do
                if a[i,k] + a[k,j] < a[i,j] then
                begin
                    a[i,j]:=a[i,k] + a[k,j];
                    tr[i,j]:=k;
                end;
end;

function path(i,j:longint):string;
var tmp:string;
begin
    if tr[i,j] = 0 then exit('');
    str(tr[i,j],tmp);
    exit(path(i,tr[i,j]) + ' ' + tmp + ' ' + path(tr[i,j],j));
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    writeln(f,a[u,v]);
    write(f,u,path(u,v),v);
    close(f);
end;

begin
    input;
    main;
    output;
end.    
