const fi = '14-30.inp';
	  fo = '14-30.out';
	  maxn=101;
	  note:array[1..3] of string = ('+','-','');

var n,count:longint;
	a:array[1..maxn] of longint;
	b:array[1..maxn,1..maxn] of longint;

procedure input;
var f:text;
begin
	assign(f,fi);
	reset(f);
	readln(f,n);
	close(f);
	a[1]:=1;
end;

function ok:boolean;
var sum,i,carry,head:longint;
begin
	sum:=0; carry:=0; i:=0;
	while i < n do
	begin
		inc(i);
		head:=i;
		while a[i+1] = 3 do
		begin
			if a[head] = 1 then carry:=carry*10+i
			else carry:=carry*10-i;
			inc(i);
		end;
		if a[head] = 1 then carry:=carry*10+i
		else carry:=carry*10-i;
		sum:=sum+carry;
		carry:=0;
	end;
	if sum = 0 then exit(true) else exit(false);
end;

procedure check;
begin
	if ok then
	begin
		inc(count);
		b[count]:=a;
	end;
end;

			
procedure main(c:longint);
var i:longint;
begin
	for i:=1 to 3 do
	begin
		a[c]:=i;
		if c < n then main(c+1)
		else check;
	end;
end;

procedure output;
var i,j:longint;
	f:text;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f,count);
	for i:=1 to count do 
	begin
		write(f,1);
		for j:=2 to n do write(f,note[b[i,j]],j);
		writeln(f,'=0');
	end;
	close(f);
end;

begin
	input;
	main(2);
	output;
end.