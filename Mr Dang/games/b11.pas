const fi = 'b11.inp';
      fo = 'b11.out';
      maxn = 1000;

var n:longint;
    a:array[0..maxn] of longint;
    chosen:array[0..maxn] of boolean;

procedure input;
var f:text;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    close(f);
end;

procedure main;
var i,j:longint;
begin
    for i:=2 to n do
    begin
        fillchar(chosen,sizeof(chosen),false);
        for j:=1 to i div 2 do chosen[a[i - j]]:=true;
        j:=0;
        while chosen[j] do inc(j);
        a[i]:=j;
    end;
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,a[n]);
    close(f);
end;

begin
    input;
    main;
    output;
end.
