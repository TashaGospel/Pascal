uses math;
const fi = 'xl02.inp';
	  fo = 'xl02.out';
	  maxn = 1000;
type xl=record
	x,y,name:longint;
	end;
var a:array[1..maxn] of xl;
	n,res,k:longint;

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

procedure categorize;
var tmp:xl;
	i:longint;
begin
	k:=1;
	for i:=2 to n do if a[i].x <= a[i].y then
	begin
		tmp:=a[i];
		a[i]:=a[k];
		a[k]:=tmp;
		inc(k);
	end;
end;

procedure quicksort1(d,c:longint);
var i,j,mid:longint;
	tmp:xl;
begin
	i:=d; j:=c; mid:=a[(d+c) div 2].x;
	repeat
		while a[i].x < mid do inc(i);
		while mid < a[j].x do dec(j);
		if i <= j then
		begin
			tmp:=a[i];
			a[i]:=a[j];
			a[j]:=tmp;
			inc(i);
			dec(j);
		end;
	until i > j;
	if i < c then quicksort1(i,c);
	if d < j then quicksort1(d,j);
end;

procedure quicksort2(d,c:longint);
var i,j,mid:longint;
	tmp:xl;
begin
	i:=d; j:=c; mid:=a[(d+c) div 2].y;
	repeat
		while a[i].y > mid do inc(i);
		while mid > a[j].y do dec(j);
		if i <= j then
		begin
			tmp:=a[i];
			a[i]:=a[j];
			a[j]:=tmp;
			inc(i);
			dec(j);
		end;
	until i > j;
	if i < c then quicksort2(i,c);
	if d < j then quicksort2(d,j);
end;

procedure main;
var t,i:longint;
begin
	t:=a[1].x;
	res:=t+a[1].y;
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
	categorize;
	quicksort1(1,k);
	quicksort2(k+1,n);
	main;
	output;
end.
