const num=256;
var x:real;

procedure input;
begin
	readln(x);
end;

function cal(i:longint):real;
begin
	if i < num then exit(x*x+i/cal(i*2))
	else exit((x*x)+num/(x*x));
end;

procedure output;
begin
	writeln((x/cal(2)):0:10);
end;

begin
	input;
	output;
end.