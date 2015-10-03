const fi = '16-3.inp';
	  fo = '16-3.out';
	  maxn = 1000;
var n:longint;
	a:array[1..maxn,1..maxn] of boolean;
	avail:array[1..maxn] of boolean;

procedure input;
var f:text;
	d1,d2:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n);
	fillchar(a,sizeof(a),false);
	while not eof(f) do
	begin
		read(f,d1,d2);
		a[d1,d2]:=true;
	end;
	close(f);
end;

procedure output(yes:boolean);
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,yes);
	close(f);
	halt;
end;

procedure check(c:longint);
var i:longint;
begin
	avail[c]:=false;
	for i:=1 to n do if (avail[i]) and (a[c,i]) then check(i);
end;

procedure main;
var i,j:longint;
begin
	for i:=1 to n do
	begin
		fillchar(avail,sizeof(avail),true);
		check(i);
		for j:=1 to n do if avail[j] then output(false);
	end;
	output(true);
end;

begin
	input;
	main;
end.
