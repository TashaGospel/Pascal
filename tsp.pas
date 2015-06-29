const fi = 'tsp.inp';
	  fo = 'tsp.out';
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
	b[1]:=1; ok[1]:=false;
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
		for i:=2 to n do
			if (a[b[stepnum-1],i] <> 0) and (ok[i]) then 
			begin
				ok[i]:=false;
				b[stepnum]:=i;
				main(stepnum+1,sum+a[b[stepnum-1],i]);
				ok[i]:=true;
			end;
	end
	else if (a[b[stepnum-1],1] <> 0) and (sum+a[b[stepnum-1],1] < res) then update(sum+a[b[stepnum-1],1]); 
end;			
		
procedure output;
var f:text;
	i:longint;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f,res);
	for i:=1 to n do write(f,path[i],'->');
	write(f,1);
	close(f);
end;

begin
	input;
	main(2,0);
	output;
end.
