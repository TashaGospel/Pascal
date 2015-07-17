const fi = '16-13.inp';
	  fo = '16-13.out';
	  maxn = 1000;
var n,m,count,res:longint;
	a:array[1..maxn,1..maxn] of boolean;
	avail:array[1..maxn] of boolean;
	stack:array[1..maxn] of longint;

procedure input;
var f:text;
	i,d1,d2:longint;
begin
	fillchar(a,sizeof(a),false);
	assign(f,fi);
	reset(f);
	read(f,n,m);
	for i:=1 to m do
	begin
		read(f,d1,d2);
		a[d1,d2]:=true;
		a[d2,d1]:=true;
	end;
	close(f);
	fillchar(avail,sizeof(avail),true);
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
var u,i,j:longint;
begin
	for j:=1 to n do if avail[j] then
	begin
		inc(res);
		push(j);
		avail[j]:=false;
		repeat
			u:=pop;
			for i:=1 to n do if (a[u,i]) and avail[i] then
			begin
				push(i);
				avail[i]:=false;
			end;
		until isEmpty;
	end;
end;
			
procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,res);
	close(f);
end;

begin	
	input;
	main;
	output;
end.

