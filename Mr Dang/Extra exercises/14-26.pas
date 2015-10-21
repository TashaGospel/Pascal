const fi = '14-26.inp';
	  fo = '14-26.out';
	  maxn = 1000;
	  dx:array[1..4] of longint = (-1,0,0,1);
	  dy:array[1..4] of longint = (0,1,-1,0); 
var n,count:longint;
	a:array[1..maxn,1..maxn] of longint;

procedure input;
begin
	readln(n);
end;

procedure output;
var i,j:longint;
begin
	inc(count);
	writeln(count,':');
	for i:=1 to n do
	begin
		for j:=1 to n do write(a[i,j],' ');
		writeln;
	end;
end;
			
procedure main(x,y,i:longint);
var j:longint;
begin
	if a[x,y] <> 0 then exit;
	a[x,y]:=i;
	if i < (n*n) then
		for j:=1 to 4 do
		begin
			if (x+dx[j]<=n) and (1<=x+dx[j]) and (y+dy[j]<=n) and (1<=y+dy[j]) then 
				main(x+dx[j],y+dy[j],i+1);
		end
	else if (x=n) and (y=1) then output;
	a[x,y]:=0;
end;

begin
	input;
	main(1,1,1);
end.
