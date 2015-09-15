const fi = 'dantem.inp';
      fo = 'dantem.out';
      maxn = 1001;

var n,s:longint;
    a,b,tr,num:array[0..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,s);
    for i:=1 to n do read(f,a[i]);
    close(f);
    for i:=1 to s do b[i]:=maxlongint div 2;
end;

procedure main;
var i,j:longint;
begin
    for i:=1 to n do
    begin
        for j:=0 to s-a[i] do if (b[j] + 1 < b[j+a[i]]) then
        begin
            b[j+a[i]]:=b[j]+1;
            tr[j+a[i]]:=i;
        end;
    end;
end;

procedure chosenPath(i:longint);
begin
    if tr[i] = 0 then exit;
    inc(num[tr[i]]);
    chosenPath(i - a[tr[i]]);
end;  

procedure output;
var f:text;
    i:longint;
begin
    assign(f,fo);
    rewrite(f);
    for i:=1 to n do writeln(f,num[i]);
    close(f);
end;

begin
    input;
    main;
    chosenPath(s);
    output;
end.
