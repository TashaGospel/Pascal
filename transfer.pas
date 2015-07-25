const fi = 'transfer.inp';
	  fo = 'transfer.out';
	  maxn = 100005;
type transfer = record
	u,v,index:longint;
	end;
var n,respos:longint;
	a:array[1..maxn] of transfer;
	maxLen,trace:array[0..maxn] of longint;

procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n);
	for i:=1 to n do 
	begin
		read(f,a[i].u,a[i].v);
		a[i].index:=i;
	end;
	close(f);
end;

procedure quicksort(c,d:longint);
var i,j,mid:longint;
	tmp:transfer;
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
		for j:=i-1 downto 1do 
			if (maxLen[i] < maxLen[j] + len) and (a[j].v <= a[i].u) then
			begin
				maxLen[i]:= maxLen[j] + len;
				trace[i]:=j;
			end;
		if maxLen[respos] < maxLen[i] then respos:=i;
	end;
end;

procedure output;
var f:text;
	i:longint;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f,maxLen[respos]);
	i:=respos;
	repeat
		write(f,a[i].index,' ');
		i:=trace[i];
	until i = 0;
	close(f);
end;

begin
	input;
	quicksort(1,n);
	main;
	output;
end.
