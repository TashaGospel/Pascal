uses math;
const fi = 'nkcable.inp';
      fo = 'nkcable.out';
      maxn = 25001;
      
var n:longint;
    a,b:array[0..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n-1 do read(f,a[i]);
    close(f);
end;

procedure main;
var i:longint;
begin
    b[2]:=a[1];
    b[3]:=a[1] + a[2];
    for i:=4 to n do b[i]:= min(b[i-1],b[i-2]) + a[i-1];
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
