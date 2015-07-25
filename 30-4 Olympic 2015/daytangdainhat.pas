uses math;
const fi = 'daytangdainhat.inp';
	  fo = 'daytangdainhat.out';
	  maxn = 100;
var a,l,t:array[0..maxn] of longint;
	c:array[0..maxn] of boolean;
	n,maxlen:longint;

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

procedure main;
var i,j,jmax:longint;
begin
	for i:=1 to n do l[i]:=1;
	l[0]:=0;
	for i:=1 to n do 
	begin
		jmax:=0;
		for j:=i-1 downto 1 do
			if (a[i] > a[j]) and (l[j] > l[jmax]) then
			begin
				t[i]:=j;
				jmax:=j;
				l[i]:=l[j]+1;
			end;
		l[i]:=max(l[i],l[i-1]);
	end;
	maxlen:=l[n];
end;

procedure trace;
var i:longint;
begin
	i:=n;
	repeat
	if l[i-1] = l[i] then dec(i);
	else 
	begin
		c[i]:=true;
		i:=t[i];
	end;
	until i=0;
end;

procedure output;
var i:longint;
	f:text;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f,maxlen);
	for i:=1 to n do if c[i] then write(f,a[i],' ');
	close(f);
end;

begin
	input;
	main;
	trace;
	output;
end.
