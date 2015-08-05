uses math;
const fi = 'qbticket.inp';
	  fo = 'qbticket.out';
	  maxn = 100001;
	  maxval = 9223372036854775807; // max int64
var n,s,t:longint;
	l,c:array[1..3] of longint;
	a,res:array[1..maxn] of int64;

procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,l[1],l[2],l[3],c[1],c[2],c[3],n,s,t);
	for i:=2 to n do read(f,a[i]);
	close(f);
	res[s]:=0;
end;

procedure main;
var i,j:longint;
begin
	for i:=s+1 to t do
	begin
		res[i]:=maxval;
		for j:=i-1 downto s do
			if a[i] - a[j] > l[3] then break
			else if a[i] - a[j] > l[2] then res[i]:=min(res[i],res[j]+c[3])
			else if a[i] - a[j] > l[1] then res[i]:=min(res[i],res[j]+c[2])
			else res[i]:=min(res[i],res[j]+c[1]);
	end;
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,res[t]);
	close(f);
end;

begin
	input;
	main;
	output;
end.
