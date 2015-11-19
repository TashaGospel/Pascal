uses math;
const fi = 'choose.inp';
      fo = 'choose.out';
      maxn = 10001;

var n,k:longint;
    a,b,s:array[0..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,k);
    for i:=1 to n do read(f,a[i]);
    close(f);
end;

procedure main;
var i,j:longint;
begin
    for i:=1 to n do s[i]:=s[i-1] + a[i];

    for i:=1 to k do b[i]:=s[i];
    for i:=k+1 to n do
        for j:=i downto i - k do
            b[i]:=max(b[i], b[j-1] + s[i] - s[j]);
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,b[n]);
    close(f);
end;

begin
    input;
    main;
    output;
end.
