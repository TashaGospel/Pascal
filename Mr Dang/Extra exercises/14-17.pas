const fi = '14-17.inp';
	  fo = '14-17.out';
	  maxn = 1000;
var n,x,y,cur,res:longint;
	a:array[1..maxn,1..maxn] of boolean;
	b,c:array[1..maxn] of longint;

procedure input;
var f:text;
	d1,d2:longint;
begin
	fillchar(a,sizeof(a),false);
	assign(f,fi);
	reset(f);
	read(f,n,x,y);
	while not eof(f) do
	begin
		read(f,d1,d2);
		a[d1,d2]:=true;
		a[d2,d1]:=true;
	end;
	close(f);
end;

function ok(i:longint):boolean;
var j:longint;
begin
	for j:=1 to n do if b[j]=i then exit(false);
	exit(true);
end;

procedure main(x:longint);
var i:longint;
begin
	inc(cur);
	b[cur]:=x;
	if x <> y then
	begin
		for i:=1 to n do if (a[x,i]) and ok(i) then main(i);
	end
	else if cur > res then
	begin
		res:=cur;
		c:=b;
	end;
	dec(cur);
end;

procedure output;
var f:text;
	i:longint;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f,res-1);
	for i:=1 to res do write(f,c[i],' ');
	close(f);
end;

begin
	input;
	main(x);
	output;
end.
