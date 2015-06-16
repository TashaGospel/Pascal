uses math;
const fi = '2-2.inp';
	  fo = '2-2.out';
	  maxn = 1000;
var n,divnum,divsum,count:longint;
	a:array[1..maxn,1..2] of longint;

procedure input;
var f:text;
begin
	assign(f,fi);
	reset(f);
	readln(f,n);
	close(f);
	fillchar(a,sizeof(a),0);
end;

function isprime(c:longint):boolean;
var i:longint;
begin
	i:=1;
	if c = 1 then exit(false);
	if c = 2 then exit(true);
	while i < sqrt(c) do
	begin
		inc(i);
		if c mod i = 0 then exit(false);
	end;
	exit(true);
end;

procedure main;
var i,cur:longint;
begin
	cur:=n;
	for i:=1 to n div 2 do
		if n mod i = 0 then
		begin
			inc(divnum);
			divsum:=divsum+i;
			if isprime(i) then
			begin
				inc(count);
				a[count,1]:=i;
				while cur mod i = 0 do
				begin	
					inc(a[count,2]);
					cur:= cur div i;
				end;
			end;
		end;
end;

procedure output;
var f:text;
	i:longint;
begin
	assign(f,fo);
	rewrite(f);
	write(f,'a) ');
	for i:=1 to count do write(f,a[i,1],'^',a[i,2],' ');
	writeln(f);
	writeln(f,'b) ',divnum+1);
	writeln(f,'c) ',divsum+n);
	close(f);
end;

begin
	input;
	main;
	output;
end.