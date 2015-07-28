const fi = 'qbticket.inp';
	  fo = 'qbticket.out';
	  maxn = 100001;
var n,s,t:longint;
	l,c:array[1..3] of longint;
	a:array[1..maxn] of longint;

procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,l[1],l[2],l[3],c[1],c[2],c[3],n,s,t);
	for i:=2 to n do read(a[i]);
	close(f);
end;

procedure main;
var
begin
