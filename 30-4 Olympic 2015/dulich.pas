uses math;
const fi = 'dulich.inp';
	  fo = 'dulich.out';
	  vc = maxint;
	  maxn = 100;
var a,tr:array[1..maxn,1..maxn] of integer;
	n,u,v:integer;

procedure input;
var f:text;
	d1,d2:integer;
begin
	assign(f,fi);
	reset(f);
	readln(f,n,u,v);
	for d1:= 1 to n do
		for d2:=1 to n do
			if d1 = d2 then a[d1,d2]:=vc else a[d1,d2]:=0;
	readln(f,d1,d2,a[d1,d2]);
	while d1 > 0 do readln(f,d1,d2,a[d1,d2]);
	fillchar(tr,sizeof(tr),0);
	close(f);
end;

procedure floyd;
var i,j,k:integer;
begin
	for k:=1 to n do
		for i:=1 to n do
			for j:=1 to n do
				if min(a[i,k],a[k,j]) > a[i,j] then
				begin
					a[i,j]:=min(a[i,k],a[k,j]);
					tr[i,j]:=k;
				end;
end;

function trace(i,j:integer):string;
var s:string;
	k:integer;
begin
	if tr[i,j] = 0 then exit('')
	else 
	begin
		k:=tr[i,j];
		str(k,s);
		exit(trace(i,k)+'->'+s+'->'+trace(k,j));
	end;
end;

procedure output;
var f:text;
	st:string;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f,a[u,v]);
	st:=trace(u,v);
	while pos('->->',st) > 0 do delete(st,pos('->->',st),2);
	writeln(f,u,st,v);
	close(f);
end;


begin
	input;
	floyd;
	output;
end.


