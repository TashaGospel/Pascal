const fi = 'fibistr.inp';
      fo = 'fibistr.out';
      maxn = 100;

type thing = record
    l:qword;
    front,back:ansistring;
    end;

var n,:longint;
    s:ansistring;
    a,b,c:thing;
    f:array[1..maxn] of ansistring;

function main:qword;
var lenS,i:qword;
begin
    lenS:=length(s);
    f[1]:='A'; f[2]:='B';
    i:=2;
    while (length(f[i]) < lenS) and (length(f[i-1]) < lenS) do
    begin
        inc(i);
        f[i]:=f[i-1] + f[i-2];
    end;

    a.v:=length(f[i]);
    a.front:=copy(f[i],1,lenS - 1); a.back:=copy(f[i],a.v - 
    b.v:=length(f[i]); a.front:=copy(f[i],1,lenS - 1);
{
    a.l:=1; b.l:=1;
    a.front:='A'; a.back:='A';
    b.front:='B'; b.back:='B';
    i:=2;
    while c.l < lenS do
    begin
        inc(i);
        c.l:=b.l + a.l;
        // if c.l >= lenS 
        c.front:=copy(b.front,1,length(b.front)) + copy(a.front,1,length(a.front));
}
        
    

procedure parseFile;
var f,g:text;
    n:int64;
begin
    assign(f,fi);
    assign(g,fo);
    reset(f);
    rewrite(g);
    while not seekeof(f) do
    begin
        readln(f,n,s);
        writeln(g,main);
    end;
    close(f);
    close(g);
end;
