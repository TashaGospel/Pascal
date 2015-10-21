const fi = 'vmrr.inp';
      fo = 'vmrr.out';

function main(s:ansistring; x, y:char):int64;
var i:longint;
    count, res:int64;
begin
    count:=0; res:=0;
    for i:=1 to length(s) do 
    begin
        if s[i] = y then inc(res, count);
        if s[i] = x then inc(count);
    end;
    exit(res);
end;

procedure parseFile;
var f,g:text;
    s:ansistring;
    x, y:char;
begin
    assign(f,fi);
    assign(g,fo);
    reset(f);
    rewrite(g);
    readln(f,s);
    read(f,x,y);
    write(g,main(s,x,y));
    close(f);
    close(g);
end;

begin
    parseFile;
end.
