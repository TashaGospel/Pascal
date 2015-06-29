const fi = 'socp.inp';
fo = 'socp.out';
var s:string;

procedure input;
var f:text;
begin
	assign(f,fi);
	reset(f);
	read(f,s);
	close(f);
end;

function bigadd(a,b : string): string;
var sum, carry, i, x, y : integer;
	c : string;
begin
	carry:=0;c:='';
	while length(a)<length(b) do a:='0'+a;
	while length(b)<length(a) do b:='0'+b;
	for i:=length(a) downto 1 do
	begin
		x:= ord(a[i])-ord('0');
		y:= ord(b[i])-ord('0');
		sum:=x + y + carry;
		carry:=sum div 10;
		c:=chr(sum mod 10 +48)+c;
	end;
	if carry>0 then c:='1'+c;
	bigadd:=c;
end;

function multiply1(a:string;b:longint):string;
var i :integer;
	carry,s :longint;
	c,tmp :string;
begin
	c:='';
	carry:=0;
	for i:=length(a) downto 1 do
	begin
		s:=(ord(a[i])-48) * b + carry;
		carry:= s div 10;
		c:=chr(s mod 10 + 48)+c;
	end;
	if carry>0 then str(carry,tmp) else tmp:='';
	multiply1:=tmp+c;
end;

function multiply2(a,b:string):string;
var sum,tmp:string;
	m,i,j:integer;
begin
	m:=-1;sum:='';
	for i:=length(a) downto 1 do
	begin
		m:=m+1;
		tmp:=multiply1(b,ord(a[i])-48);
		for j:=1 to m do tmp:=tmp+'0';
		sum:=bigadd(tmp,sum);
	end;
	multiply2:=sum;
end;

function bigdiv(a:string;b:longint):string;
var s,i,hold:longint;
	c:string;
begin
	hold:=0;s:=0; c:='';
	for i:=1 to length(a) do
	begin
		hold:=hold*10 + ord(a[i])-48;
		s:=hold div b;
		hold:=hold mod b;
		c:=c+chr(s+48);
	end;
	while (length(c)>1) and (c[1]='0') do delete(c,1,1);
	bigdiv:=c;
end;

function bigger(a,b:string):boolean;
var ta,tb:string;
begin
	ta:=a; tb:=b;
	while length(ta) > length(tb) do tb:='0'+tb;
	while length(tb) > length(ta) do ta:='0'+ta;
	if ta>=tb then exit(true) else exit(false);
end;

procedure output(res:boolean);
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,res);
	close(f);
    halt;
end;

procedure main(c,d:string);
var mid,tmp:string;
begin
	if bigger(bigadd(c,'1'),d) then output(false);
	mid:= bigdiv(bigadd(c,d),2);
	tmp:=multiply2(mid,mid);
	if tmp=s then output(true)
	else if bigger(tmp,s) then main(c,mid)
	else main(mid,d);
end;

begin
	input;
	main('1',s);
end.
