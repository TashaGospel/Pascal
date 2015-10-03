const fi = '14-32.inp';
	  fo = '14-32.out';
	  maxn = 1000;
var n,w,maxwei:longint;
	a,b,c:array[1..maxn] of longint;

procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	readln(f,n,w);
	for i:=1 to n do read(f,a[i]);
	close(f);
end;

procedure check;
var i,curwei:longint;
begin
	curwei:=0;
	for i:=1 to n do if b[i]=1 then curwei:=curwei+a[i];
	if (curwei < w) and (curwei > maxwei) then
	begin
		maxwei:=curwei;
		c:=b;
	end;
end;

procedure main(i:longint);
var j:longint;
begin
	for j:=0 to 1 do
	begin
		b[i]:=j;
		if i = n then check
		else main(i+1);
	end;
end;

procedure output;
var f:text;
	i:longint;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f,maxwei);
	for i:=1 to n do if c[i] = 1 then write(f,a[i],' ');
	close(f);
end;

begin
	input;
	main(1);
	output;
end.