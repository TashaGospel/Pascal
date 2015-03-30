uses math;
const fi = 'dayloi.inp';
	  fo = 'dayloi.out';
	  maxn = 100;
var	a,b,c:array[0..maxn] of longint;
	n,lenb,lenc:longint;

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

procedure left;
var i,j,jmax,maxlen,maxpos:longint;
	l,t:array[0..maxn] of longint;
	check:array[0..maxn] of boolean;
begin
	fillchar(check,sizeof(check),false);
	fillchar(t,sizeof(t),0);
	for i:=1 to n do l[i]:=1;
	l[0]:=0;
	l[n+1]:=0;
	for i:=1 to n do 
	begin
		jmax:=0;
		for j:=i-1 downto 1 do
			if (a[i] < a[j]) and (l[j] > l[jmax]) then
			begin
				t[i]:=j;
				jmax:=j;
				l[i]:=l[j]+1;
			end;
	end;

	maxlen:=0;
	for i:=1 to n do if maxlen < l[i] then
	begin
		maxlen:=l[i];
		maxpos:=i;
	end;

	i:=maxpos;
	repeat
		check[i]:=true;		
		i:=t[i];
	until i=0;

	for i:=1 to n do if check[i] then
	begin
		inc(lenb);
		b[lenb]:=a[i];
	end;
end;

procedure right;
var i,j,jmax,maxlen,maxpos:longint;
	l,t:array[0..maxn] of longint;
	check:array[0..maxn] of boolean;
begin
	fillchar(check,sizeof(check),false);
	fillchar(t,sizeof(t),0);
	for i:=1 to n do l[i]:=1;
	l[0]:=0;
	l[n+1]:=0;
	for i:=n downto 1 do 
	begin
		jmax:=n+1;
		for j:=i+1 to n+1 do
			if (a[i] < a[j]) and (l[j] > l[jmax]) then
			begin
				t[i]:=j;
				jmax:=j;
				l[i]:=l[j]+1;
			end;
	end;

	maxlen:=0;
	for i:=1 to n do if maxlen < l[i] then
	begin
		maxlen:=l[i];
		maxpos:=i;
	end;

	i:=maxpos;
	repeat
		check[i]:=true;		
		i:=t[i];
	until i=0;


	for i:=1 to n do if check[i] then
	begin
		inc(lenc);
		c[lenc]:=a[i];
	end;
end;

{procedure main;
var i:longint;
begin
	for i:= lenb downto 1 if b[i]}

procedure output;
var i:longint;
begin
	for i:=1 to lenb do write(b[i]);
	writeln;
	for i:=lenc downto 1 do write(c[i]);
	writeln;
end;

begin
	input;
	left;
	right;
	{main;}
	output;
end.
