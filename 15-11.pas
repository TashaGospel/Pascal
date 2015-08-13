const fi = '15-11.inp';
	  fo = '15-11.out';
	  maxn = 100001;

var n:longint;
	a:array[0..maxn] of longint;

procedure input;
var f:text;
begin
	assign(f,fi);
	reset(f);
	read(f,n);
	close(f);
end;

procedure main;
var i:longint;
begin
	a[0]:=0; a[1]:=0; a[2]:=1;
	for i:=3 to n do a[i]:=a[i-1]*(i-1);
end;
			
procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,a[n]);
	close(f);
end;

begin
	input;
	main;
	output;
end.
