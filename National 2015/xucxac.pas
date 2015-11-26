const fi = 'xucxac.inp';
      fo = 'xucxac.out';
      maxn = 21 + 21 + 41;

var s1,s2,s3,res:longint;
    a:array[0..maxn] of longint;

procedure input;
var f:text;
begin
    assign(f,fi);
    reset(f);
    read(f,s1,s2,s3);
    close(f);
end;

procedure main;
var i,j,k:longint;
begin
    for i:=1 to s1 do
        for j:=1 to s2 do
            for k:=1 to s3 do
                inc(a[i + j +k]);
    res:=1;
    for i:=1 to s1 + s2 + s3 do if a[i] > a[res] then res:=i;
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
