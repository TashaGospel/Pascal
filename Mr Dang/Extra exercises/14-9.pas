const fi = '14-9.inp';
	  fo = '14-9.out';
var k,m,res:longint;
	num:real;

procedure input;
var f:text;
	d1,d2:longint;
begin
	assign(f,fi);
	reset(f);
	readln(f,k,m,d1,d2);
	num:=d1/d2;
	close(f);
	res:=-1;
end;

procedure main(i,j:real;count,pos:longint);
var i1,j1:real;
begin
	i1:=i+(j-i)/3;
	j1:=i+(j-i)*2/3;
	if (i1 < num) and (num < j1) then exit
	else 
	if (num <= i1) then
		if count = m then begin res:=pos;exit; end
		else main(i,i1,count+1,pos*2-1)
	else 
		if count = m then begin res:=pos+1;exit; end
		else main(j1,j,count+1,(pos+1)*2-1);
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,res);
	close(f);
end;

begin
	input;
	main(0,k,1,1);
	output;
end.