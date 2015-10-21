var n:longint;

procedure input;
begin
	while n mod 2 = 0 do
		readln(n);
end;

function cal(i:longint):real;
begin
	if i < n then exit(1/(i+cal(i+2)))
	else exit(1/i);
end;

procedure output;
begin
	writeln(cal(1):0:10);
end;

begin
	input;
	output;
end.