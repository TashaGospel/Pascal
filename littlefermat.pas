const fi = 'littlefermat.inp';
	  fo = 'littlefermat.out';
var n:int64;

procedure input;
var f:text;
begin
	assign(f,fi);
	reset(f);
	readln(f,n);
	close(f);
end;

function power(i,j:longint):longint;
begin
	if j = 1 then exit(i)
	else if odd(j) then exit(power(i,j div 2)*power(i,j-(j div 2)))
	else exit(power(i,j div 2) * power(i,j div 2));
end;

function fermat:boolean;
begin
	if power(2,n) mod n = 2 then exit(true);
	exit(false);
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	if fermat then write(f,'Yes') else write(f,'No');
	close(f);
end;

begin
	input;
	output;
end.

