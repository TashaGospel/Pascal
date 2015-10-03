const fi = '16-33.inp';
	  fo = '16-33.out';
	  maxn = 1000;
var n,res:longint;
	a:array[1..maxn,1..maxn] of longint;
	t,c:array[1..maxn] of longint;

procedure input;
var f:text;
	i,d1:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n);
	for i:=1 to n do 
	begin
		readln(f);
		while not eoln(f) do
	   	begin
			read(f,d1);
			a[i,d1]:=1;
		end;
	end;
	res:=maxlongint;
end;

procedure check;
var d:array[1..maxn] of boolean;
	num,p,i,j:longint;
begin
	p:=0;
	num:=0;
	fillchar(d,sizeof(d),true);
	for i:=1 to n do if t[i] = 1 then
	begin
		inc(p);
		for j:=1 to n do if (a[i,j]=1) and d[j] then
		begin
			d[j]:=false;
			inc(num);
		end;
	end;
	if (num = n) and (res > p) then 
	begin
		res:=p;
		c:=t;
	end;
end;

procedure main(c:longint);
var i:longint;
begin
	for i:=1 downto 0 do
   	begin
		t[c]:=i;
		if c < n then main(c+1)
		else check;
	end;
end;

procedure output;
var f:text;
	i:longint;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f,res);
	for i:=1 to n do if c[i]=1 then write(f,i,' ');
	close(f);
end;

begin
	input;
	main(1);
	output;
end.
		

