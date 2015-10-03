const fi = '16-15.inp';
	  fo = '16-15.out';
	  maxn = 1000;
var n,count,edgeCount:longint;
	a:array[1..maxn,1..maxn] of boolean;
	stack,res1,res2:array[1..maxn] of longint;

procedure input;
var f:text;
	d1,d2:longint;
begin
	fillchar(a,sizeof(a),false);
	assign(f,fi);
	reset(f);
	read(f,n);
	while not eof(f) do
	begin
		read(f,d1,d2);
		a[d1,d2]:=true;
		a[d2,d1]:=true;
	end;
	close(f);
end;

procedure push(c:longint);
begin
	inc(count);
	stack[count]:=c;
end;

function pop:longint;
begin
	pop:=stack[count];
	dec(count);
end;

function isEmpty:boolean;
begin
	exit(count <= 0);
end;

procedure main;
var avail:array[1..maxn] of boolean;
	u,i:longint;
begin
	fillchar(avail,sizeof(avail),true);
	push(1);
	avail[1]:=false;
	repeat
		u:=pop;
		for i:=1 to n do if (a[u,i]) and avail[i] then
		begin
			a[u,i]:=false;
			a[i,u]:=false;
			inc(edgeCount);
			res1[edgeCount]:=u;
			res2[edgeCount]:=i;
			push(i);
			avail[i]:=false;
		end;		
	until isEmpty;
end;

procedure output;
var f:text;
	i:longint;
begin
	assign(f,fo);
	rewrite(f);
	for i:=1 to edgeCount do writeln(f,res1[i],' ',res2[i]);
	close(f);
end;

begin
	input;
	main;
	output;
end.
