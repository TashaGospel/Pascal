const fi = 'game.inp';
	  fo = 'game.out';
	  maxn = 1000000;
var a:array[1..maxn] of longint;
	n,pos1,pos2:longint;

procedure input;
var f:text;
	i:longint;
	tmp:char;
begin
	assign(f,fi);
	reset(f);
	readln(f,n);
	for i:=1 to n do
	begin
		readln(f,tmp,a[i]);
		if tmp = 'L' then a[i]:=-a[i];
	end;
	close(f);
end;

function maxl(d,c:longint; var pos:longint):longint;
var s,i,maxsum:longint;
begin
	s:=0;
	maxsum:=-maxlongint;
	for i:= c downto d do
	begin
		s:=s+a[i];
		if s > maxsum then
		begin
			maxsum:=s;
			pos:=i;
		end;
	end;
	exit(maxsum);
end;


function maxr(d,c:longint; var pos:longint):longint;
var i,s,maxsum:longint;
begin
	s:=0;
	maxsum:=-maxlongint;
	for i:= d to c do
	begin
		s:=s+a[i];
		if s > maxsum then
		begin
			maxsum:=s;
			pos:=i;
		end;
	end;
	exit(maxsum);
end;

function timmax(d,c:longint; var dpos,cpos:longint):longint;
var mid,d1,d2,d3,s1,s2,s3,s4,s5,s6:longint;
begin
	if d = c then
	begin
		dpos:=d;
		cpos:=c;
		exit(a[d]);
	end
	else
	begin
		mid:=(d+c) div 2;
		d1:=timmax(d,mid,s1,s2);
		d2:=timmax(mid+1,c,s3,s4);
		d3:=maxl(d,mid,s5)+maxr(mid+1,c,s6);
		if (d3 >= d1) and (d3>=d2) then
		begin
			dpos:=s5;
			cpos:=s6;
			timmax:=d3;
		end
		else if d1 >= d2 then
		begin
			dpos:=s1;
			cpos:=s2;
			timmax:=d1;
		end
		else
		begin
			dpos:=s3;
			cpos:=s4;
			timmax:=d2;
		end;
	end;
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	writeln(f,timmax(1,n,pos1,pos2));
	write(f,pos1,' ',pos2);
	close(f);
end;

begin
	input;
	output;
end.