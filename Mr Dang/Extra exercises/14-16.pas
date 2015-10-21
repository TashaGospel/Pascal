const fi = '14-16.inp';
	  fo = '14-16.out';
	  maxn = 1000;
var n,x,res:longint;
	a:array[1..maxn,1..maxn] of boolean;
	b:array[1..maxn] of boolean;

procedure input;
var f:text;
	d1,d2:longint;
begin
	fillchar(a,sizeof(a),false);
	assign(f,fi);
	reset(f);
	read(f,n,x);
	while not eof(f) do 
	begin
		read(f,d1,d2);
		a[d1,d2]:=true;
		a[d2,d1]:=true;
	end;
	close(f);
	fillchar(b,sizeof(b),false);
end;

procedure main(x:longint);
var i:longint;
begin
	b[x]:=true;
	inc(res);
	for i:=1 to n do if (a[x,i]) and (not b[i]) then main(i);
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
	main(x);
	output;
end.
