Program The_Matrix;
uses crt;
var n, i: longint;
begin
	clrscr;
	writeln;
	writeln('Press Enter?');
	readln;
	clrscr;
	textcolor(green);
	for n:=1 to 500 do
		begin
		for i:=1 to 80 do
			begin
			GotoXY(i,WhereY);
			write(random(9));
			end;
		end;
	writeln;
	textcolor(white);
	writeln('Press Enter?');
	readln;
end.
