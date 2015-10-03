uses math;
const fi = '15-7.inp';
	  fo = '15-7.out';
	  maxn = 1001;

var n,sum:longint;
	a:array[1..maxn] of longint;
	b:array[0..maxn,0..maxn] of longint;
	chosen:array[1..maxn] of boolean;

procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n);
	for i:=1 to n do 
	begin
		read(f,a[i]);
		sum:=sum+a[i];
	end;
	close(f);
end;

procedure main;
var i,j:longint;
begin
	for i:=1 to n do
		for j:=1 to sum div 2 do
		begin
			if j - a[i] < 0 then b[i,j]:=b[i-1,j]
			else b[i,j]:=max(b[i-1,j],b[i-1,j-a[i]]+a[i]);
		end;
end;

procedure path(i,j:longint);
begin
	if (i <= 0) or (j <= 0) then exit;
	if b[i,j] = b[i-1,j] then path(i-1,j)
	else
	begin
		chosen[i]:=true;
		path(i-1,j-a[i]);
	end;
end;

procedure output;
var f:text;
	i:longint;
begin
	assign(f,fo);
	rewrite(f);
	for i:=1 to n do if chosen[i] then write(f,i,' ');
	writeln(f,b[n,sum div 2]);
	for i:=1 to n do if not chosen[i] then write(f,i,' ');
	write(f,sum - b[n,sum div 2]);
	close(f);
end;

begin
	input;
	main;
	path(n,sum div 2);
	output;
end.
