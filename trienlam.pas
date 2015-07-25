const fi = 'trienlam.inp';
	  fo = 'trienlam.out';
	  maxn = 10005;
type trienlam = record
	u,v:longint;
	end;
var n,res:longint;
	a:array[1..maxn] of trienlam;
	maxLen:array[1..maxn] of longint;

procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n);
	for i:=1 to n do read(f,a[i].u,a[i].v);
	close(f);
end;

procedure quicksort(c,d:longint);
var i,j,mid:longint;
	tmp:trienlam;
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
		end;
	until i > j;
	if c < j then quicksort(c,j);
	if i < d then quicksort(i,d);
end;

procedure main;
var i,j,len:longint;
begin
	for i:=1 to n do
	begin
		len:=a[i].v-a[i].u;
		maxLen[i]:=len;
		for j:=1 to i-1 do 
			if (maxLen[i] < maxLen[j] + len) and (a[j].v <= a[i].u) then
				maxLen[i]:= maxLen[j] + len;
		if res < maxLen[i] then res:=maxLen[i];
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
	quicksort(1,n);
	main;
	output;
end.
