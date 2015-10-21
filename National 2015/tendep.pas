uses math;
const fi = 'tendep.inp';
      fo = 'tendep.out';

function main(countA,countB,maxA,maxB):longint;
var
begin
    if 
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
