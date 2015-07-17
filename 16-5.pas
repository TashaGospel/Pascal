const fi = '16-5.inp';
	  fo = '16-5.out';
	  maxn = 1000;
var n,num:longint;
	a:array[1..maxn,1..maxn] of boolean;
	avail:array[1..maxn] of boolean;

procedure input;
var f:text;
	d1,d2:longint;
begin
	fillchar(a,sizeof(a),false);
	assign(f,fi);
	reset(f);
	read(f,n);
	while not eof(f) do 
	begin
		read(f,d1,d2);
		a[d1,d2]:=true;
		a[d2,d1]:=true;
	end;
	close(f);
end;

procedure check(i:longint);
var j:longint;
begin
	avail[i]:=false;
	for j:=1 to n do if (a[i,j] and avail[j]) then check(j);
end;

function count_components:longint;
var i,count:longint;
begin
	fillchar(avail,sizeof(avail),true);
	count:=0;
	for i:=1 to n do if avail[i] then
	begin
		inc(count);
		check(i);
	end;
	exit(count);
end;

procedure main(var f:text);
var i,j:longint;
begin
	num:=count_components;
	for i:=1 to n-1 do
		for j:=i+1 to n do
			if a[i,j] then
			begin
				a[i,j]:=false; a[j,i]:=false; 
				if count_components > num then writeln(f,i,' ',j);
				a[i,j]:=true; a[j,i]:=true;
			end;
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	main(f);
	close(f);
end;

begin
	input;
	output;
end.
