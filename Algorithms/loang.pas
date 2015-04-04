{$MODE OBJFPC}
const	path    ='';
		fi	    = path+'loang.inp';
		fo	    = path+'loang.out';
		maxn   	= 1000;
		maxm	= 30000;
		ext  	= maxlongint;

type	arr1 = array[1..maxm] of longint;
var		g:array[1..maxn,1..maxn] of longint;
		tr:array[1..maxn] of longint;
		c:array[1..maxn] of boolean;
		lab,q:arr1;
		l,r,m,n,p,s,t:longint;

procedure inputData;
var	f:text;
	i,j,u,v:longint;
begin
	assign(f,fi); reset(f);
	readln(f,n,m,s,t);
    for i:=1 to n do
		for j:=1 to n do
			if i=j then g[i,j]:=0 else g[i,j]:=ext;
	for i:=1 to m do
	begin
		readln(f,u,v,g[u,v]);
		g[v,u]:=g[u,v];
	end;
	close(f);
	//Du lieu ban dau
    r:=0; l:=1;
	fillchar(c,sizeof(c),false);
    fillbyte(tr,sizeof(tr),0);
	for i:=1 to n do lab[i]:=ext;
end;

procedure put(v:longint);
begin
	inc(r);
	q[r]:=v;
end;

function get:longint;
begin
	if r>=l then
	begin
		get:=q[l];
		inc(l);
	end
	else get:=0;
end;

procedure loang;
var u,v:longint;
begin
	lab[s]:=0;
	c[s]:=true;
	put(s);
	repeat
		u:=get;
		for v:=1 to n do
		begin
			if (u <> v) and (g[u,v]<ext) then
			begin
				if lab[u] + g[u,v] < lab[v] then
				begin
					lab[v]:=g[u,v]+lab[u];
					tr[v]:=u;
				end;
                if lab[v] + g[u,v] < lab[u] then
				begin
				    lab[u]:= lab[v] + g[u,v];
					tr[u]:=v;
				end;
				if not c[v] then
				begin
					c[v]:=true;
					put(v);
				end;
			end;
		end;
	until (l>r);
end;

procedure OutputData;
var f:text; i,j:longint;
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
	assign(f,fo); rewrite(f);
    if lab[t]=ext then writeln(f,-1) //truong hop khong co duong di tu s den t
    else
	begin
		writeln(f,lab[t]);
		trace(t);
	end;
	close(f);
end;

begin
	InputData;
	loang;
	OutputData;
end.
