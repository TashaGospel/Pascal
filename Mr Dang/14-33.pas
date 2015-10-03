const maxn = 1000;
var st:string;
	n,count:longint;
	a:array[1..maxn] of string;
	b:array[1..maxn] of longint;
	avail:array[1..maxn] of boolean;

procedure input;
begin
	readln(st);
	n:=length(st);
	fillchar(avail,sizeof(avail),true);
end;

function ok(s:string):boolean;
var i:longint;
begin
	for i:=1 to count do if s = a[i] then exit(false);
	exit(true);
end;

procedure check;
var res:string;
	i:longint;
begin
	res:='';
	for i:=1 to n do res:=res+st[b[i]];
	if ok(res) then 
	begin
		inc(count);
		a[count]:=res;
	end;
end;

procedure main(c:longint);
var i:longint;
begin
	for i:=1 to n do if avail[i] then
	begin
		avail[i]:=false;
		b[c]:=i;
		if c < n then main(c+1)
		else check;
		avail[i]:=true;
	end;
end;

procedure output;
var i:longint;
begin
	writeln(count);
	for i:=1 to count do write(a[i],' ');
end;

begin
	input;
	main(1);
	output;
end.
