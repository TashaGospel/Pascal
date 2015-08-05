const fi = 'vsteps.inp';
	  fo = 'vsteps.out';
	  maxn = 100005;
	  divider = 14062008;
var n,breakNum:longint;
	fibo:array[1..maxn] of longint;
	breaks:array[1..maxn] of boolean;

function fib(n:longint):longint;
begin
	if breaks[n] then exit(0);
	if fibo[n] = 0 then
		fibo[n]:=(fib(n-1) + fib(n-2)) mod divider;
	exit(fibo[n]);
end;
	
procedure process;
var f,g:text;
	i,tmp:longint;
begin
	fillchar(breaks,sizeof(breaks),false);
	fibo[1]:=1;
	fibo[2]:=1;
	assign(f,fi);
	assign(g,fo);
	reset(f);
	rewrite(g);
	read(f,n,breakNum);
	for i:=1 to breakNum do
	begin
		read(f,tmp);
		breaks[tmp]:=true;
		if breaks[tmp-1]=true then 
		begin
			writeln(g,'0');
			close(f);
			close(g);
			exit;
		end;
	end;
	writeln(g,fib(n));
	close(f);
	close(g);
end;

begin
	process;
end.
