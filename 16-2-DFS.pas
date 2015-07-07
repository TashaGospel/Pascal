const fi = '16-2.inp';
	  fo = '16-2.out';
	  maxn = 1000;
var n,x,y,count:longint;
	a:array[1..maxn,1..maxn] of longint;
	b:array[1..maxn] of longint;
	avail:array[1..maxn] of boolean;

procedure input;
var f:text;
	i,j:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n,x,y);
	for i:=1 to n do
		for j:=1 to n do read(f,a[i,j]);
	close(f);
	fillchar(avail,sizeof(avail),true);
end;

procedure output(yes:boolean);
var f:text;
	i:longint;
begin
	assign(f,fo);
	rewrite(f);
	if not yes then write(f,'No')
	else
	begin
		writeln(f,'Yes');
		for i:=1 to count do write(f,b[i],' ');
	end;
	close(f);
	halt;
end;	

procedure main(c:longint);
var i:longint;
begin
	inc(count);
	avail[c]:=false;
	b[count]:=c;
	if c <> y then
	begin
		for i:=1 to n do if (a[c,i] = 1) and (avail[i]) then main(i);
	end
	else output(true);
	dec(count);
end;

begin
	input;
	main(x);
	output(false);
end.
