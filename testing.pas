uses crt;
type snakebody=record
	x,y:longint;
	end;
var size:longint;
	pressed:char;
	snake:array[1..200] of snakebody;

procedure input;
begin
	clrscr;
	write('Map size (recommended:12) = ');read(size);
end;

procedure prep;
var i,j:longint;
begin
	writeln('Behold the glory that is this wonderful game!');
	writeln;
	for i:=1 to size*4+2 do write('-');
	writeln;
	for j:=1 to size do
	begin
		write('|');
		for i:=1 to size*4 do write(' ');
		writeln('|');
	end;
	for i:=1 to size*4+2 do write('-');
	snake[1].x:=(size*4+2) div 2;
	snake[1].y:=3+((size+2) div 2);
	gotoxy(snake[1].x,snake[1].y);
	write('o');
end;

procedure generatex;
var randomx,randomy:longint;
begin
	randomize;
	randomx:=random(size*4)+1;
	randomy:=random(size)+1;
	gotoxy(randomx,randomy);
	write('x');
end;

{procedure movesnake(key:char);
var
begin


procedure main;
var
begin
if keypressed then
repeat
	generatex;




	






until false;
end;}



begin
	input;
	prep;
	generatex;
end.


