const fi = 'doan.inp';
	  fo = 'doan.out';
	  maxn = 1000;
var n,res:longint;
	a:array[1..maxn] of longint;

procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	readln(f,n);
	for i:=1 to n do read(f,a[i]);
	close(f);
	a[n+1]:=maxlongint;
end;

procedure main;
var i,tmp:longint;
begin
	res:=a[1];
	for i:=2 to n do if a[i] > res then res:=a[i];
	if res < 0 then exit;
	tmp:=0;
	for i:=1 to n+1 do
	begin
		if a[i]+tmp>=0 then tmp:=tmp+a[i]
		else 
		begin
			if tmp > res then res:=tmp;
			tmp:=0;
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
	main;
	output;
end.
