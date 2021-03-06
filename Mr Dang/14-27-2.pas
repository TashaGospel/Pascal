const fi = '14-27.inp';
	  fo = '14-27.out';
	  maxn = 1000;
var a:array[1..maxn,1..maxn] of char;
	b:array[1..maxn,1..maxn] of boolean;
	n,count:longint;
	
procedure input;
var f:text;
	i,j:longint;
	space:char;
begin
	assign(f,fi);
	reset(f);
	readln(f,n);
	for i:=1 to n-1 do
	begin
		for j:=1 to n-i do read(f,a[i,j],space);
		read(f,a[i,j+1]);
		readln(f);
	end;
	read(f,a[i+1,1]);
	close(f);
	fillchar(b,sizeof(b),false);
end;	

procedure printout(var f:text);
var i,j:longint;
begin
	inc(count);
	writeln(f,count,':');
	for i:=1 to n do
	begin
		for j:=1 to n-i+1 do 
		begin
			if b[i,j] then write(f,a[i,j]) else write(f,' ');
			write(f,' ');
		end;
		writeln(f);
	end;
	writeln(f);
end;	

procedure main(x,y:longint;var f:text);
begin
	b[x,y]:=true;
	if x+y < n+1 then 
	begin
		main(x+1,y,f);
		main(x,y+1,f);
	end
	else printout(f);
	b[x,y]:=false;
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	main(1,1,f);
	close(f);
	
end;

begin
	input;
	output;
end.
