uses math;
const fi = '15-24.inp';
	  fo = '15-24.out';
	  maxn = 1001;
var n:longint;
    a:array[0..maxn,0..maxn] of boolean;
    b:array[0..maxn,0..maxn] of longint;

procedure input;
var f:text;
	d1,d2:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n);
    while not eof(f) do
    begin
        read(f,d1,d2);
        a[d1,d2]:=true;
    end;
	close(f);
end;

procedure main;
var i,j:longint;
begin
    for i:=1 to n do
        for j:=1 to n do
        begin
            b[i,j]:=max(b[i-1,j],b[i,j-1]);
            if a[i,j] then b[i,j]:=max(b[i-1,j-1] + 1, b[i,j]);
        end;     
end;

function path(i,j:longint):string;
var tmp1,tmp2:string;
begin
    if (i<=0) or (j<=0) then exit('');
    if (a[i,j]) and (b[i,j] = b[i-1,j-1] + 1) then
    begin
        str(i,tmp1); str(j,tmp2);
        tmp1:=tmp1 + ' ' + tmp2;
        exit(path(i-1,j-1) + tmp1 + ' ')
    end
    else if b[i,j] = b[i-1,j] then exit(path(i-1,j))
    else exit(path(i,j-1));
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f,b[n,n]);
    write(f,path(n,n));
	close(f);
end;

begin
	input;
	main;
	output;
end.
