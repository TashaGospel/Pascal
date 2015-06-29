const fi = 'balo.inp';
	  fo = 'balo.out';
	  maxn = 1000;
var n,m,res:longint;
	w,v,a,path:array[1..maxn] of longint;
	c:array[1..maxn] of real;

procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	readln(f,n,m);
	for i:=1 to n do read(f,v[i]);
	for i:=1 to n do 
	begin
		read(f,w[i]);
		c[i]:=v[i]/w[i];
	end;
	close(f);
	res:=0;
end;

function maxc(d:longint):real;
var i:longint;
begin
	maxc:=c[d];
	for i:=d+1 to n do if maxc < c[i] then maxc:=c[i];
end;

procedure main(d,value,wremain:longint);
var num,i,valu,wei:longint;
begin
	num:=wremain div w[d];
	if d < n then
		for i:=0 to num do
		begin
			a[d]:=i;
			valu:=value+i*v[d]; wei:=wremain-i*w[d];
			if valu+wei*maxc(d+1) > res then  //max possible value 
				main(d+1,valu,wei);
		end
	else if value+(wremain div w[d])*v[d] > res then
	begin
		a[d]:=wremain div w[d];
		res:=value+a[d]*v[d];
		path:=a;
	end;
end;
			
procedure output;
var f:text;
	i:longint;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f,res);
	for i:=1 to n do write(f,path[i],' ');
	writeln(f);
	for i:=1 to n do write(f,i,' ');
	close(f);
end;

begin
	input;
	main(1,0,m);
	output;
end.
