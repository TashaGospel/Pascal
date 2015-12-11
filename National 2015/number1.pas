const fi = 'number1.inp';
      fo = 'number1.out';
      maxn = 10001;

var a:array[0..maxn] of longint;

procedure main(cur:longint);
var rem:longint;
begin
    begin
        rem:=0;
        repeat
            inc(a[cur]);
            rem:=(rem * 10 + 1) mod cur;
        until rem = 0;
    end;
end;

procedure parseFile;
var f,g:text;
    i,t,cur:longint;
begin
    assign(f,fi);
    assign(g,fo);
    reset(f);
    rewrite(g);
    read(f,t);
    for i:=1 to t do
    begin
        read(f,cur);
        if a[cur] = 0 then main(cur);
        writeln(g,a[cur]);
    end;
    close(f);
    close(g);
end;

begin
    parseFile;
end.
