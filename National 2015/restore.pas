const fi = 'restore.inp';
      fo = 'restore.out';
      maxn = 1000001;

var n:longint;
    a,res,count:array[0..maxn] of longint;

procedure input;
var f:text;
    i,d1,d2:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do
    begin
        read(f,d1,d2);
        a[d1]:=d2;
        inc(count[d1]);
        inc(count[d2]);
    end;
    close(f);
end;

procedure main;
var i:longint;
begin
    for i:=1 to maxn do if (count[i] = 1) and (a[i] <> 0) then
        break;
    res[1]:=i;
    res[2]:=a[0];
    for i:=3 to n do res[i]:=a[res[i-2]];
end;

procedure output;
var f:text;
    i:longint;
begin
    assign(f,fo);
    rewrite(f);
    for i:=1 to n do write(f,res[i],' ');
    close(f);
end;

begin
    input;
    main;
    output;
end.
