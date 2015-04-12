const fi = '4-1.inp';
	  fo = '4-1.out';
	  maxn = 1000;
var n,k:longint;
	a:array[1..maxn] of string;
	b:array[0..maxn] of longint;

procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	readln(f,n,k);
	for i:=1 to n do readln(f,a[i]);
	close(f);
end;

procedure output;
var f:text;
	procedure main(i:longint);
	var j,x:longint;
	begin
		for j:=b[i-1]+1 to n-k+i do
		begin
			b[i]:=j;
			if i < k then main(i+1)
			else
			begin
				for x:=1 to k do write(f,a[b[x]],' ');
				writeln(f);
			end;
		end;
	end;
begin
	assign(f,fo);
	rewrite(f);
	b[0]:=0;
	main(1);
	close(f);
end;


begin
	input;
	output;
end.