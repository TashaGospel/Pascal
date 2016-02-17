const fi = 'ant.inp';
      fo = 'ant.out';
      maxn = 51;

type thing = record
    c:char;
    right:boolean;
    end;

var n,m,t:longint;
    a:array[0..maxn] of thing;

function readf(var f:text):char;
var res:char;
begin
    read(f,res);
    exit(res);
end;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    readln(f,n,m);
    for i:=1 to n do with a[n - i + 1] do
    begin
        c:=readf(f);
        right:=true;
    end;
    readln(f);
    for i:=1 to m do with a[n + i] do
    begin
        c:=readf(f);
        right:=false;
    end;
    readln(f);
    read(f,t);
    close(f);
end;

procedure main;
var count,i:longint;
    tmp:thing;
begin
    for count:=1 to t do
    begin
        i:=1;
        while i < n + m do
        begin
            if (a[i].right and (not a[i+1].right)) then
            begin
                tmp:=a[i];
                a[i]:=a[i+1];
                a[i+1]:=tmp;
                inc(i);
            end;
            inc(i);
        end;
    end;
end;

procedure output;
var f:text;
    i:longint;
begin
    assign(f,fo);
    rewrite(f);
    for i:=1 to m+n do write(f,a[i].c);
    close(f);
end;

begin
    input;
    main;
    output;
end.
