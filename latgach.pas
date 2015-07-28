const fi = 'latgach.inp';
	  fo = 'latgach.out';
	  maxn = 105;
var testNum, n:longint;
	fibo:array[1..maxn] of string;

function bigAdd(a,b:string):string;
var res:string;
	i,carry,tmp:longint;
begin
	res:='';
	carry:=0;
	while length(a) < length(b) do a:='0'+a;
	while length(b) < length(a) do b:='0'+b;
	for i:=length(a) downto 1 do
	begin
		tmp:=(ord(a[i]) - 48 + ord(b[i]) - 48) + carry;
		carry:=tmp div 10;
		tmp:=tmp mod 10;
		res:=chr(tmp+48) + res;
	end;
	if carry = 1 then res:='1' + res;
	exit(res);
end;

function fib(n: longint):string;
begin
	if fibo[n] = '' then
		fibo[n]:=bigAdd(fib(n-1),fib(n-2));
	exit(fibo[n]);
end;
	
procedure process;
var f,g:text;
	i:longint;
begin
	fibo[1]:='1';
	fibo[2]:='2';
	assign(f,fi);
	assign(g,fo);
	reset(f);
	rewrite(g);
	read(f,testNum);
	for i:=1 to testNum do
	begin
		read(f,n);
		writeln(g,fib(n));
	end;
	close(f);
	close(g);
end;

begin
	process;
end.
