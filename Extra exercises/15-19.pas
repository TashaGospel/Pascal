const fi = '15-19.inp';
      fo = '15-19.out';
      maxn = 1001;

var n,s:longint;
    a,b,m,num,tr:array[0..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,s,n);
    for i:=1 to n do read(f,a[i],m[i]);
    close(f);
end;

procedure main;
var i,j,k:longint;
begin
    b[0]:=1;
    for i:=1 to n do
    begin
        for k:=1 to m[i] do
            for j:=s downto a[i] do if (b[j-a[i]] <> 0) and (ok[j-a[i]]) then
            begin
                if ok[j] then
                begin
                    b[j]:=b[j]+b[j-a[i]];
                end;
                if tr[j] = 0 then tr[j]:=i;
            end;
    end;
end;    

procedure path;
var i:longint;
begin
    i:=s;
    while i <> 0 do
    begin
        inc(num[tr[i]]);
        i:=i-a[tr[i]];
    end;
end;

procedure output;
var f:text;
    i:longint;
begin
    assign(f,fo);
    rewrite(f);
    writeln(f,b[s]);
    for i:=1 to n do write(f,num[i],' ');
    close(f);
    writeln;
    for i:=1 to s do write(b[i], ' ');
end;

begin
    input;
    main;
    path;
    output;
end.
