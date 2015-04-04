const fi = 'traffic.inp';
	  fo = 'traffic.out';
	  maxn = 1000;
type duongdi = record
	u,v,val:longint;
	end;
var a:array[1..maxn] of duongdi;
	b:array[1..maxn,1..maxn] of boolean;
	n,k:longint;

procedure input;
var f:text;
	tmp,i:longint;
begin
	assign(f,fi);
	reset(f);
	readln(f,n,k);
	for i:=1 to k do
	begin
		readln(f,d1,d2);
		b