const fi = 'hau.inp';
	  fo = 'hau.out';
	  maxn = 1000;
var n,res:longint;
	a:array[1..maxn,1..maxn] of longint;
	b,path:array[1..maxn] of longint;
	vert,norwes,souwes:array[-maxn..maxn] of boolean;

procedure input;
var f:text;
	i,j:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n);
	for i:=1 to n do 
		for j:=1 to n do read(f,a[i,j]);
	close(f);
	fillchar(vert,sizeof(vert),true);
	fillchar(norwes,sizeof(norwes),true);
	fillchar(souwes,sizeof(souwes),true);
	res:=maxlongint;
end;

procedure main(c,sum:longint);
var i:longint;
begin
	if sum > res then exit;
	for i:=1 to n do if (vert[i]) and (norwes[c-i]) and (souwes[c+i]) then
	begin
		b[c]:=i;
		vert[i]:=false;
		norwes[c-i]:=false;
		souwes[c+i]:=false;
		if c < n then main(c+1,sum+a[c,i])
		else if sum+a[c,i] < res then
		begin
			res:=sum+a[c,i];
			path:=b;
		end;
		vert[i]:=true;
		norwes[c-i]:=true;
		souwes[c+i]:=true;
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
	close(f);
end;

begin
	input;
	main(1,0);
	output;
end.
