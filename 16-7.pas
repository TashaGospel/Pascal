const fi = '16-7.inp';
	  fo = '16-7.out';
	  maxn = 1000;
var n,x,y,count:longint;
	a:array[1..maxn,1..maxn] of longint;
	d,trace:array[1..maxn] of longint;
	avail:array[1..maxn] of boolean;

procedure input;
var f:text;
	i,j:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n,x,y);
	for i:=1 to n do 
		for j:=1 to n do read(f,a[i,j]);
	close(f);
	fillchar(avail,sizeof(avail),true);
end;

procedure prep;
var i:longint;
begin
	for i:=1 to n do d[i]:=maxlongint-1;
	d[x]:=0;
end;

procedure squeeze(i,j:longint);
begin
	if (a[i,j]>0) and (d[j] > d[i] + a[i,j]) then 
	begin
		d[j]:=d[i]+a[i,j];
		trace[j]:=i;
	end;
end;	

procedure main;
var c,i,min_d,min_d_pos:longint;
begin
	c:=x;
	while (c<>y) and (count < n) do
	begin
		inc(count);
		avail[c]:=false;
		min_d:=maxlongint;
		for i:=1 to n do if avail[i] then squeeze(c,i);
		for i:=1 to n do if (min_d > d[i]) and (avail[i]) then 
		begin
			min_d:=d[i];
			min_d_pos:=i;
		end;
		c:=min_d_pos;
	end;
end;

procedure printpath(var f:text; i:longint);
begin
	if i = x then write(f,x,' ')
	else 
	begin
		printpath(f,trace[i]);
		write(f,i,' ');
	end;
end;

procedure output;
var f:text;
	i:longint;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f,d[y]);
	printpath(f,y);
	close(f);
end;

begin
	input;
	prep;
	main;
	output;
end.
