const fi = 'll-10.inp';
      fo = 'll-10.out';
      maxn = 1000;

var n:longint;
    res:string;
    a:array[1..maxn,1..maxn] of boolean;
    avail:array[1..maxn] of boolean;
    b:array[1..maxn] of longint;

procedure input;
var f:text;
    d1,d2:longint;
begin
    assign(f,fi);
    reset(f);
    readln(f,n);
    while not seekeof(f) do
    begin
        read(f,d1);
        while not seekeoln(f) do
        begin
            read(f,d2);
            a[d1,d2]:=true;
            inc(b[d2]);
        end;
        readln(f);
    end;
    close(f);
    fillchar(avail,sizeof(avail),true);
end;

procedure main;
var i,j,count:longint;
    tmp:string;
begin
    count:=0;
    while count < n do
    begin
        for i:=1 to n do if (b[i] = 0) and (avail[i]) then
        begin
            inc(count);
            for j:=1 to n do if a[i,j] then
            begin
                a[i,j]:=false;
                dec(b[j]);
            end;
            avail[i]:=false;
            str(i,tmp);
            res:=res + tmp + ' ';
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
