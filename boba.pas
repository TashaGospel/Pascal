const fi = 'boba.inp';
      fo = 'boba.out';
      maxn = 101;

var n,count:longint;
    res:int64;
    x,y:array[1..maxn] of longint;

procedure input;
var f:text;
    i,j:longint;
    tmp:char;
begin
    assign(f,fi);
    reset(f);
    read(f,n,tmp);
    for i:=1 to n do
    begin
        for j:=1 to n do
        begin
            read(f,tmp);
            if ('A'<= tmp) and (tmp <= 'Z') then
            begin
                inc(count);
                x[count]:=i;
                y[count]:=j;
            end;
        end;
        readln(f);
    end;
    close(f);
end;

procedure main;
var i,j,k:longint;
begin
    for i:=1 to count do
        for j:=i+1 to count do
            for k:=j+1 to count do
                if x[i]*(y[j]-y[k]) + x[j]*(y[k]-y[i]) + x[k]*(y[i]-y[j]) = 0 then inc(res);
        
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
