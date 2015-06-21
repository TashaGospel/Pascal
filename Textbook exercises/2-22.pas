var n,res:longint;
	s:string;
	a:array['A'..'Z'] of longint;

procedure input;
var i:longint;
begin
	readln(s);
	n:=length(s);
	for i:=1 to length(s) do inc(a[s[i]]);
end;

function factorial(c:longint):longint;
var i,res:longint;
begin
	res:=1;
	for i:=2 to c do res:=res*i;
	exit(res);
end;

procedure main;
var i:char;
begin
	res:=factorial(n);
	for i:='A' to 'Z' do res:=res div factorial(a[i]);
end;

procedure output;
begin
	write(res);
end;

begin
	input;
	main;
	output;	
end.
