uses math;
const fi = 'pro.inp';
	  fo = 'pro.out';
var k,n,m,l:longint;
	res:real;

procedure input;
var f:text;
begin
	assign(f,fi);
	reset(f);
	read(f,k,n,m,l);
	close(f);
end;

procedure main;
begin
	res:=power(k,m)-k*(power(2,m-l+1)-1);
	//res:=trunc((n/m)*(ln(res)/ln(2)));
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,res:0:0);
	close(f);
end;

begin
	input;
	main;
	output;
end.
