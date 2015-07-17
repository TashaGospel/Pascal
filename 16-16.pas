//Not finished
const fi = '16-16.inp';
	  fo = '16-16.out';
	  maxn = 1000;
type edge = record
	u,v,w:longint;
	end;
var n,count,res,sum,m:longint;
	a:array[1..maxn] of edge;
	chosen,resChosen:array[1..maxn] of boolean;
	avail:array[1..maxn] of boolean;

procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n,m);
	for i:=1 to m do with a[i] do read(f,u,v,w);
	close(f);
	fillchar(avail,sizeof(avail),true);
	avail[1]:=false;
	res:=maxlongint;
end;

procedure check;
begin
	if sum < res then
	begin
		writeln(sum);
		res:=sum;
		resChosen:=chosen;
	end;
end;

procedure main(c:longint);
var connected:longint;
begin
	if c > m then exit;
	with a[c] do if avail[u] xor avail[v] then
	begin
		if avail[u] then connected:=u else connected:=v;
		avail[connected]:=false;
		inc(count);
		sum:=sum+w;
		chosen[c]:=true;
		writeln(u,' ',v,' ',connected,' ',count,' ',sum);
		if (count=n-1) then check
		else main(c+1);
		chosen[c]:=false;
		sum:=sum-w;
		dec(count);
		avail[connected]:=true;
	end;
	main(c+1);		
end;

procedure output;
var f:text;
	i:longint;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f,res);
	for i:=1 to m do with a[i] do if resChosen[i] then writeln(f,u,' ',v,' ',w);
	close(f);
end;

begin
	input;
	main(1);
	output;
end.
