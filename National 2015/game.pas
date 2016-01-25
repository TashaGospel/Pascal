const fi = 'game.inp';
      fo = 'game.out';

function c(k,n:longint):longint;
var i,res:longint;
begin
    res:=1;
    for i:=k+1 to n do res:=res*i;
    for i:=1 to n - k do res:=res div i;
    exit(res);
end;

function main(s0,s1,k:longint):longint;
var i,res:longint;
begin
    i:=0; res:=0;
    while (s1 + s0 - 3 * i >= k) and (s1 >= 3 * i) do
    begin
        if (s1 - 3 * i + s0 - k) mod 2 = 0 then inc(res,c(s1 - 3 * i, k));
        inc(i);
    end;
    exit(res);
end;

procedure parseFile;
var f,g:text;
    t,i,n,k,s0,s1,j:longint;
    tmp:char;
begin
    assign(f,fi);
    assign(g,fo);
    reset(f);
    rewrite(g);
    readln(f,t);
    for i:=1 to t do
    begin
        s1:=0; s0:=0;
        readln(f,n,k);
        for j:=1 to n do
        begin
            read(f,tmp);
            if tmp = '1' then inc(s1) else inc(s0);
        end;
        readln(f);
        writeln(g,main(s0,s1,k));
    end;
    close(f);
    close(g);
end;

begin
    parseFile;
end.
