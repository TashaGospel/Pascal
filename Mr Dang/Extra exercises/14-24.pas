const fi = '14-24.inp';
	  fo = '14-24.out';
	  maxn = 100000000;
var n,m,count,num:longint;
	a:array[1..maxn] of longint;
	ok:array[1..maxn] of boolean;

procedure input;
var f:text;
begin
	assign(f,fi);
	reset(f);
	readln(f,n,m);
	close(f);
	fillchar(ok,sizeof(ok),true);
	num:=(m-1) div n + 1;
end;

procedure output;
var f:text;
	posi:longint;
begin
	assign(f,fo);
	rewrite(f);
	if m mod n <> 0 then posi:=m mod n else posi:=n;
	write(f,chr(a[posi]+64));
	close(f);
	halt;
end;

procedure main(c:longint);
var i:longint;
begin
	for i:=1 to n do if ok[i] then
	begin
		a[c]:=i;
		ok[i]:=false;
		if c < n then main(c+1)
		else inc(count);
		if count = num then output;
		ok[i]:=true;
	end;
end;
		
begin
	input;
	main(1);
end.
