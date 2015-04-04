const fi = 'kruskal.inp';
	  fo = 'kruskal.out';
	  maxn = 2000;
type canh=record
	u,v,val,stt:longint;
	end;
var G:array[1..maxn] of canh;
	C,D:array[1..maxn] of boolean;
	m,n,s:longint;

procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	readln(f,n,m);
	for i:=1 to m do 
	begin
		g[i].stt:=i;
		readln(f,G[i].u,G[i].v,G[i].val);
	end;
	close(f);
end;

procedure quicksort1(l,h:longint);
var i,j,key:longint;
	tmp:canh;
begin
	i:=l;
	j:=h;
	key:=G[(i+j) div 2].val;
	repeat
		while g[i].val > key do inc(i);
		while g[j].val < key do dec(j);
		if i <= j then
		begin
			tmp:=g[i];
			g[i]:=g[j];
			g[j]:=tmp;
			inc(i);
			dec(j);
		end;
	until i>j;
	if i<h then quicksort1(i,h);
	if l<j then quicksort1(l,j);
end;

procedure quicksort2(l,h:longint);
var i,j,key:longint;
	tmp:canh;
	tx:boolean;
begin
	i:=l;
	j:=h;
	key:=G[(i+j) div 2].stt;
	repeat
		while g[i].stt < key do inc(i);
		while g[j].stt > key do dec(j);
		if i <= j then
		begin
			tmp:=g[i];
			g[i]:=g[j];
			g[j]:=tmp;
			tx:=c[i];
			c[i]:=c[j];
			c[j]:=tx;
			inc(i);
			dec(j);
		end;
	until i>j;
	if i<h then quicksort2(i,h);
	if l<j then quicksort2(l,j);
end;

procedure kruskal;
var t,i:longint;
begin
	quicksort1(1,m);
	t:=1;c[1]:=true;d[g[1].u]:=true;d[g[1].v]:=true;s:=g[1].val;
	repeat
		for i:=2 to m do if (not c[i]) and (d[g[i].u] xor d[g[i].v]) then
		begin
			c[i]:=true;
			d[g[i].u]:=true;
			d[g[i].v]:=true;
			s:=s+g[i].val;
			inc(t);
			break;
		end;
	until t=n-1;
end;

procedure output;
var f:text;
	i:longint;
begin
	assign(f,fo);
	rewrite(f);
	quicksort2(1,n-1);
	writeln(f,s);
	for i:=1 to n-1 do if c[i] then
	writeln(f,g[i].stt);
	close(f);
end;

begin
	input;
	kruskal;
	output;
end.