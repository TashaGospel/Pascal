uses math;
const fi = 'thanchu.inp';
      fo = 'thanchu.out';
      maxn = 1000;

var s:ansistring;
    l1,r1,l2,r2:longint;
    b:array[0..maxn,0..maxn] of longint;

procedure input;
var f:text;
begin
    assign(f,fi);
    reset(f);
    read(f,l1,r1,l2,r2);
    close(f);
end;

procedure mainString;
var i:char;
begin
    for i:='a' to 'z' do
        s:=s + i + s;
end;

procedure main;
var i,j:longint;
begin
    for i:=l1 to r1 do
        for j:=l2 to r2 do
            if s[i] = s[j] then b[i,j]:=b[i-1,j-1] + 1
            else b[i,j]:=max(b[i-1,j],b[i,j-1]);
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,b[r1-l1+1,r2-l2+1]);
    close(f);
end;

begin
    input;
    mainString;
    main;
    output;
end.
