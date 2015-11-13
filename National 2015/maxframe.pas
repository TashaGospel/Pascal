uses math;
const fi = 'maxframe.inp';
      fo = 'maxframe.out';
      maxn = 401;

var n,m,res:longint;
    a,s:array[0..maxn,0..maxn] of longint;

procedure input;
var f:text;
    i,j:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m);
    for i:=1 to n do
        for j:=1 to m do read(f,a[i,j]);
    close(f);
end;


procedure main;
var i,j,curSum,k:longint;
begin
    for i:=1 to n do
        for j:=1 to m do s[i,j]:=s[i,j-1] + a[i,j];

    for i:=1 to m do
        for j:=i+1 to m do
        begin
            curSum:=s[1,j] - s[1,i-1];
            for k:=2 to n do
            begin
                res:=max(res,curSum + s[k,j] - s[k,i-1]);
                curSum:=curSum + a[k,i] + a[k,j];
                if curSum < 0 then curSum:=s[k,j] - s[k,i-1];
            end;
        end;
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,res);
    close(f);
end;

begin
    input;
    main;
    output;
end.
