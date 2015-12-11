const fi = 'tachtu.inp';
      fo = 'tachtu.out';
      maxn = 202;

var s1,s2,s:ansistring;
    l1,l2:longint;
    a:array[0..maxn,0..maxn] of longint;

procedure input;
var f:text;
begin
    assign(f,fi);
    reset(f);
    readln(f,s1);
    readln(f,s2);
    readln(f,s);
    close(f);
    l1:=length(s1);
    l2:=length(s2);
end;

procedure main;
var i,j:longint;
begin
    for i:=1 to l1 do a[i,0]:=1;
    for i:=1 to l2 do a[0,i]:=2;
    for i:=1 to l1 do
        for j:=1 to l2 do
        begin
            if (a[i-1,j] > 0) and (s1[i] = s[i + j]) then a[i,j]:=1;
            if (a[i,j-1] > 0) and (s2[j] = s[i + j]) then a[i,j]:=2;
        end;
end;

function path(i,j:longint):ansistring;
begin
    if a[i,j] = 0 then exit('')
    else if a[i,j] = 1 then exit(path(i-1,j) + char(a[i,j] + 48))
    else exit(path(i,j-1) + char(a[i,j] + 48));
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,path(l1,l2));
    close(f);
end;

begin
    input;
    main;
    output;
end.
