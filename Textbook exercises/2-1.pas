const fi = '2-1.inp';
	  fo = '2-1.out';
var sum2,sum16,sum10:string;
	n:longint;

procedure input;
var f:text;
begin
	assign(f,fi);
	reset(f);
	readln(f,sum2);
	close(f);
	n:=length(sum2);
end;

function bigadd(a,b:string): string;
var sum, carry, i, x, y : integer;
	c : string;
begin
	carry:=0;c:='';
	while length(a)<length(b) do a:='0'+a;
	while length(b)<length(a) do b:='0'+b;
	for i:=length(a) downto 1 do
	begin
		x:= ord(a[i])-ord('0'); {ord('0')=48}
		y:= ord(b[i])-ord('0');
		sum:=x + y + carry;
		carry:=sum div 10;
		c:=chr(sum mod 10 +48)+c;
	end;
	if carry>0 then c:='1'+c;
	bigadd:=c;
end;

function bigmul(a:string;b:longint):string;
var carry,s,i :longint;
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
	bigmul:=tmp+c;
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
	while (length(c)>1) and(c[1]='0') do delete(c,1,1);
	bigdiv:=c;
end;

function bigmod(a:string;b:longint):longint;
var i,hold:longint;
begin
	hold:=0;
	for i:=1 to length(a) do hold:=(ord(a[i])-48+hold*10) mod b;
	bigmod:=hold;
end;

procedure t2_to_10;
var i,tmp:longint;
	multiplier:string;
begin
	multiplier:='1';
	for i:=n downto 1 do
	begin
		tmp:=ord(sum2[i]) - 48;
		sum10:=bigadd(sum10,bigmul(multiplier,tmp));
		multiplier:=bigmul(multiplier,2);
	end;
end;

procedure addto16(s:string);
var tmp:string;
begin
	tmp:=s;
	case s of
		'10':tmp:='A';
		'11':tmp:='B';
		'12':tmp:='C';
		'13':tmp:='D';
		'14':tmp:='E';
		'15':tmp:='F';
	end;
	sum16:=tmp+sum16;
end;

procedure t10_to_16;
var tmp:string;
begin
	while sum10 <> '0' do
	begin
		str(bigmod(sum10,16), tmp);
		addto16(tmp);
		sum10:=bigdiv(sum10,16);
	end;
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,sum16);
	close(f);
end;

begin
	input;
	t2_to_10;
	t10_to_16;
	output;
end.