const fi = 'pc.inp';
	  fo = 'pc.out';
	  maxn = 1000;
var n,res:longint;
	a:array[1..maxn,1..maxn] of longint;
	b,path:array[1..maxn] of longint;
	ok:array[1..maxn] of boolean;

procedure input;
var f:text;
	i,j:longint;
begin
	assign(f,fi);
	reset(f);
	readln(f,n);
	for i:=1 to n do
		for j:=1 to n do read(f,a[i,j]);
	close(f);
	fillchar(ok,sizeof(ok),true);
	res:=maxlongint;
end;

procedure update(c:longint);
begin
	res:=c;
	path:=b;
end;

procedure main(stepnum,sum:longint);
var i:longint;
begin
	if sum >= res then exit;
	if stepnum <= n then 
	begin
		for i:=1 to n do
			if (a[stepnum,i] <> 0) and (ok[i]) then 
			begin
				ok[i]:=false;
				b[stepnum]:=i;
				main(stepnum+1,sum+a[stepnum,i]);
				ok[i]:=true;
			end;
	end
	else update(sum);
end;			
		
procedure output;
var f:text;
	i:longint;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f,res);
	for i:=1 to n do write(f,path[i],' ');
	close(f);
end;

begin
	input;
	main(1,0);
	output;
end.
