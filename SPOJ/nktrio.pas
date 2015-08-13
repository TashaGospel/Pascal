const fi = 'nktrio.inp';
	  fo = 'nktrio.out';
	  maxn = 1001;

var n:longint;
	a:array[1..maxn,1..maxn] of longint;
	t:array[1..maxn] of longint;

procedure input;
var f:text;
	i,j:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n);
	for i:=1 to n do
		for j:=1 to n do read(f,a[i,j]);
	close(f);
end;

procedure output(i,j,k:longint);
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,i,' ',j,' ',k);
	close(f);
	halt;
end;

procedure DFS(c:longint);
var i:longint;
begin
	for i:=1 to n do 
	if (a[c,i] = 1) and (t[i] = 0) then
		if a[i,t[c]] = 1 then output(t[c],c,i)
		else 
		begin
			t[i]:=c;
			DFS(i);
		end;
end;

procedure main;
var i:longint;
begin
	for i:=1 to n do if t[i] = 0 then DFS(i);
end;

begin
	input;
	main;
	output(-1,-1,-1);
end.	
