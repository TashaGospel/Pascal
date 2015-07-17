const fi = '16-11.inp';
	  fo = '16-11.out';
	  maxn = 1000;
var n,count:longint;
	a:array[1..maxn,1..maxn] of boolean;
	stack:array[1..maxn] of longint;

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

function main:boolean;
var u,i,j,tag:longint;
	t:array[1..maxn] of longint;
begin
	fillchar(t,sizeof(t),0);
	for j:=1 to n do if t[j]=0 then
	begin
		push(j);
		t[j]:=1;
		repeat
			u:=pop;
			if t[u] = 1 then tag:=2 else tag:=1;
			for i:=1 to n do if (a[u,i]) then
			if t[i] = 0 then
			begin
				a[u,i]:=false;
				a[i,u]:=false;
				push(i);
				t[i]:=tag;
			end
			else if tag <> t[i] then exit(false);
		until isEmpty;
	end;
	exit(true);
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,main);
	close(f);
end;

begin
	input;
	output;
end.
