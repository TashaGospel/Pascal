uses math;
const fi = 'cowgirl.inp';
      fo = 'cowgirl.out';
      maxn = 30;
      maxWidth = 5;
      maxSize = 1 shl maxWidth - 1;

function getBit(state:longint; bit:byte):byte;
begin
    exit(state shr bit and 1);
end;

function isOkayPair(state1, state2, width:longint):boolean;
var i,s1,s2,s3,s4:longint;
begin
    for i:=0 to width - 2 do 
    begin
        s1:=getBit(state1,i);
        s2:=getBit(state2,i);
        s3:=getBit(state1,i+1);
        s4:=getBit(state2,i+1);
        if (s1 = s2) and (s2 = s3) and (s3 = s4) then exit(false);
    end;
    exit(true);
end;

function main(n,m:longint):longint;
var i, state, preState, res, size:longint;
    b:array[0..maxn,0..maxSize] of longint;
begin
    size:= 1 shl m - 1;
    res:= 0;

    for state:=0 to size do b[1,state]:=1;

    for i:=2 to n do
        for state:=0 to size do
        begin
            b[i,state]:=0;
            for preState:=0 to size do if isOkayPair(state, preState, m) then
                b[i, state]:=b[i,state] + b[i-1, preState];
        end;

    for state:=0 to size do res:=res + b[n,state];
    exit(res);
end;

procedure parseFile;
var f, g:text;
    t, m, n, i, tmp:longint;
begin
    assign(f,fi);
    assign(g,fo);
    reset(f);
    rewrite(g);
    read(f,t);
    for i:=1 to t do
    begin
        read(f, n, m);
        if n < m then
        begin
            tmp:=n;
            n:=m;
            m:=tmp;
        end;
        writeln(g,main(n,m));
    end;
    close(f);
    close(g);
end;

begin
    parseFile;
end.
