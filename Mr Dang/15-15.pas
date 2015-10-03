uses math;
const fi = '15-15.inp';
      fo = '15-15.out';
      maxn = 1000;

var n,s:longint;
    a:array[1..maxn] of longint;
    b:array[0..maxn,0..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,s);
    for i:=1 to n do read(f,a[i]);
    close(f);
end;
            
procedure main;
var i,j:longint;
begin
	for i:=1 to n do
		for j:=1 to s do
        begin
			if j-a[i] < 0 then b[i,j]:=b[i-1,j]
			else b[i,j]:=max(b[i-1,j],b[i-1,j-a[i]]+a[i]);
        end;
end;

function path(i,j:longint):string;
var tmp:string;
begin
	if (i <= 0) or (j <= 0) then exit('');
	if b[i,j] = b[i-1,j] then exit(path(i-1,j))
	else
	begin
		str(a[i],tmp);
		exit(path(i-1,j-a[i]) + tmp + ' ');
	end;
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    if b[n,s] = s then write(f,path(n,s))
    else write(f,-1);
    close(f);
end;

begin
    input;
    main;
    output;
end.
