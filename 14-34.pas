const fi = '14-34.inp';
	  fo = '14-34.out';
var n,count:longint;
	s,res:string;
	a:array['A'..'Z'] of longint;

procedure input;
var i:longint;
begin
	readln(s);
	n:=length(s);
	for i:=1 to length(s) do inc(a[s[i]]);
	count:=1;
end;

function ok(x:string):boolean;
var res:string;
	i:longint;
begin
	res:='';
	for i:=length(x) downto 1 do res:=res+x[i];
	if res = s then exit(true) else exit(false);
end;

procedure main(c:longint);
var i:char;
begin
	for i:='A' to 'Z' do
	begin 
		if a[i] > 0 then
		begin
			res:=res+i;
			dec(a[i]);
			if c = n then 
				if ok(res) then	write(count)
				else inc(count)
			else main(c+1);
			delete(res,c,1);
			inc(a[i]);
		end;
	end;
end;

begin
	input;
	main(1);
end.


