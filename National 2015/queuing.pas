const fi = 'queuing.inp';
      fo = 'queuing.out';

var s,res:ansistring;

procedure input;
var f:text;
begin
    assign(f,fi);
    reset(f);
    read(f,s);
    close(f);
end;

procedure main;
var i:longint;
    c:char;
begin
    for i:=1 to length(s) do
        if s[i] > s[i+1] then break;
    c:=s[i];
    
    for i:=1 to length(s) do
        if s[i] <> c then res:=res + s[i];
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,res);
    close(f);
end;

begin
    input;
    main;
    output;
end.
