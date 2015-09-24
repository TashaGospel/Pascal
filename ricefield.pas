const fi = 'ricefield.inp';
      fo = 'ricefield.out';
      maxn = 101;

var l,n,num:longint;
    a,b:array[0..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,l,n);
    a[0]:=l;
    for i:=1 to n do 
    begin
        read(f,a[i]);
        a[0]:=a[0]-a[i];
    end;
    close(f);
end;

procedure print(var f:text);
var i:longint;
begin
    for i:=1 to l do write(f,b[i],' ');
    writeln(f);
    inc(num);
    if num = 1000 then 
    begin
        close(f);
        halt;
    end;
end;

procedure main(c:longint; var f:text);
var i:longint;
begin
    if c > l then
    begin
        print(f);
        exit;
    end;
    if (b[c-1] <> 0) and (a[b[c-1]] > 0) then
    begin
        b[c]:=b[c-1];
        dec(a[b[c-1]]);
        main(c+1,f);
        inc(a[b[c-1]]);
    end
    else for i:=0 to n do if a[i] > 0 then
    begin
        b[c]:=i;
        dec(a[i]);
        main(c+1,f);
        inc(a[i]);
    end;
end;

procedure output;
var f:text;
    i:longint;
begin
    assign(f,fo);
    rewrite(f);
    for i:=1 to n do
    begin
        b[1]:=i;
        dec(a[i]);
        main(2,f);
        inc(a[i]);
    end;
    close(f);
end;
    
begin
    input;
    output;
end.
