uses math;
const fi = 'daychuv.inp';
	  fo = 'daychuv.out';
	  maxn = 10005;
var n,res:longint;
	a,l,r:array[1..maxn] of longint;

procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n);
	for i:=1 to n do read(f,a[i]);
	close(f);
end;

procedure left;
var i,j:longint;
begin
	for i:=1 to n do
	begin
		l[i]:=1;
		for j:=1 to i-1 do if (a[i] <= a[j]) and (l[i] < l[j]+1) then
			l[i]:=l[j]+1;
	end;
end;

procedure right;
var i,j:longint;
begin
	for i:=n downto 1 do
	begin
		r[i]:=1;
		for j:=i+1 to n do if (a[i] <= a[j]) and (r[i] < r[j]+1) then
			r[i]:=r[j]+1;
	end;
end;

procedure main;
var i,cur:longint;
begin
	left;
	right;
	for i:=1 to n do
	begin
		cur:=min(l[i],r[i]);
		if cur > res then res:=cur;
	end;
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,res*2-1);
	close(f);
end;

begin
	input;
	main;
	output;
end.
