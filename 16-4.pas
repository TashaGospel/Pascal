const fi = '16-4.inp';
	  fo = '16-4.out';
	  maxn = 1000;
var n,res:longint;
	a:array[1..maxn,1..maxn] of boolean;
	avail:array[1..maxn] of boolean;

procedure input;
var f:text;
	i,j,s:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n);
	for i:=1 to n do
		for j:=1 to n do 
		begin
			read(f,s);
			if s = 1 then a[i,j]:=true else a[i,j]:=false;
		end;
	close(f);
	fillchar(avail,sizeof(avail),true);
end;

procedure main;
var k,i,j:longint;
begin
	for k:=1 to n do
		for i:=1 to n do
			for j:=1 to n do
				a[i,j]:=a[i,j] or (a[i,k] and a[k,j]);
	for i:=1 to n do if avail[i] then
	begin
		inc(res);
		avail[i]:=false;
		for j:=1 to n do if (a[i,j] and avail[j]) then avail[j]:=false;
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
