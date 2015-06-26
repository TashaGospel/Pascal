const fi = '14-21.inp';
	  fo = '14-21.out';
	  maxn = 1000;
var n,w,count:longint;
	a,b:array[1..maxn] of longint;

procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	readln(f,n,w);
	for i:=1 to n do read(f,a[i]);
	close(f);
end;

procedure print(var f:text);
var i:longint;
begin
	inc(count);
	writeln(f,count,':');
	for i:=1 to n do if b[i]=1 then write(f,a[i],' ');
	writeln(f);
	for i:=1 to n do if b[i] = 2 then write(f,a[i],' ');
	writeln(f);
	writeln(f);
end;
	

procedure check(var f:text);
var i,sum1,sum2:longint;
begin
	sum1:=w; sum2:=0;
	for i:=1 to n do 
		if b[i]=1 then sum1:=sum1+a[i] 
		else if b[i]=2 then sum2:=sum2+a[i];
	if sum1 = sum2 then print(f);
end;
	

procedure main(c:longint;var f:text);
var i:longint;
begin
	for i:=0 to 2 do
	begin
		b[c]:=i;
		if c = n then check(f)
		else main(c+1,f);
	end;
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	main(1,f);
	close(f);
end;

begin
 input;
 output;
end.
