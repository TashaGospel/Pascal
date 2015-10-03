const fi = 'calculate.inp';
	  fo = 'calculate.out';
	  type ut = set of char;
var s:string;
	note:array[1..3] of ut;

procedure input;
var f:text;
begin
	assign(f,fi);
	reset(f);
	read(f,s);
	close(f);
	note[1]:=['+','-'];
	note[2]:=['x',':'];
	note[3]:=['^'];
end;

procedure removebrackets(var s:string);
var i,d:longint;
begin
	if (s[1] = '(') and (s[length(s)] = ')') then
	begin
		d:=1;
		for i:=1 to length(s) do
		begin
			if s[i] = '(' then inc(d);
			if s[i] = ')' then dec(d);
			if d = 0 then break;
		end;
		if i = length(s) then
		begin
			delete(s,1,1);
			delete(s,length(s),1);
		end;
	end;
end;

function notepos(s:string):longint;
var d,i,j:longint;
begin
	d:=0;
	for i:=1 to 3 do
		for j:=length(s) downto 1 do
		begin
			if s[j]='(' then inc(d);
			if s[j]=')' then dec(d);
			if (s[j] in note[i]) and (d = 0) then exit(j);
		end;
	exit(0);
end;
		
function calculate(s1,s2:string; d:char):string;
var num1,num2,res:longint;
	tmp:string;
begin
	val(s1,num1,res);
	val(s2,num2,res);
	case d of 
		'-':res:=num1-num2;
		'+':res:=num1+num2;
		':':res:=num1 div num2;
		'x':res:=num1 * num2;
	end;
	str(res,tmp);
	exit(tmp);
end;
	
function main(s:string):string;
var v:longint;
	s1,s2:string;
begin
	removebrackets(s);
	v:=notepos(s);
	if v = 0 then exit(s)
	else
	begin
		s1:=copy(s,1,v-1);
		s2:=copy(s,v+1,length(s)-v);
		exit(calculate(main(s1),main(s2),s[v]));
	end;
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,main(s));
	close(f);
end;

begin
	input;
	output;
end.
