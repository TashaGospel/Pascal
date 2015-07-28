const fi = '16-16.inp';
	  fo = '16-16.out';
	  maxn = 1000;
var n,m,sum:longint;
	a:array[0..maxn,0..maxn] of longint;
	avail:array[1..maxn] of boolean;
	chosen:array[1..maxn,1..2] of longint;

procedure input;
var f:text;
	i,d1,d2:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n,m);
	for d1:=1 to n do 
		for d2:=1 to n do if d1 <> d2 then a[d1,d2]:=maxlongint;
	for i:=1 to m do
	begin
		read(f,d1,d2,a[d1,d2]);
		a[d2,d1]:=a[d1,d2];
	end;
	close(f);
	a[0,0]:=maxlongint;
	fillchar(avail,sizeof(avail),true);
end;

function find(var u,v:longint):boolean;
var i,j:longint;
begin
	u:=0; v:=0;
	for i:=1 to n do
		for j:=1 to n do if (a[i,j] < a[u,v]) and (avail[i] xor avail[j]) then
		begin
			u:=i;
			v:=j;
		end;
	if a[u,v] = maxlongint then exit(false) else exit(true);
end;

function main:boolean;
var u,v,i:longint;
begin
	avail[1]:=false;
	for i:=1 to n-1 do 
		if find(u,v) then
		begin
			avail[u]:=false;
			avail[v]:=false;
			sum:=sum+a[u,v];
			chosen[i,1]:=u;
			chosen[i,2]:=v;
		end
		else exit(false);
	exit(true);
end;
		
procedure output;
var f:text;
	i:longint;
begin
	assign(f,fo);
	rewrite(f);
	if main then
	begin
		writeln(f,sum);
		for i:=1 to n-1 do writeln(f,chosen[i,1],' ',chosen[i,2],' ',a[chosen[i,1],chosen[i,2]]);
	end
	else write(f,-1);
	close(f);
end;

begin
	input;
	output;
end.
