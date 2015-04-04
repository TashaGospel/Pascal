const fi = 'ddmax.inp';
	  fo = 'ddmax.out';
	  maxn = 100000;
var n,d,c:longint;
	sum:int64;
	a:array[0..maxn] of longint;
	//b,c:array[0..maxn,0..maxn] of longint;

procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	readln(f,n);
	sum:=0;
	for i:=1 to n do
	begin
		read(f,a[i]);
		sum:=sum+a[i];
	end;
	close(f);
	{fillchar(b,sizeof(b),0);
	fillchar(c,sizeof(c),0);}
end;

procedure main;
begin
	d:=1;
	c:=n;
	while sum <= 0 do
		if a[d] <= a[c] then
		begin
			sum:=sum-a[d];
			inc(d);
		end
		else
		begin
			sum:=sum-a[c];
			dec(c);
		end;
end;


procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,c-d+1);
	close(f);
end;

begin
	input;
	//calsum;
	main;
	output;
end.


{procedure calsum;
var i,j:longint;
begin
	for i:=1 to n do
		for j:=i to n do b[i,j]:=b[i,j-1]+a[j];
end;

procedure main;
var i,j:longint;
begin
	for i:=1 to n do
		for j:=i to n do
		begin
			if c[i+1,j] >= c[i,j-1] then c[i,j]:=c[i+1,j]
			else c[i,j]:=c[i,j-1];
			if b[i,j] > 0 then inc(c[i,j]);
		end;
end;}

