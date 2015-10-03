const fi = 'nktoss.inp';
      fo = 'nktoss.out';

var n, k, res:longint;
      
procedure input;
var f:text;
begin
    assign(f,fi);
    reset(f);
    read(f,n,k);
    close(f);
end;

// Working on it - October 3rd, 2015
procedure main;
var i:longint;
begin
    for i:=k to n do res:= res + n - i + 1;
    for i:=k to n do writeln(n-i+1);
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
