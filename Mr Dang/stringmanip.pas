uses math;
const fi = 'stringmanip.inp';
      fo = 'stringmanip.out';
      maxn = 201;

var s1,s2:string;
    n,m:longint;
    a:array[0..maxn,0..maxn] of longint;

procedure input;
var f:text;
begin
    assign(f,fi);
    reset(f);
    readln(f,s1);
    read(f,s2);
    close(f);
    n:=length(s1);
    m:=length(s2);
end;

procedure main;
var i,j:longint;
begin
    for i:=0 to n do a[i,0]:=i;
    for j:=0 to m do a[0,j]:=j;
    for i:=1 to n do
        for j:=1 to m do
        begin
            if s1[i] = s2[j] then a[i,j]:=a[i-1,j-1]
            else a[i,j]:=min(min(a[i,j-1],a[i-1,j]),a[i-1,j-1]) + 1;
        end;
end;

procedure path(i,j:longint; var f:text);
begin
    if (i <= 0) or (j <= 0) then exit;
    if s1[i] = s2[j] then path(i-1,j-1,f)
    else
    begin
        if a[i,j] = a[i-1,j-1] + 1 then
        begin
            writeln(f,s1,'->replace(',i,',',s2[j],')->');
            path(i-1,j-1,f);
        end
        else if a[i,j] = a[i,j-1] + 1 then
        begin
            writeln(f,s1,'->insert(',i,',',s2[j],')->');
            path(i,j-1,f);
        end
        else if a[i,j] = a[i-1,j] + 1 then
        begin
            writeln(f,s1,'->delete(',i,')->');
            path(i-1,j,f);
        end
    end;
end;
            

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    writeln(f,a[n,m]);
    path(n,m,f);
    close(f);
end;

begin
    input;
    main;
    output;
end.
