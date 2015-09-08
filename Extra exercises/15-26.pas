uses math;
const fi = '15-26.inp';
	  fo = '15-26.out';
	  maxn = 1001;
      const n = 10;
var s:longint;
    a:array[1..maxn] of longint;
    b:array[0..maxn,0..maxn] of longint;

procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
    for i:=1 to n do read(f,a[i]);
    read(f,s);
	close(f);
end;

procedure main;
var i,j:longint;
begin
    for j:=1 to s do b[1,j]:=a[1]*j;

    for i:=2 to n do
        for j:=1 to s do
        begin
            b[i,j]:=b[i-1,j];
            if j>=i then b[i,j]:=min(b[i,j],b[i,j-i] + a[i]);

            {for k:=1 to j div i do
            begin
                tmp:=b[i,j-k*i] + a[i] * k;
                if b[i,j] > tmp then
                begin
                    b[i,j]:=tmp;
                    u[i,j]:=k;
                end;
            end;}
        end;

    for i:=1 to n do
    begin
        for j:=1 to s do write(b[i,j],' ');
        writeln;
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
        exit(path(i,j-i) + tmp + ' ');
    end;
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f,b[n,s]);
    write(f,path(n,s));
	close(f);
end;

begin
	input;
	main;
	output;
end.
