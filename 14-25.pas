const fi = '14-25.inp';
	  fo = '14-25.out';
	  maxn = 1000;
var n,res:longint;
	a:array[1..maxn,1..maxn] of longint;
	b:array[0..maxn] of longint;

procedure input;
var f:text;
	i,j:longint;
begin
	assign(f,fi);
	reset(f);
	readln(f,n);
	for i:=1 to n do
	begin
		for j:=1 to i do read(f,a[i,j]);
		readln(f);
	end;
	close(f);
	b[0]:=0;
end;

procedure check;
var i,sum:longint;
begin
	sum:=0;
	for i:=1 to n do sum:=sum+a[i,b[i]];
	if sum > res then res:=sum;
end;

procedure main(c:longint);
var i:longint;
begin
	for i:=b[c-1] to b[c-1]+1 do
	begin
		if (1 <= i) and (i <= c) then
		begin
			b[c]:=i;
			if c < n then main(c+1)
			else check;
		end;
	end;
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,res);
	close(f);
end;

begin
	input;
	main(1);
	output;
end.