uses math;
const fi = '15-3.inp';
      fo = '15-3.out';
      maxn = 1001;

var n,r,sum:longint;
    a,b,d,chosenA:array[1..maxn] of longint;
    c,u:array[0..maxn,0..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,r);
    for i:=1 to n do read(f,d[i]);
    for i:=1 to n do read(f,a[i]);
    for i:=1 to n do 
    begin
        read(f,b[i]);
        sum:=sum+b[i]*d[i];
    end;
    close(f);
end;

procedure main;
var i,j,k,tmp:longint;
begin
    for i:=1 to n do
        for j:=1 to r do
            for k:=0 to min(d[i],j) do
            begin
                tmp:=c[i-1,j-k] + k*(b[i] - a[i]);
                if tmp > c[i,j] then
                begin
                    c[i,j]:=tmp;
                    u[i,j]:=k;
                end;
            end;
end;

procedure path;
var curR,i:longint;
begin
    curR:=r;
    for i:=n downto 1 do
    begin
        chosenA[i]:=u[i,curR];
        curR:=curR - chosenA[i];
    end;
end;

procedure output;
var f:text;
    i:longint;
begin
    assign(f,fo);
    rewrite(f);
    writeln(f,sum - c[n,r]);
    for i:=1 to n do write(f,chosenA[i], ' ');
    writeln(f);
    for i:=1 to n do write(f,d[i] - chosenA[i], ' ');
    close(f);
end;

begin
    input;
    main;
    path;
    output;
end.
