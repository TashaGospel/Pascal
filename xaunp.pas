const fi = 'xaunp.inp';
	  fo = 'xaunp.out';
	  maxn = 203;
var a:array[0..maxn] of string;
	fiboposi:longint; //posiition of last value of calculated Fibonacci sequence

function bigAdd(s1,s2:string):string;
var res:string;
	tmp,carry,i:longint;
begin
	res:='';
	carry:=0;
	while length(s1) < length(s2) do s1:='0'+s1;
	while length(s2) < length(s1) do s2:='0'+s2;
	for i:=length(s1) downto 1 do
	begin
		tmp:=ord(s1[i])-48+ord(s2[i])-48+carry;
		carry:=tmp div 10;
		tmp:=tmp mod 10;
		res:=chr(tmp+48)+res;
	end;
	if carry > 0 then res:='1'+res;
	exit(res);
end;

function bigSub(s1,s2:string):string; // s1 >= s2
var carry,tmp,i:longint;
	res:string;
begin
	res:='';
	carry:=0;
	while length(s1) < length(s2) do s1:='0'+s1;
	while length(s2) < length(s1) do s2:='0'+s2;
	for i:=length(s1) downto 1 do
	begin
		tmp:=ord(s1[i])-ord(s2[i])-carry;
		if tmp < 0 then 
		begin
			tmp:=tmp+10;
			carry:=1;
		end
		else carry:=0;
		res:=chr(tmp+48)+res;
	end;
	while (res[1]='0') and (length(res)>1) do delete(res,1,1);
	exit(res);
end;

function compare(a,b:string):longint;
var s1,s2:string;
begin
	s1:=a; s2:=b;
	while length(s1) < length(s2) do s1:='0'+s1;
	while length(s2) < length(s1) do s2:='0'+s2;
	if s1 > s2 then exit(1)
	else if s1 = s2 then exit(0)
	else exit(-1);
end;

procedure fibonacci(n:longint);
var i:longint;
begin
	for i:=fiboposi to n do
	begin
		a[i]:=bigAdd(a[i-1],a[i-2]);
	end;
	if n>=fiboposi then fiboposi:=n+1;
end;

function main1(n:longint;m:string):string;
var i:longint;
	res:string;
begin
	fibonacci(n);
	res:='';
	i:=n;
	while i <> 0 do
	begin
		if compare(m,a[i-1])=1 then 
		begin
			res:=res+'1';
			m:=bigSub(m,a[i-1]);
		end
		else res:=res+'0';
		dec(i);
	end;
	exit(res);
end;

function main2(s:string):string;
var posi,i:longint;
	res:string;
begin
	fibonacci(length(s));
	res:='1';
	posi:=length(s);
	for i:=1 to length(s) do
	begin
		if s[i]='1' then res:=bigAdd(res,a[posi-1]);
		dec(posi);
	end;
	exit(res);
end;

procedure parseFile;
var f,g:text;
	typenum,n:longint;
	m,s:string;
begin
	a[0]:='1';a[1]:='2'; fiboposi:=2;//initialize Fibonacci sequence
	assign(f,fi);
	reset(f);
	assign(g,fo);
	rewrite(g);
	while not eof(f) do
	begin
		read(f,typenum);
		if typenum = 1 then 
		begin
			readln(f,n,m);
			delete(m,1,1);
			writeln(g,main1(n,m));
		end
		else if typenum=2 then
		begin
			readln(f,s);
			delete(s,1,1);
			writeln(g,main2(s));
		end;
	end;
	close(f);
	close(g);
end;

begin
	parseFile;
end.
