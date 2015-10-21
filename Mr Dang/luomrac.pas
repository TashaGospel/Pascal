const fi = 'luomrac.inp';
      fo = 'luomrac.out';
      maxn = 24;
      
var res, count:longint;
    a:array[1..maxn,1..maxn] of boolean;

procedure main;
var i,x,y:longint;
begin
    res:=1; x:=1; y:=1;
    while count > 0 do
    begin
        if x > maxn then
        begin
            x:=1; y:=1;
            inc(res);
        end;
        for i:=y to maxn do if a[x,i] then
        begin
            y:=i;
            dec(count);
            a[x,i]:=false;
        end;
        inc(x);
    end;
end;

procedure parseFile;
var f,g:text;
    d1,d2:longint;
begin
    assign(f,fi);
    assign(g,fo);
    reset(f);
    rewrite(g);
    while true do
    begin
        read(f,d1,d2);
        if (d1 = 0) and (d2 = 0) then
        begin
        writeln(d1,' ',d2);
            main;
            writeln(g,res);
            count:=0;
        end
        else if (d1 = -1) and (d2 = -1) then break
        else
        begin
            inc(count);
            a[d1,d2]:=true;
        end;
    end;
    close(f);
    close(g);
end;

begin
    parseFile;
end.
