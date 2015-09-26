const fi = 'bcdaisy.inp';
	  fo = 'bcdaisy.out';
	  maxn = 251;

var n,m:longint;
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

procedure main(c:longint);
var i:longint;
begin
	b[c]:=true;
	for i:=1 to n do if (a[c,i]) and (not b[i]) then main(i);
end;

procedure output;
var f:text;
	i:longint;
	tmp:boolean;
begin
	assign(f,fo);
	rewrite(f);
	tmp:=false;
	for i:=1 to n do if not b[i] then 
	begin
		writeln(f,i);
		tmp:=true;
	end;
	if not tmp then writeln(f,0);
	close(f);
end;

begin
	input;
	main(1);
	output;
end.
	
