const fi = '14-11.inp';
	  fo = '14-11.out';
var n:real;
	h:longint;

procedure input;
var f:text;
begin
	assign(f,fi);
	reset(f);
	readln(f,n,h);
	close(f);
end;

procedure output;
var f:text;
	procedure main(i,j:real; h:longint);
	var mid:real;
	begin
		mid:=(i+j)/2;
		if h > 1 then main(i,mid,h-1);
		writeln(f,mid:0:2,' ',h);
		if h > 1 then main(mid,j,h-1);
	end;
begin
	assign(f,fo);
	rewrite(f);
	main(0,n,h);
	close(f);
end;

begin
	input;
	output;
end.


