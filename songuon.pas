const fi = 'songuon.inp';
	  fo = 'songuon.out';
var s,n,resul:string;

procedure input;
var f:text;
begin
        assign(f,fi);
        reset(f);
        readln(f,s);
        close(f);
end;

function sub(i,j:string):string;
var res:string;
	s,borrow,z:longint;
begin
	borrow:=0;res:='';
	while length(i) < length(j) do i:='0'+i;
	while length(j) < length(i) do j:='0'+j;
	for z:=length(i) downto 1 do
	begin
		s:=ord(i[z]) - ord(j[z]) - borrow;
		if s < 0 then
		begin
		 s:= s+10;
		 borrow:=1;
		end
		else borrow:=0;
		res:=chr(s+48)+res;
	end;
	while (length(res)>1) and (res[1] = '0') do delete(res,1,1);
	sub:=res;
end;

function valu(i:string):string;
var j,sum:longint;
	res:string;
begin
	sum:=0;
	for j:=1 to length(i) do sum:=sum + ord(i[j])-48;
	str(sum,res);
	valu:=res;
end;

procedure main;
var a:string;
	i:longint;
begin
	for i:=1800 downto 1 do
	begin
		str(i,a);
		n:=sub(s,a);
		resul:=valu(n);
		if resul = a  then break;
		n:='0';
	end;
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,n);
	close(f);
end;

begin
	input;
	main;
	output;
end.