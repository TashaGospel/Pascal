const fi = 'duongdiBFS.inp';
	  fo = 'duongdiBFS.out';
	  vc = maxlongint;
Var g:array[1..1000,1..1000] of longint;
	tr,l,q:array[1..1000] of longint;
	c:array[1..1000] of boolean;
	m,n,s,t,a,b:longint;
	f:text;

procedure input;
var f:text;
	i,d1,d2,j:longint;
begin
	assign(f,fi);
	reset(f);
	readln(f, n, m, s, t);
        for i:=1 to n do
            BEgin
                 l[i]:=vc;
                 for j:=1 to n do g[i,j]:=vc;
            End;
	for i:=1 to m do
	Begin
		readln(f,d1,d2,g[d1,d2]);
		g[d2,d1]:=g[d1,d2];
	end;
	close(f);
end;

function rong:boolean;
begin
	exit(b<a);
end;

Procedure put(i:longint);
begin
	a:=a+1;
	q[a]:=i;
end;

function get:longint;
begin
		get:=q[b];
        b:=b+1;
end;

Procedure Loang;
Var u,v,i:longint;
Begin
        fillchar(c,sizeof(c),false);
	L[S]:=0;c[s]:=true;
	put(S);
	while not rong do
	begin
		u:=get;
		for v:=1 to n do if (G[u,v] < vc) and (L[v] > L[u] + G[u,v]) then
		begin
			L[v]:=L[u]+G[u,v];
			Tr[v]:=u;
			if not C[v] then put(v);
		end;
	end;
end;

procedure trace(u:longint);
begin
	if u=s then exit
	else
	begin
		trace(tr[u]);
		writeln(f, tr[u],' ',u);
	end;
end;

begin
	b:=1;
	input;
	loang;
	assign(f,fo);
	rewrite(f);
	writeln(f,l[t]);
    trace(t);
	close(f);
end.
