const fi = '4-3.inp';
	  fo = '4-3.out';
var s:string;
	n:longint;
	a:array[1..10000] of longint;
	x:array[1..10000] of boolean;

procedure input;
var f:text;
begin
	assign(f,fi);
	reset(f);
	read(f,s);
	close(f);
	n:=length(s);
	fillchar(x,sizeof(x),true);
end;

procedure output;
var f:text;
procedure main(i:longint);
var j,y:longint;
begin
	if i <= n then
	begin
	for j:=1 to n do
		if x[j] then
		begin
			a[i]:=j;
			x[j]:=false;
			main(i+1);
			x[j]:=true;
		end;
	end
	else
	begin
		for y:=1 to n do write(f,s[a[y]]);
		writeln(f);
	end;
end;
begin
	assign(f,fo);
	rewrite(f);
	main(1);
	close(f);
end;

begin
	input;
	output;
end.



