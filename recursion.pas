var a:array[1..9] of integer;

procedure output;
var i:integer;
begin
	for i:=1 to 9 do write(a[i]);
	writeln;
end;

function ok(d:integer):boolean;
var i:integer;
begin
	for i:=1 to d-1 do if a[i]=a[d] then exit(false);
	exit(true);
end;

procedure main(c:integer);
var i:integer;
begin
	if c = 10 then output
	else
	begin
		for i:=1 to 9 do 
		begin
			a[c]:=i;
			if ok(c) then main(c+1);
		end;
	end;
end;

begin
	main(1);
end.