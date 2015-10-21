const fi = '14-31.inp';
	  fo = '14-31.out';
	  maxn = 1000;
var a:array[1..maxn,1..maxn] of longint;

procedure input;
var f:text;
	i,j:longint;
begin
	assign(f,fi);
	reset(f);
	for i:=1 to 9 do
		for j:=1 to 9 do read(f,a[i,j]);
	close(f);
end;

procedure output(c:boolean);
var f:text;
	i,j:longint;
begin
	assign(f,fo);
	rewrite(f);
	if c then
		for i:=1 to 9 do
		begin
			for j:=1 to 9 do write(f,a[i,j],' ');
			writeln(f);
		end
	else write(f,c);
	close(f);
	halt;
end;

function ok(x,y,i:longint):boolean;
var j,z:longint;
begin
	for j:=1 to 9 do if (a[x,j] = i) or (a[j,y] = i) then exit(false);
	for j:=3*((x-1) div 3 +1)-2 to 3*((x-1) div 3 + 1) do
		for z:=3*((y-1) div 3 +1)-2 to 3*((y-1) div 3 + 1) do
			if a[j,z] = i then exit(false);
	exit(true);
end;	

procedure main(x,y:longint);
var i:longint;
begin
	if a[x,y] = 0 then
	begin
		for i:=1 to 9 do if ok(x,y,i) then
		begin
			a[x,y]:=i;
			if y<9 then main(x,y+1)
			else if x<9 then main(x+1,1)
			else output(true);
			a[x,y]:=0;
		end;
	end
	else
	if y<9 then main(x,y+1)
	else if x<9 then main(x+1,1)
	else output(true);
end;

begin
	input;
	main(1,1);
	output(false);
end.
