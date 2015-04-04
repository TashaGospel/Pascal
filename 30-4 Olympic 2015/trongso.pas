uses math;
const fi='trongso.inp';
	  fo='trongso.out';
	  maxn=100;
var a:array[1..maxn] of longint;
	n,res,z:longint;

procedure input;
var f:text;
    i:longint;
begin
	assign(f,fi); reset(f);
	readln(f,n);
	for i:=1 to n do read(f,a[i]);
	close(f);
end;

function maxl(d,c:longint):longint;
var i,s,maxsum:longint;
begin
	s:=0;
	maxsum:=-maxlongint;
	for i:= c downto d do
	begin
		s:=s+a[i];
		if s > maxsum then maxsum:=s;
	end;
	maxl:=maxsum;
end;

function maxr(d,c:longint):longint;
var i,s,maxsum:longint;
begin
	s:=0;
	maxsum:=-maxlongint;
	for i:= d to c do
	begin
		s:=s+a[i];
		if s > maxsum then maxsum:=s;
	end;
	maxr:=maxsum;
end;

function timmax(d,c:longint):longint;
var mid,wl,wr,wm:longint;
begin
	if d = c then exit(a[d])
	else
	begin
		mid:=(d+c) div 2;
		wl:=timmax(d,mid);
		wr:=timmax(mid+1,c);
		wm:=maxl(d,mid) + maxr(mid+1,c);
		exit(max(max(wl,wr),wm));
	end;
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f,res);
	close(f);
end;

begin
	input;
	res:=timmax(1,n);
	output;
end.