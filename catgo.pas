const fi = 'catgo.inp';
	  fo = 'catgo.out';
	  maxn = 100000;
var l:array[1..maxn] of longint;
	n,m,lmax,maxsum:longint;


procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	readln(f,n,m);
	lmax:=0;
	for i:=1 to n do 
	begin
		readln(f,l[i]);
		if lmax < l[i] then lmax := l[i];
	end;
	close(f);

end;

function higherm(i:longint):boolean;
var count,j:longint;
begin
	count:=0;
	for j:=1 to n do count:=count + (l[j] div i);
	exit(count>=m);
end;

procedure main(d,c:longint);
var mid:longint;
begin
	if d > c then exit;
	mid:=(d+c) div 2;
	if higherm(mid) then
	begin
		maxsum:=mid;
		main(mid+1,c);
	end
	else main(d,mid-1);
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,maxsum);
	close(f);
end;

begin
	maxsum:=0;
	input;
	main(1,lmax);
	output;
end.
