const fi = '14-17.inp';
	  fo = '14-17.out';
	  maxn = 1000;
var k,n:longint;
	a:array[0..maxn] of longint;

procedure input;
var f:text;
begin
	assign(f,fi);
	reset(f);
	readln(f,n,k);
	close(f);
end;

procedure output;
var f:text;
procedure main(i:longint);
var j,x:longint;
begin
	for j:=a[i-1]+1 to n do
	begin
		a[i]:=j;
		if i < k then main(i+1)
		else
		begin
			for x:=1 to k do 
				write(f,a[x]);
			write(f,' ');
		end;
	end;
end;
begin
	assign(f,fo);
	rewrite(f);
	main(1);
	close(f);
end;

begin
	a[0]:=0;
	input;
	output;
end.

