uses math;
const fi = 'tendep.inp';
      fo = 'tendep.out';

procedure swapVal(var a,b:longint);
var tmp:longint;
begin
    tmp:=a;
    a:=b;
    b:=tmp;
end;

function main(countA,countB,maxA,maxB:longint):longint;
begin
    if countA > countB then
    begin
        swapVal(countA,countB);
        swapVal(maxA,maxB);
    end;

    if maxA = 0 then exit(min(countB,maxB));
    if maxB = 0 then exit(min(countA,maxA));

    if (countB div (countA + 1)) < maxB then exit(countA + countB)
    else exit(maxB * (countA + 1) + countA)
end;

procedure parseFile;
var f,g:text;
    i,t,countA,countB,maxA,maxB:longint;
begin
    assign(f,fi);
    assign(g,fo);
    reset(f);
    rewrite(g);
    read(f,t);
    for i:=1 to t do
    begin
        read(f,countA,countB,maxA,maxB);
        writeln(g,main(countA,countB,maxA,maxB));
    end;
    close(f);
    close(g);
end;

begin
    parseFile;
end.
