const	fi = 'bfs.inp';
		fo = 'bfs.out';
		maxn = 1000;
var		g:array[1..maxn,1..maxn] of integer;
		c:array[1..maxn] of boolean;
        q:array[1..maxn] of integer;
		n,l,r:integer;
		f:text;
procedure input;
var f:text;
	i,j:integer;
begin
	assign(f,fi);
	reset(f);
	readln(f,n);
	for i:=1 to n do
	begin
		for j :=1 to n do read(f,g[i,j]);
		readln(f);
	end;
	close(f);
end;
function rong:boolean;
begin
	rong:= l>r;
end;
procedure put(x:integer);
begin
	inc(r);
	q[r]:=x;
end;
function get:integer;
begin
	if not rong then
	begin
		get:=q[l];
		inc(l);
	end;
end;

procedure BFS(v:integer);
var w:integer;
begin
	assign(f,fo); rewrite(f);
    c[v]:=true;
    write(f, v, ' ');
    put(v);
	while not rong do
	begin
		v:=get;
		for w:=1 to n do
			if not(c[w]) and ( g[v,w]= 1) then
            begin
              	put(w);
                c[w]:=true;
              	write(f, w,' ');
            end;
	end;
    close(f);
end;

BEGIN
	input;
    l:=1; r:=0;
	fillchar(c,sizeof(c),false);
	bfs(1);
END.
