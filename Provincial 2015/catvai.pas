const fi = 'catvai.inp';
	  fo = 'catvai.out';
var m,n,res:longint;

procedure input;
var f:text;
begin
	assign(f,fi);
	reset(f);
	read(f,m,n);
	close(f);
end;

procedure main;
begin
	while (m > 0) and (n > 0) do
	begin
		if m>=n then m:=m-n
		else n:=n-m;
		inc(res);
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
	main;
	output;
end.
