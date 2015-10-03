const fi = '14-20.inp';
	  fo = '14-20.out';
	  maxn = 100;
var n,maxnum,maxend:longint;
	a,b,trace:array[1..maxn] of longint; //a:original; b:current; c:result

procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	readln(f,n);
	for i:=1 to n do read(f,a[i]);
	close(f);
end;

procedure check;
var max,maxcount,maxpos,i,j:longint;
	trace1:array[1..maxn] of longint;
begin
	maxpos:=0;
	max:=-maxlongint;
	maxcount:=0;
	for i:=1 to n do
		if b[i] = 1 then
			if a[i] > a[maxpos] then
			begin
				trace1[i]:=maxpos;
				max:=a[i];
				maxpos:=i;
				inc(maxcount);
			end
			else exit;
	if maxcount > maxnum then
	begin
		maxend:=maxpos;
		maxnum:=maxcount;
		for j:=1 to n do trace[j]:=trace1[j];
	end;
end;

procedure main(i:longint);
var j:longint;
begin
	for j:=0 to 1 do
	begin
		b[i]:=j;
		if i < n then main(i+1)
		else check;
	end;
end;

function path(i:longint):string;
var tmp,tmp2:string;
begin
	str(a[i],tmp);
	if trace[i] <> 0 then exit(path(trace[i])+' '+tmp)
	else exit(tmp);
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f,maxnum);
	write(f,path(maxend));
	close(f);
end;

begin
	input;
	main(1);
	output;
end.
