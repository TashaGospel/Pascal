const fi = 'thanhpho.inp';
	  fo = 'thanhpho.out';
	  maxn = 1000;
var n,res,resCity:longint;
	a:array[1..maxn,1..maxn] of longint;

procedure input;
var f:text;
	i,j:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n);
	for i:=1 to n do
		for j:=1 to n do
		begin
			read(f,a[i,j]);
			if (i <> j) and (a[i,j] = 0) then a[i,j]:=maxlongint;
		end;
	close(f);
	res:=maxlongint;
end;

procedure floyd;
var k,i,j:longint;
begin
	for k:=1 to n do
		for i:=1 to n do
			for j:=1 to n do
				if a[i,j] > a[i,k] + a[k,j] then
					a[i,j]:=a[i,k] + a[k,j];
end;

procedure main;
var i,j,maxLen:longint;
begin
	floyd;
	for i:=1 to n do // chosen city
	begin
		maxLen:=0;
		for j:=1 to n do if a[j,i] > maxLen then maxLen:=a[j,i];
		if maxLen < res then
		begin
			res:=maxLen;
			resCity:=i;
		end;
	end;
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,resCity);
	close(f);
end;

begin
	input;
	main;
	output;
end.
