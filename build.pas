const fi = 'build.inp';
	  fo = 'build.out';
	  maxn = 2000;
	  vc = (maxlongint div 2) -1;
type cords = record
	x,y:longint;
	end;
	 pipe = record
	u,v,val:longint;
	end;
var n,c,pipenum,t,s:longint;
	a:array[1..maxn] of cords;
	b:array[1..maxn] of pipe;
	p,f:array[1..maxn] of boolean;

procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	readln(f,n,c);
	for i:=1 to n do readln(f,a[i].x,a[i].y);
	close(f);
	s:=0;
end;

procedure prep;
var i,j,long:longint;
begin
	pipenum:=0;
	for i:=1 to n-1 do
		for j:=i+1 to n do
		begin
			long:=(a[i].x-a[j].x)*(a[i].x-a[j].x)+(a[i].y-a[j].y)*(a[i].y-a[j].y);
			if long < c then long:=vc;
			inc(pipenum);
			b[pipenum].u:=i;
			b[pipenum].v:=j;
			b[pipenum].val:=long;
		end;
end;

procedure quicksort(d,c:longint); //(1,pipenum)
var i,j,mid:longint;
	tmp:pipe;
begin
	i:=d;
	j:=c;
	mid:=b[(d+c) div 2].val;
	repeat
		while b[i].val < mid do inc(i);
		while b[j].val > mid do dec(j);
		if i<=j then
		begin
			tmp:=b[i];
			b[i]:=b[j];
			b[j]:=tmp;
			inc(i);
			dec(j);
		end;
	until i>j;
	if d<j then quicksort(d,j);
	if i<c then quicksort(i,c);
end;

procedure main;
var i:longint;
begin
	quicksort(1,pipenum);
	t:=1; f[b[1].u]:=true; f[b[1].v]:=true; s:=s+b[1].val;
	while t < n-1 do
	begin
		for i:=2 to pipenum do
		if f[b[i].v] xor f[b[i].u] then
		begin
			f[b[i].v]:=true;
			f[b[i].u]:=true;
			s:=s+b[i].val;
			inc(t);
			break;
		end;
	end;
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,s);
	close(f);
end;

begin
	input;
	prep;
	main;
	output;
end.



	

