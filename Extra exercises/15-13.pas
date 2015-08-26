const fi = '15-13.inp';
      fo = '15-13.out';
      maxn = 1001;
      divider = 1000000000;

var n,m:longint;
    a:array[0..maxn,0..maxn] of longint;

procedure input;
var f:text;
    i,u,v:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m);
    for i:=1 to m do
    begin
        read(f,u,v);
        a[u,v]:=-1;
    end;
    close(f);
end;

procedure main;
var i,j:longint;
begin
    a[1,0]:=1;
    for i:=1 to n do
        for j:=1 to n do if a[i,j] <> -1 then 
        begin
            if a[i,j-1] <> -1 then a[i,j]:=(a[i,j-1]+a[i,j]) mod divider;
            if a[i-1,j] <> -1 then a[i,j]:=(a[i-1,j]+a[i,j]) mod divider;
        end;
end;    

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,a[n,n]);
    close(f);
end;

begin
    input;
    main;
    output;
end.
