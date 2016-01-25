const fi = 'professor.inp';
      fo = 'professor.out';
      maxn = 100001;

var n,res,resNum:longint;
    a:array[0..maxn,1..2] of longint;
    b:array[1..5] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do read(f,a[i,1],a[i,2]);
    close(f);
end;

procedure main;
var i,j:longint;
begin
    for i:=1 to n do
        for j:=1 to 5 do
            if (a[i,1] = j) or (a[i,2] = j) then
            begin
                inc(b[j]);
                if b[j] > res then
                begin
                    res:=b[j];
                    resNum:=j;
                end;
            end
            else b[j]:=0;
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,res,' ',resNum);
    close(f);
end;

begin
    input;
    main;
    output;
end.
