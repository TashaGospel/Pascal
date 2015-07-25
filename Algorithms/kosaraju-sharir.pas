const fi = 'kosaraju-sharir.inp';
	  fo = 'kosaraju-sharir.out';
	  maxn = 1000;
var verticesNum,indexCount:longint;
	edges:array[1..maxn,1..maxn] of boolean;
	index:array[1..maxn] of longint;
	avail:array[1..maxn] of boolean;

procedure input;
var f:text;
	d1,d2:longint;
begin
	fillchar(edges,sizeof(edges),false);
	assign(f,fi);
	reset(f);
	read(f,verticesNum);
	while not eof(f) do
	begin
		read(f,d1,d2);
		edges[d1,d2]:=true;
	end;
	close(f);
end;

procedure DFS(vertex:longint);
var i:longint;
begin
	for i:=1 to verticesNum do if edges[vertex,i] and avail[i] then
	begin
		avail[i]:=false;
		DFS(i);
	end;
	inc(indexCount);
	index[indexCount]:=vertex;
end;

procedure DFSResult(vertex:longint; var f:text);
var i:longint;
begin
	for i:=1 to verticesNum do if edges[i,vertex] {reversed vertices} and avail[i] then
	begin
		write(f,i,' ');
		avail[i]:=false;
		DFSResult(i,f);
	end;
end;

procedure main(var f:text);
var i:longint;
begin
	fillchar(avail,sizeof(avail),true);
	for i:=1 to verticesNum do if avail[i] then 
	begin
		avail[i]:=false;
		DFS(i); // index vertices according to time of finishing visit
	end;

	fillchar(avail,sizeof(avail),true);
	for i:=indexCount downto 1 do if avail[index[i]] then 
	begin
		avail[index[i]]:=false;
		DFSResult(index[i],f);
		writeln(f,index[i],' ');
	end;
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	main(f);
	close(f);
end;

begin
	input;
	output;
end.
