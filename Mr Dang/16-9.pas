const fi = '16-9.inp';
	  fo = '16-9.out';
	  maxn = 1000;
	  startpos=1;
var n,count:longint;
	a:array[1..maxn,1..maxn] of longint;
	b:array[1..maxn] of longint;
	avail:array[1..maxn] of boolean;

procedure input;
var f:text;
	i,j:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n);
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
	if not yes then write(f,-1) 
	else
	begin
		write(f,startpos,' ');
		for i:=1 to n do write(f,b[i],' ');
	end;
	close(f);
	halt;
end;

procedure main(c:longint);
var i:longint;
begin
	if (count = n) and (c = startpos) then output(true);
	for i:=1 to n do if (a[c,i]=1) and (avail[i]) then
	begin
		avail[i]:=false;
		inc(count);
		b[count]:=i;
		main(i);
		dec(count);
		avail[i]:=true;
	end;
end;

begin
	input;
	main(startpos);
	output(false);
end.
