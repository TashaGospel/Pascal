const dx: array[1..8] of shortint = (1,1,-1,-1,2,2,-2,-2);
	  dy: array[1..8] of shortint = (2,-2,2,-2,1,-1,1,-1);
	  fi = '14-23.inp';
	  fo = '14-23.out';
	  maxn = 20;
var n,count,x,y:longint;
	a:array[1..maxn,1..maxn] of longint;
	f:text;

procedure input;
var f:text;
begin
	assign(f,fi);
	reset(f);
	readln(f,n,x,y);
	close(f);
end;

procedure output;
var i,j:longint;
begin
	for i:=1 to n do
	begin
		for j:=1 to n do write(f,a[i,j],' ');
		writeln(f);
	end;
	writeln(f);
	inc(count);
end;


procedure main(x,y,num:longint);
var u,v,i:longint;
begin
	if a[x,y] <> 0 then exit;
	a[x,y]:=num;
	if num = n*n then output;
	for i:=1 to 8 do
	begin
		u:=x+dx[i];
		v:=y+dy[i];
		if (u>=1) and (u<=n) and (v>=1) and (v<=n) then main(u,v,num+1);
	end;
	a[x,y]:=0;
end;

begin
	assign(f,fo);
	rewrite(f);
	input;
	main(x,y,1);
	write(f,count);
	close(f);
end.

	


