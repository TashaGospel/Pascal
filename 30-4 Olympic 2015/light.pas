const fi = 'light.inp';
	  fo = 'light.out';
	  maxn = 100000;
var a,b:array[1..maxn] of longint;
	x:array[-maxn..maxn] of boolean;
	{c:array[1..maxn,1..maxn] of longint;}
	n,count:longint;
procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	readln(f,n);
	for i:=1 to n do read(f,a[i]);
	readln(f);
	for i:=1 to n do read(f,b[i]);
	close(f);
	fillchar(x,sizeof(x),false);
	{fillchar(c,sizeof(c),0);}
end;

procedure quicksorta(d,c:longint);
var i,j,mid,tmp:longint;
begin
	i:=d;
	j:=c;
	mid:=a[(d+c) div 2];
	repeat
		while a[i] < mid do inc(i);
		while a[j] > mid do dec(j);
		if i<=j then
		begin
			tmp:=a[i];
			a[i]:=a[j];
			a[j]:=tmp;
			inc(i);
			dec(j);
		end;
	until i > j;
	if d<j then quicksorta(d,j);
	if i<c then quicksorta(i,c);
end;

procedure quicksortb(d,c:longint);
var i,j,mid,tmp:longint;
begin
	i:=d;
	j:=c;
	mid:=b[(d+c) div 2];
	repeat
		while b[i] < mid do inc(i);
		while b[j] > mid do dec(j);
		if i<=j then
		begin
			tmp:=b[i];
			b[i]:=b[j];
			b[j]:=tmp;
			inc(i);
			dec(j);
		end;
	until i > j;
	if d<j then quicksortb(d,j);
	if i<c then quicksortb(i,c);
end;

{procedure main;
var x:array[-maxn..maxn] of boolean;
	d1,d2:longint;
begin
	function check1;
	begin

	for i:=1 to n do
	for j:=1 to n do
		if a[i] > b[j] then
		begin
			if check1 then d1:=
			c[a[i],b[j]]:=max(c[a[i+1],b[j]],c[a[i],b[j-1]]);
		else 
			c[a[i],b[j]]:=max(c[a[i-1],b[j]],c[a[i],b[j+1]]);}
procedure solve(d,c:longint);
var ok:boolean;
	i:longint;
begin
	ok:=true;
	for i:=d to c do if x[i] then
	begin
		ok:=false;
		break;
	end;
	if ok then
	begin
		inc(count);
		for i:=d to c do x[i]:=true;
	end;
end;

procedure main;
var i,j:longint;
begin
	for i:=1 to n do
	for j:=1 to n do
	if a[i] < b[j] then solve(a[i],b[j])
	else solve(b[j],a[i]);
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,count);
	close(f);
end;

begin
	input;
	quicksorta(1,n);
	quicksortb(1,n);
	main;
	output;
end.
