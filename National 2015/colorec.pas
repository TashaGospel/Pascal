const fi = 'colorec.inp';
      fo = 'colorec.out';
      maxn = 201;

var n:longint;
    res:qword;
    a:array[-maxn..maxn,-maxn..maxn] of longint;

procedure input;
var f:text;
    i,d1,d2:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do read(f,d1,d2,a[d1,d2]);
    close(f);
end;

procedure main;
var i,j,k:longint;
    c:array[1..4,1..4] of longint;
begin
    for i:=-maxn to maxn-1 do
        for j:=i+1 to maxn do
        begin
            fillchar(c,sizeof(c),0);
            for k:=-maxn to maxn do
            begin
                if (a[i,k] <> 0) and (a[j,k] <> 0) and (a[i,k] <> a[j,k]) then
                    if a[i,k] < a[j,k] then inc(c[a[i,k],a[j,k]])
                    else inc(c[a[j,k],a[i,k]]);
            end;
            res:=res + c[1,2] * c[3,4] + c[1,3] * c[2,4] + c[1,4] * c[2,3];
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
