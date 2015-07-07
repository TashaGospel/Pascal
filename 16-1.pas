const fi = '16-1.inp';
	  fo = '16-1.out';
	  maxn = 1000;
var n,count:longint;
	a:array[1..maxn,1..maxn] of longint;
	path:array[1..maxn] of longint;
	b:array[1..maxn] of boolean;

procedure input;
var f:text;
	i,j:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n);
	for i:=1 to n do
		for j:=1 to n do read(f,a[i,j]);
	close(f);
	fillchar(b,sizeof(b),false);
end;

procedure check(c:longint);
var i:longint;
begin
	inc(count);
	path[count]:=c;
	b[c]:=true;
	for i:=1 to n do if (not b[i]) and (a[c,i] = 1) then check(i);
	dec(count);
end;

function main:boolean;
var i:longint;
begin
	check(1);
	for i:=1 to n do if (not b[i]) then exit (false);
	exit(true);
end;
	
{function main:boolean;
var stop1,stop2:boolean;
	i,j:longint;
begin
	b[1]:=true;
	while not stop do
	begin
		stop1:=true;
		for i:=1 to n do
		begin
			stop2:=false;
			for j:=1 to n do
				if (a[i,j] = 1) and (b[i] xor b[j]) then
				begin
					b[i]:=true;
					b[j]:=true;
					stop2:=true;
					break;
				end;
			if stop2 then 
			begin
				stop1:=false;
				break;
			end;
		end;
	end;
	for i:=1 to n do if not b[i] then exit(false);
	exit(true);
end;}

procedure output;
var f:text;
	i:longint;
begin
	assign(f,fo);
	rewrite(f);
	if not main then write(f,'NO')
	else 
	begin
		writeln(f,'Yes');
		for i:=1 to n do write(f,path[i],' ');
	end;
	close(f);
end;

begin
	input;
	output;
end.
	
