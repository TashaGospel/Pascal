uses math;
const fi = '15-9.inp';
	  fo = '15-9.out';
	  maxn = 1001;

var n,m:longint;
	a:array[1..maxn] of longint;
	b:array[0..maxn,0..maxn] of longint;

procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n,m);
	for i:=1 to n do read(f,a[i]);
	close(f);
	for i:=1 to m do b[0,i]:=maxint;
end;

{needs sort}

procedure main;
var i,j,k:longint;
begin
	for i:=1 to n do
		for j:=1 to m do
		begin
			b[i,j]:=b[i-1,j];
			for k:=1 to j div a[i] do 
				if j-a[i]*k >= 0 then b[i,j]:=min(b[i,j],b[i-1,j-a[i]*k]+k);
		end;
end;

function path(i,j:longint):string;
var tmp:string;
	k:longint;
begin
	if (i <= 0) or (j <= 0) then exit('');
	for k:=0 to j div a[i] do if b[i,j] = b[i-1,j-a[i]*k]+k then
   	begin
		str(k,tmp);
		exit(path(i-1,j-a[i]*k) + tmp + ' ');
	end;
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f,b[n,m]);
	write(f,path(n,m));
	close(f);
end;

begin
	input;
	main;
	output;
end.
