type fraction = record
	x,y:longint;
	val:real;
	end;
var n,count:longint;
	a:array[1..1000] of fraction;

procedure input;
begin 
	readln(n);
	count:=0
end;

function ok(c,d:longint):boolean;
var i:longint;
begin
	for i:=1 to count do if c/d = a[i].val then exit(false);
	exit(true);
end;

procedure main;
var i,j:longint;
begin
	for j:=1 to n do
		for i:=0 to j do
			if ok(i,j) then
			begin
				inc(count);
				a[count].x:=i;
				a[count].y:=j;
				a[count].val:=i/j;
			end;
end;

procedure quicksort(d,c:longint);
var	i,j:longint;
	mid:real;
	tmp:fraction;
begin
	i:=d; j:=c; mid:=a[(c+d) div 2].val;
	repeat
		while a[i].val < mid do inc(i);
		while a[j].val > mid do dec(j);
		if i <= j then
		begin
			tmp:=a[i];
			a[i]:=a[j];
			a[j]:=tmp;
			inc(i);
			dec(j);
		end;
	until i > j;
	if d < j then quicksort(d,j);
	if i < c then quicksort(i,c);
end;

procedure output;
var i:longint;
begin
	writeln(count);
	for i:=1 to count do write(a[i].x,'/',a[i].y,' ');
end;

begin
	input;
	main;
	quicksort(1,count);
	output;
end.