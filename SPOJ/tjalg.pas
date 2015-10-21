const fi = 'tjalg.inp';
	  fo = 'tjalg.out';
	  maxn = 100000;
var verticesNum,stackCount,indexCount,res:longint;
	edges:array[1..maxn,1..maxn] of boolean;
	stack,index,lowestVertex:array[1..maxn] of longint;
	avail:array[1..maxn] of boolean;

procedure input;
var f:text;
	d1,d2,edgesNum,i:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,verticesNum,edgesNum);
    for i:=1 to edgesNum do
	begin
		read(f,d1,d2);
		edges[d1,d2]:=true;
	end;
	close(f);
	fillchar(avail,sizeof(avail),true);
end;

procedure push(vertex:longint);
begin
	inc(stackCount);
	stack[stackCount]:=vertex;
end;

function pop:longint;
begin
	dec(stackCount);
	exit(stack[stackCount+1]);
end;

function min(num1,num2:longint):longint;
begin
	if num1<=num2 then exit(num1) else exit(num2);
end;

procedure main(vertex:longint);
var i,out:longint;
begin
	push(vertex);
	inc(indexCount);
	index[vertex]:=indexCount;
	lowestVertex[vertex]:=indexCount;
	for i:=1 to verticesNum do if (edges[vertex,i]) and (avail[i]) then
	begin
		if index[i] = 0 then 
        begin
            main(i);
            lowestVertex[vertex]:=min(lowestVertex[vertex],lowestVertex[i]);
        end
        else lowestVertex[vertex]:=min(lowestVertex[vertex],index[i]);
	end;
	if index[vertex] = lowestVertex[vertex] then
	begin
		repeat
			out:=pop;
			avail[out]:=false;
		until out = vertex;
        inc(res);
	end;
end;

procedure output;
var f:text;
    i:longint;
begin
	assign(f,fo);
	rewrite(f);
    for i:=1 to verticesNum do if avail[i] then main(i);
    write(f,res);
	close(f);
end;

begin
	input;
	output;
end.
