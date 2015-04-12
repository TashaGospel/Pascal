const fi = 'tamgiaccan.inp';
	  fo = 'tamgiaccan.out';
	  maxn = 1000;
var n,sum:longint;
	a:array[1..maxn] of longint;

procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	readln(f,n);
	for i:=1 to n do readln(f,a[i]);
	close(f);
	sum:=0;
end;

procedure quicksort(d,c:longint);
var i,j,mid,tmp:longint;
begin
	i:=d;
	j:=c;
	mid:=a[(d+c) div 2];
	repeat
	while a[i] < mid do inc(i);
	while a[j] > mid do dec(j);
	if i <= j then
	begin
		tmp:=a[i];
		a[i]:=a[j];
		a[j]:=tmp;
		inc(i);
		dec(j);
	end;
	until i>j;
	if d < j then quicksort(d,j);
	if i < c then quicksort(i,c);
end;

function tohop(i,k:longint):longint;
var j,s:longint;
begin
	s:=1;
	for j:=i-k+1 to i do s:=s*j;
	for j:=1 to k do s:=s div j;
	exit(s);
end;

procedure main;
var i,j,count:longint;
begin
	i:=0;j:=1;
	while i < n do
	begin
		inc(i);
		count:=1;
		while a[i+1]=a[i] do
		begin
			inc(i);
			inc(count);
		end;
		while (a[j] < (a[i] * 2)) and (j<=n) do inc(j);
		if count >= 2 then sum:=sum+tohop(count,2)*(j-count-1);
		if count >= 3 then sum:=sum+tohop(count,3);
		count:=1;
	end;
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,sum);
	close(f);
end;

begin
	input;
	quicksort(1,n);
	main;
	output;
end.