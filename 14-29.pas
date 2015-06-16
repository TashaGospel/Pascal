const fi = '14-29.inp';
	  fo = '14-29.out';
	  maxn=1000;
var m,n,res,i:longint;
	a:array[1..maxn,1..maxn] of longint;

procedure input;
var f:text;
	i,j:longint;
begin
	assign(f,fi);
	reset(f);
	readln(f,m,n);
	for i:=1 to m do
	begin
		for j:=1 to n do read(f,a[i,j]);
		readln(f);
	end;
	close(f);
	res:=maxlongint;
end;

procedure main(x,y,sum:longint);
var i:longint;
begin
	if (y <= 0) or (n < y) then exit;
	if x = m then 
	begin
		if sum < res then res:=sum
	end
	else for i:=y-1 to y+1 do main(x+1,i,sum+a[x+1,i]);
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
	for i:=1 to n do main(1,i,a[1,i]);
	output;
end.


