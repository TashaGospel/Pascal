const fi = '16-8.inp';
	  fo = '16-8.out';
	  maxn = 1000;
var n,res,max:longint;
	a:array[1..maxn,1..maxn] of boolean;
	degree:array[1..maxn] of integer;
	stack:array[1..maxn] of longint;
	oddvertice:array[1..2] of longint;

procedure input;
var f:text;
	d1,d2:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n);
	while not eof(f) do
	begin
		read(f,d1,d2);
		a[d1,d2]:= true;
		a[d2,d1]:= true;
		inc(degree[d1]);
		inc(degree[d2]);
	end;
	close(f);
end;

procedure euler;
var top,i,x:longint;
begin
	top:=1;
	stack[top]:=n;
	while top > 0 do
	begin
		x:=stack[top];
		i:=1;
		while (i <= n) and (not a[x,i]) do inc(i);
		if i<=n then
		begin
			inc(top);
			stack[top]:=i;
			if top > max then max:=top;
			a[x,i]:=false;
			a[i,x]:=false;
		end
		else dec(top);
	end;
end;

function path(p,m:longint):string;
var tmp:string;
begin
	if p > m then
	begin
		str(stack[p],tmp);
		exit(tmp + ' ' + path(p-1,m));
	end
	else exit('');
end;

procedure main;
var i,oddNum:longint;
begin
	oddNum:=0;
	for i:=1 to n do if degree[i] mod 2 = 1 then 
	begin
		if oddNum = 2 then break;
		inc(oddNum);
		oddvertice[oddNum]:=i;
	end;
	if oddNum = 0 then
	begin
		res:=2;
		euler;
	end
	else if oddNum = 2 then
	begin
		res:=1;
		inc(n);
		a[n,oddvertice[1]]:=true;
		a[oddvertice[1],n]:=true;
		a[n,oddvertice[2]]:=true;
		a[oddvertice[2],n]:=true;
		euler;
	end
	else
	begin
		res:=0;
	end;
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f,res);
	if res = 2 then write(f,path(max,0))
	else if res = 1 then write(f,path(max-1,1));
	close(f);
end;

begin
	input;
	main;
	output;
end.
