const fi = 'room.inp';
	  fo = 'room.out';
	  maxn = 1000;
type room = record
	x,y,name:longint;
	end;
var n,res:longint;
	a:array[1..maxn] of room;
	b:array[1..maxn] of longint;

procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	readln(f,n);
	for i:=1 to n do 
	begin
		readln(f,a[i].x,a[i].y);
		a[i].name:=i;
	end;
	close(f);
end;

procedure quicksort(d,c:longint);
var i,j,mid:longint;
	tmp:room;
begin
	i:=d; j:=c; mid:=a[(d+c) div 2].y;
	repeat
		while a[i].y < mid do inc(i);
		while mid < a[j].y do dec(j);
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
var i,cur:longint;
begin
	cur:=-1;
	for i:=1 to n do
		if cur <= a[i].x then
		begin
			inc(res);
			cur:=a[i].y;
			b[res]:=a[i].name;
		end;
end;

procedure output;
var f:text;
	i:longint;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f,res);
	for i:=1 to res do write(f,b[i],' ');
	close(f);
end;

begin
	input;
	quicksort(1,n);
	main;
	output;
end.
