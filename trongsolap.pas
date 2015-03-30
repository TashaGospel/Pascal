const fi='trongso.inp';
	  fo='trongso.out';
	  maxn=100;
var a:array[1..maxn] of longint;
	n,res:longint;

procedure input;
var f:text;
    i:longint;
begin
	assign(f,fi); reset(f);
	readln(f,n);
	for i:=1 to n do read(f,a[i]);
	close(f);
end;

procedure lapdilaplailaptoilaplui;
var i,j,x:longint;
begin
	res:=-maxlongint;
	for i:= 1 to n do
	begin
	x:=0;
	for j:= i to n do
		begin
		x:=x+a[j];
		if res < x then res:=x;
		end;
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
	lapdilaplailaptoilaplui;
	output;
end.
	
