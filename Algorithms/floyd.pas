const vc=maxint;
	  fi='floyd.inp';
	  fo='floyd.out';
	  maxn=1000;
var T,D:array[1..maxn,1..maxn] of integer;
	m,n,u,v:longint;

procedure input;
var f:text;
	i,j,d1,d2:longint;
begin
	assign(f,fi);
	reset(f);
	readln(f,m,n,u,v);
	for i:=1 to n do
		for j:=1 to n do
		begin
			if i=j then D[i,j]:=0
			else D[i,j]:=vc;
		end;
	for i:=1 to m do
	begin
		readln(f,d1,d2,D[d1,d2]);
	end;
	close(f);
	fillchar(T,sizeof(T),0);
end;

procedure floyd;
var i,j,k:longint;
begin
	for k:=1 to n do
		for i:=1 to n do
			for j:=1 to n do
				if D[i,j] > D[i,k] + D[k,j] then
				begin
					D[i,j]:= D[i,k] + D[k,j];
					T[i,j]:=k;
				end;
end;

function path(i,j:longint):string;
var k:longint;
	st:string;
begin
	if T[i,j] <> 0 then
	begin
		k:=T[i,j];
		str(k,st);
		exit(path(i,k)+st+path(k,j));
	end
	else exit(' ');
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f, D[u,v]);
	write(f,u,path(u,v),v);
	close(f)
end;

begin
	input;
	floyd;
	output;
end.
