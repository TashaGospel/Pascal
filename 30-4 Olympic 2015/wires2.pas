//Cai dat dang de quy. Do phuc tap = O(n.lg(L))
const
	path = '';
	fi	 = path + 'wires.INP';
	fo	 = path + 'wires.OUT';
	maxn = 100000;
var
	n, k, kq,lmin,lmax: longint;
	l:array[1..maxn] of longint;

procedure input;
var f:text;
	i:longint;
    sum:int64;
begin
	assign(f,fi);
	reset(f);
	readln(f,n,k);
	for i:=1 to n do readln(f,l[i]);
	close(f);
    sum:=0; lmin:=1;
    for i:=1 to n do
        sum:=sum+l[i];
    lmax:= sum div k;
end;

function ISOK(x:longint):boolean;
var i,count:longint;
begin
	count:=0;
	for i:=1 to n do count:=count+ l[i] div x;
	exit (count >= k);
end;

Procedure ttry(l,r:longint);
var x:longint;
begin
    if r < l then exit;
	x:= (l+r) div 2;
	if ISOK(x) then
	begin
		kq:=x;
		ttry(x+1,r);
	end
	else ttry(l,x-1);
end;

procedure output;
var f:text;
begin
	assign(f,fo); rewrite(f);
	writeln(f,kq);
	close(f);
end;

Begin
	Input;
    kq:=0;
	ttry(lmin,lmax);
	output;
End.
