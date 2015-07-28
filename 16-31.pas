uses math;
const fi = '16-31.inp';
	  fo = '16-31.out';
	  maxn = 21;
	  dx:array[1..4] of (-1,1,0,0);
	  dy:array[1..4] of longint = 
var n,m:longint;
	a:array[1..maxn,1..maxn] of longint;

procedure input;
var f:text;
	i,j:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n,m);
	for i:=1 to n do
		for j:=1 to m do 
		begin
			read(f,a[i,j]);
			sum:=sum+a[i,j];
		end;
	close(f);
end;

procedure main(x,y:longint);
var 
begin
	for i:=0 to 1 do
	begin
		a[x,y]:=i;
		if i = 1 then 
		begin
			curSum:=curSum+a[x,y];
			if abs(sum-curSum*2) < res then res:=abs(sum-curSum*2);
		
