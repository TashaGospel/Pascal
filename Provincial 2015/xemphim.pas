const fi = 'xemphim.inp';
	  fo = 'xemphim.out';
	  maxn = 1000;
var n,sum,c:longint;
	a:array[1..maxn] of longint;

procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	readln(f,n,c);
	for i:=1 to n do read(f,a[i]);
	close(f);
end;

//Greedy Method

procedure quicksort(d,c:longint);
var i,j,mid,tmp:longint;
begin
	i:=d; j:=c; mid:=a[(d+c) div 2];
	repeat
		while a[i] < mid do inc(i);
		while mid < a[j] do dec(j);
		if i <= j then
		begin
			tmp:=a[i];
			a[i]:=a[j];
			a[j]:=tmp;
			inc(i);
			dec(j);
		end;
	until i > j;
	if i < c then quicksort(i,c);
	if d < j then quicksort(d,j);
end;

procedure main;
var i:longint;
begin
	for i:=n downto 1 do if sum + a[i] <= c then sum:=sum+a[i];
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
