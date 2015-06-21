//2-1 second method

const fi = '2-1.inp';
	  fo = '2-1.out';
	  d:array[0..15] of string = ('0000','0001','0010','0011',
	  '0100','0101','0110','0111','1000','1001','1010','1011',
	  '1100','1101','1110','1111');	  
var a,b:ansistring;

procedure input;
var f:text;
begin
	assign(f,fi);
	reset(f);
	readln(f,a); //2 -> 16
	read(f,b); //16 -> 2
	close(f);
end;

function t2_to_16(s:string):string;
var cur,i:longint;
	tmp,res:string;
begin
	res:='';
	cur:=length(s)+1;
	while cur > 4 do
	begin
		cur:=cur-4;
		tmp:=copy(s,cur,4);
		for i:=0 to 15 do if tmp = d[i] then break;
		if i <= 9 then res:= chr(i+48) + res
		else res:= chr(i+55) + res;
	end;
	tmp:=copy(s,1,cur-1);
	while length(tmp) < 4 do tmp:='0'+tmp;
	for i:=0 to 15 do if tmp = d[i] then break;
	if i <= 9 then res:= chr(i+48) + res
	else res:= chr(i+55) + res;
	exit(res);
end;

function t16_to_2(s:string):string;
var res:string;
	i:longint;
begin
	res:='';
	for i:=1 to length(s) do 
	begin
		if s[i] in ['0'..'9'] then res:=res + d[ord(s[i])-48]
		else res:=res + d[ord(s[i])-55];
	end;
	while copy(res,1,1)='0' do delete(res,1,1);
	exit(res);
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f,t2_to_16(a));
	write(f,t16_to_2(b));
	close(f);
end;

begin
	input;
	output;
end.