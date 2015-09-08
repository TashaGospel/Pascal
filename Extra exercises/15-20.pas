const fi = '15-20.inp';
      fo = '15-20.out';
      maxn = 1001;

var n,respos:longint;
    a,l,r,tl,tr:array[1..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do read(f,a[i]);
    close(f);
end;

procedure left;
var i,j:longint;
begin
    for i:=1 to n do
    begin
        l[i]:=1;
        for j:=i-1 downto 1 do if (a[j] >= a[i]) and (l[j] + 1 > l[i]) then
        begin
            l[i]:=l[j] + 1;
            tl[i]:=j;
        end;
    end;
end;

procedure right;
var i,j:longint;
begin
    for i:=n downto 1 do
    begin
        r[i]:=1;
        for j:=i+1 to n do if (a[j] >= a[i]) and (r[j] + 1 > r[i]) then
        begin
            r[i]:=r[j] + 1;
            tr[i]:=j;
        end;
    end;
end;

procedure main;
var i:longint;
begin
    respos:=1;
    for i:=2 to n do if l[i] + r[i] > l[respos] + r[respos] then
        respos:=i;
end;

function pathLeft(i:longint):string;
var tmp:string;
begin
    if tl[i] = 0 then exit('')
    else
    begin
        str(a[tl[i]],tmp);
        exit(pathLeft(tl[i]) + tmp + ' ');
    end;
end;

function pathRight(i:longint):string;
var tmp:string;
begin
    if tr[i] = 0 then exit('')
    else
    begin
        str(a[tr[i]],tmp);
        exit(tmp + ' ' + pathRight(tr[i]));
    end;
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    writeln(f,l[respos] + r[respos] - 1);
    write(f,pathLeft(respos),a[respos],' ',pathRight(respos));
    close(f);
end;

begin
    input;
    left;
    right;
    main;
    output;
end.
