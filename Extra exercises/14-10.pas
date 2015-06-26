const fi = '14-10.inp';
	  fo = '14-10.out';
	  maxn = 1000;
var a:array[1..maxn,1..maxn] of longint;
	b:array[1..maxn] of longint;
	ok:array[1..maxn] of boolean;
	n,u,v,count:longint;

procedure input;
var f:text;
	i,j:longint;
begin
	assign(f,fi);
	reset(f);
	readln(f,n,u,v);
	for i:=1 to n do
	begin
		for j:=1 to n do read(f,a[i,j]);
		readln(f);
	end;
	close(f);
	fillchar(ok,sizeof(ok),true);
end;

procedure print(var f:text);
var i:longint;
begin
	for i:=1 to count-1 do write(f,b[i],'->');
	write(f,b[count]);
	close(f);
	halt;
end;

procedure main(c:longint; var f:text);
var i:longint;
begin
	inc(count);
	b[count]:=c;
	ok[c]:=false;
	if c = v then print(f);
	for i:=1 to n do
		if (a[c,i] = 1) and (ok[i]) then main(i,f);
	dec(count);
	ok[c]:=true;
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	main(u,f);
end;

begin
	input;
	output;
end.
