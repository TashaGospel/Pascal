uses math;
const fi = 'xl02.inp';
	  fo = 'xl02.out';
	  maxn = 1000;
type xl=record
	x,y,name:longint;
	z:real;
	end;
var a:array[1..maxn] of xl;
	n,res:longint;

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
		a[i].z:=a[i].x/a[i].y;
	end;
	close(f);
end;

procedure quicksort(d,c:longint);
var i,j:longint;
	mid:real;
	tmp:xl;
begin
	i:=d; j:=c; mid:=a[(d+c) div 2].z;
	repeat
		while a[i].z < mid do inc(i);
		while mid < a[j].z do dec(j);
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
var t,i:longint;
begin
	t:=a[1].x;
	res:=a[1].y;
	for i:=2 to n do
	begin
		t:=t+a[i].x;
		res:=max(res,t)+a[i].y;
	end;
end;

procedure output;
var f:text;
	i:longint;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f,res);
	for i:=1 to n do write(f,a[i].name,' ');
	close(f);
end;

begin
	input;
	quicksort(1,n);
	main;
	output;
end.
