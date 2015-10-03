var h:longint;
	a:array[1..1000] of longint;

procedure input;
begin
	readln(h);
end;

procedure output;
var i:longint;
	ok:boolean;
begin
	if a[1]+a[2]+a[3] <> h then exit;
	ok:=false;
	for i:=1 to 3 do 
	begin
		if ok then write(a[i])
		else if a[i]<>0 then 
		begin 
			ok:=true;
			write(a[i]); 
		end;
	end;
	write(' ');
end;

procedure main(i,sum:longint);
var j:longint;
begin
	for j:=0 to h-sum do
	begin
		a[i]:=j;
		if i < 3 then main(i+1,sum+j)
		else output;
	end;
end;

begin
	input;
	main(1,0);
end.