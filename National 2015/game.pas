const fi = 'game.inp';
      fo = 'game.out';



procedure parseFile;
var f,g:text;
    t,i,n,k,s0,s1,j:longint;
    tmp:char;
begin
    assign(f,fi);
    assign(f,fo);
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
        


