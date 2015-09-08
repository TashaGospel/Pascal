uses math;
const fi = 'knapsack3.inp';
	  fo = 'knapsack3.out';
	  maxn = 1001;
var n,maxW:longint;
    w,v:array[1..maxn] of longint;
    b:array[0..maxn,0..maxn] of longint;

procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
    read(f,n,maxW);
    for i:=1 to n do read(f,v[i], w[i]);
	close(f);
end;

procedure main;
var i,j:longint;
begin
    for i:=1 to n do
        for j:=1 to maxW do
        begin
            b[i,j]:=b[i-1,j];
            if j>=w[i] then b[i,j]:=max(b[i,j],b[i,j-w[i]] + v[i]);
        end;
end;

function path(i,j:longint):string;
var tmp:string;
begin
    if (i<=0) or (j<=0) then exit('');
    if b[i,j] = b[i-1,j] then exit(path(i-1,j))
    else
    begin
        str(i,tmp);
        exit(path(i,j-w[i]) + tmp + ' ');
    end;
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f,b[n,maxW]);
    write(f,path(n,maxW));
	close(f);
end;

begin
	input;
	main;
	output;
end.
