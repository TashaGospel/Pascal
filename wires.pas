const fi = 'wires.inp';
	  fo = 'wires.out';
	  maxn = 100000;
var l:array[1..maxn] of longint;
	n,k,lmax,maxsum:longint;

Procedure Input;
Var f:text;
	i:longint;
	sum:int64;
Begin
	maxsum:=0;
	assign(f,fi);
	reset(f);
	readln(f,n,k);
	for i:=1 to n do readln(f,l[i]);
	close(f);
	sum:=0;
	for i:=1 to n do if lmax < l[i] then lmax:= l[i];
End;


function higherk(a:longint):boolean;
var i,count:longint;
Begin
	count:=0;
	for i:=1 to n do count:=count+ l[i] div a;
	exit(count >= k);
end;

procedure main(d,c:longint);
var mid:longint;
Begin
	if d > c then exit;
	mid:=(d+c) div 2;
	if higherk(mid) then 
	begin
		maxsum:=mid;
		main(mid+1,c);
	end
	else main(d,mid-1);
end;

procedure output;
var f:text;
Begin
	assign(f,fo);
	rewrite(f);
	write(f,maxsum);
	close(f);
end;

Begin
	input;
	main(1,lmax);
	output;
end.


