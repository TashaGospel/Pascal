uses math;
const fi = 'minmax.inp';
	  fo = 'minmax.out';
	  maxn = 1000000;
var n,resmax,resmin:longint;
	a:array[1..maxn] of longint;

procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	readln(f,n);
	for i:=1 to n do read(f,a[i]);
	close(f);
end;

procedure main(c,d:longint; var maxp,minp:longint);
var min1,min2,max1,max2:longint;
begin
	if c = d then 
	begin
		maxp:=a[c];
		minp:=a[c];
	end
	else
	begin
		main(c,(c+d) div 2,max1,min1);
		main((c+d) div 2+1,d,max2,min2);
		maxp:=max(max1,max2);
		minp:=min(min1,min2);
	end;
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,resmax,' ',resmin);
	close(f);
end;

begin
	input;
	main(1,n,resmax,resmin);
	output;
end.
