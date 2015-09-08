const fi = '15-25.inp';
	  fo = '15-25.out';
	  maxn = 1001;
var n,m,posI,posJ,posX,posY,res:longint;
    a,s:array[0..maxn,0..maxn] of longint;

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
    res:=-maxlongint div 2;
end;

procedure prep;
var i,j:longint;
begin
    for i:=1 to n do
        for j:=1 to m do s[i,j]:= s[i,j-1] + s[i-1,j] - s[i-1,j-1] + a[i,j];
end;

procedure main;
var i,j,x,y,sum:longint;
begin
    prep;

    for i:=1 to n do
        for j:=1 to m do
            for x:=i to n do
                for y:=j to m do
                begin
                    sum:=s[x,y] - s[x,j-1] - s[i-1,y] + s[i-1,j-1];
                    if sum > res then
                    begin
                        res:=sum;
                        posI:=i; posJ:=j;
                        posX:=x; posY:=y;
                    end;                 
                end;
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f,res);
    write(f,posI,' ',posJ,' ',posX,' ',posY);
	close(f);
end;

begin
	input;
	main;
	output;
end.
