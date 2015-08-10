const fi = '15-13.inp';
	  fo = '15-13.out';
	  maxn = 1001;

var n,m,respos:longint;
	a,b:array[0..maxn,0..maxn] of longint;

procedure input;
var f:text;
	i,j:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n,m);
	for i:=1 to n do
		for j:=1 to m do read(f,a[i,j]);
	close(f);
end;

function max(i,j:longint):longint;
begin
	if i>=j then exit(i) else exit(j);
end;

procedure loop(var s1,s3:longint);
begin
	if s1 = 0 then s1:=n;
	if s3 = n+1 then s3:=1;
end;

procedure main;
var i,j,s1,s3:longint;
begin
	for j:=1 to m do
		for i:=1 to n do
		begin
			s1:=i-1; s3:=i+1;
			loop(s1,s3);
			b[i,j]:=max(b[i,j-1],max(b[s1,j-1],b[s3,j-1])) + a[i,j];
			if b[respos, m] < b[i,j] then respos:=i;
		end;
end;
			
function path(i,j:longint):string;
var tmp:string;
	s1,s3:longint;
begin
	str(i, tmp);
	if j = 1 then exit(tmp);

	s1:=i-1; s3:=i+1;
	loop(s1,s3);

	if (b[s1,j-1] >= b[i,j-1]) and (b[s1,j-1] >= b[s3,j-1]) then
		exit(path(s1,j-1) + ' ' + tmp)
	else if (b[i,j-1] >= b[s3,j-1]) then
		exit(path(i,j-1) + ' ' + tmp)
	else
		exit(path(s3,j-1) + ' ' + tmp);
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f,b[respos,m]);
	write(f,path(respos,m));
	close(f);
end;

begin
	input;
	main;
	output;
end.
