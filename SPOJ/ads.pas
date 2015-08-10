const fi = 'ads.inp';
	  fo = 'ads.out';
	  maxn = 2001;

var n,m,count:longint;
	a:array[1..maxn,1..maxn] of boolean;
	b:array[1..maxn] of boolean;

procedure input;
var f:text;
	i,d1,d2:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n,m);
	for i:=1 to m do
	begin
		read(f,d1,d2);
		a[d1,d2]:=true;
		a[d2,d1]:=true;
	end;
	close(f);
end;

procedure visit(c:longint);
var i:longint;
begin
	b[c]:=true;
	for i:=1 to n do if (a[c,i]) and (not b[i]) then visit(i);
end;

procedure main;
var i:longint;
begin
	for i:=1 to n do if not b[i] then
	begin
		inc(count);
		visit(i);
	end;
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,m-n+count);
	close(f);
end;

begin
	input;
	main;
	output;
end.	
