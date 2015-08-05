const fi = 'elevator.inp';
	  fo = 'elevator.out';
	  maxn = 402;
type thing = record
	h,c:integer;
	max:longint;
	end;
var n:integer;
	res:longint;
	a:array[1..maxn] of thing;

procedure input;
var f:text;
	i:integer;
begin
	assign(f,fi);
	reset(f);
	read(f,n);
	for i:=1 to n do with a[i] do read(f,h,max,c);
	close(f);
end;

procedure quicksort(c,d:integer);
var i,j:integer;
	mid:longint;
	tmp:rez;
begin
	i:=c; j:=d; mid:=a[(c+d) div 2].max;
	repeat
		while a[i].max < mid do inc(i);
		while a[j].max > mid do dec(j);
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
var
begin
	

	
