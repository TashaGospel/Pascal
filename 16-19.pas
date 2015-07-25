// Basically kruskal with some edges given
const fi = '16-19.inp';
	  fo = '16-19.out';
	  maxn = 1000;
var n,m,treeNum,chosenCount,res:longint; // n: number of vertices; m: number of edges
	a:array[0..maxn,0..maxn] of longint;
	t:array[1..maxn] of longint; // treeeeeeeeeeeeeeeee
	chosen:array[1..maxn,1..2] of longint;

// Unite two trees
procedure union(c,d:longint);
var i:longint;
begin
	for i:=1 to n do if t[i] = d then t[i]:=c;
	dec(treeNum);
end;

procedure input;
var f:text;
	i,j,tmp:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n,m);
	
	for i:=1 to n do t[i]:=i;
	treeNum:=n;

	for tmp:=1 to m do
	begin
		read(f,i,j);
		if t[i] <> t[j] then union(t[i],t[j]);
	end;

	for i:=1 to n do
		for j:=1 to n do read(f,a[i,j]);

	close(f);

	a[0,0]:=maxlongint;
end;

// Find smallest available edge
procedure find(var u,v:longint);
var i,j:longint;
begin
	u:=0; v:=0;
	for i:=1 to n do
		for j:=1 to n do
			if (t[i] <> t[j]) and (a[i,j] < a[u,v]) then
			begin
				u:=i;
				v:=j;
			end;
end;

procedure main;
var u,v:longint;
begin
	while treeNum > 1 do
	begin
		find(u,v);
		union(t[u],t[v]);
		res:=res+a[u,v];
		inc(chosenCount);
		chosen[chosenCount,1]:=u;
		chosen[chosenCount,2]:=v;
	end;
end;

procedure output;
var f:text;
	i:longint;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f,res);
	for i:=1 to chosenCount do writeln(f,chosen[i,1],' ',chosen[i,2]);
	close(f);
end;

begin
	input;
	main;
	output;
end.
