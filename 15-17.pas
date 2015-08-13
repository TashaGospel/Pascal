const fi = '15-17.inp';
	  fo = '15-17.out';
	  maxn = 100001;

var n,sum,res:longint;
	a:array[0..maxn] of longint;

procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n);
	for i:=1 to n do 
	begin
		read(f,a[i]);
		sum:=sum+a[i];
	end;
	close(f);
end;

procedure main;
var i,len,curSum:longint;
begin
	for len:=1 to n do
	begin
		curSum:=0;
		for i:=1 to len-1 do curSum:=curSum + a[i];
		for i:=1 to n-len+1 do
		begin
			curSum:= curSum - a[i-1] + a[i + len - 1];
			if curSum = sum - Cursum then inc(res);
		end;
	end;
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
	main;
	output;
end.
