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
var i,j:longint;
begin
	a[1]:=1;
	for i:=2 to n do
		for j:=1 to i-1 do a[i]:=a[i]+a[j]*a[i-j];
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
