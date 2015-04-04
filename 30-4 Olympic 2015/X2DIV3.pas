const fi = 'x2div3.inp';
	  fo = 'x2div3.out';
	  maxn = 1000;
var n,count:longint;
	a:array[1..maxn] of longint;

procedure input;
var f:text;
begin
	assign(f,fi);
	reset(f);
	readln(f,n);
	close(f);
	a[1]:=n;
	count:=1;
end;

procedure main(i:longint);
var tmp:longint;
begin
	if i <> 1 then
	if i mod 2 = 0 then 
	begin
		inc(count);
		tmp:=i div 2;
		a[count]:=tmp;
		main(tmp);
	end
	else
	begin
		inc(count);
		tmp:=i*3+1;
		a[count]:=tmp;
		main(tmp);
	end;
end;

procedure output;
var i:longint;
	f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,'1');
	for i:=count-1 downto 1 do
		if a[i] mod 2 = 0 then write(f,'*2')
		else write(f,'/3');
	close(f);
end;

begin
	input;
	main(n);
	output;
end.
