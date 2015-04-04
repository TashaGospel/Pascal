const fi = 'bonus.inp';
	  fo = 'bonus.out';
	  maxn = 1000;
	  vc = 2147483647;
var a,b:array[1..maxn,1..maxn] of longint;
	n,k,Tmax:longint;

procedure input;
var f:text;
    i,j:longint;
begin
        assign(f,fi);
        reset(f);
        readln(f,n,k);
        for i:=1 to n do
        begin 
        	for j:=1 to n do read(f,a[i,j]);
        	readln(f);
       	end;
        close(f);
end;

procedure main;
var i,j,T,i1,j1:longint;
begin
	//Tao mang B
	for i:=1 to n do
	for j:=1 to n do
		b[i,j]:=b[i,j-1]+b[i-1,j]+a[i,j]-b[i-1,j-1];
	//Tim Tmax
	Tmax:=-vc;
	for i:=1 to n-k+1 do
	for j:=1 to n-k+1 do
	begin
		i1:=i+k-1;
		j1:=j+k-1;
		T:=b[i1,j1] - b[i1,j-1] - b[i-1,j1] + b[i-1,j-1];
		if T > Tmax then Tmax:=T;
	end;
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,Tmax);
	close(f);
end;

begin
	input;
	main;
	output;
end.

