const fi = 'nkrez.inp';
	  fo = 'nkrez.out';
	  maxn = 10002;
type rez = record
	u,v:integer;
	end;
var n,maxres:integer;
	a:array[1..maxn] of rez;
	res:array[1..maxn] of longint;

procedure input;
var f:text;
	i:integer;
begin
	assign(f,fi);
	reset(f);
	read(f,n);
	for i:=1 to n do read(f,a[i].u,a[i].v);
	close(f);
end;

procedure quicksort(c,d:integer);
var i,j,mid:integer;
	tmp:rez;
begin
	i:=c; j:=d; mid:=a[(c+d) div 2].u;
	repeat
		while a[i].u < mid do inc(i);
		while a[j].u > mid do dec(j);
		if i<=j then
		begin
			tmp:=a[i];
			a[i]:=a[j];
			a[j]:=tmp;
			inc(i);
			dec(j);
		end
	until i>j;
	if c < j then quicksort(c,j);
	if i < d then quicksort(i,d);
end;

procedure main;
var i,j,value:integer;
begin
	for i:=1 to n do
	begin
		value:=a[i].v-a[i].u;
		res[i]:=value;
		for j:=i-1 downto 1 do 
		begin
			if (a[j].v <= a[i].u) and (res[i] < res[j] + value) then res[i]:=res[j] + value;
			if res[i] > maxres then maxres:=res[i];
		end;
	end;
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,maxres);
	close(f);
end;

begin
	input;
	quicksort(1,n);
	main;
	output;
end.
