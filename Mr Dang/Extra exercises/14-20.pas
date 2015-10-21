const fi = '14-20.inp';
	  fo = '14-20.out';
	  maxn = 1000;
	  startpos=1;
var n,m,count,sum,res:longint;
	a:array[1..maxn,1..maxn] of longint;
	b,path:array[1..maxn] of longint;
	avail:array[1..maxn] of boolean;

procedure input;
var f:text;
	i,d1,d2,d3:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n,m);
	for i:=1 to m do 
	begin
		read(f,d1,d2,d3);
		a[d1,d2]:=d3;
		a[d2,d1]:=d3;
	end;
	close(f);
	fillchar(avail,sizeof(avail),true);
	res:=maxlongint;
end;

procedure check;
begin
	if sum < res then
	begin
		res:=sum;
		path:=b;
	end;
end;

procedure main(c:longint);
var i:longint;
begin
	if (count = n) and (c = startpos) then check;
	for i:=1 to n do if (a[c,i]>0) and (avail[i]) then
	begin
		avail[i]:=false;
		inc(count);
		b[count]:=i;
		sum:=sum+a[c,i];
		main(i);
		dec(count);
		avail[i]:=true;
		sum:=sum-a[c,i];
	end;
end;

procedure output;
var f:text;
	i:longint;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f,res);
	write(f,startpos,' ');
	for i:=1 to n do write(f,path[i],' ');
	close(f);
	halt;
end;

begin
	input;
	main(startpos);
	output;
end.
