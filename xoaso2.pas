const fi = 'xoaso.inp';
	  fo = 'xoaso.out';
var a,s:string;
	k,n:longint;

procedure input;
var f:text;
begin
	assign(f,fi);
	reset(f);
	readln(f,a);
	read(f,k);
	close(f);
end;

function minpos(i:longint):longint;
var j,res:longint;
begin
	res:=i;
	for j:=i to i+k do if a[res] > a[j] then res:=j;
	exit(res);
end;

procedure main;
var i,j,mp:longint;
begin
{	amax:=a[1];
	amax2:='0';
	n:=length(a);
	for i:=2 to k+1 do
		if a[i] > amax then
		begin
			amax2:=amax;
			amax:=a[i];
		end;
	s:=s+amax;
	amax:='0';
	for j:=2 to n-k do
	//for i:=j to k+j do
	begin
		if a[k+j] >= amax then
		begin
			amax:=a[i];
			if amax > amax2 then
			begin
				tmp:=amax;
				amax:=amax2;
				amax2:=tmp;
			end;
		end;
		s:=s+amax;
		amax:='0';
	end;
end;}

	{maxpos:=1;
	maxpos2:=0;
	maxpos3:=0;
	for i:=1 to k+1 do if a[i] > a[maxpos] then
	begin
		maxpos3:=maxpos2;
		maxpos2:=maxpos;
		maxpos:=i;
	end;
	s:=s+a[maxpos];
	delete(a,maxpos,1);
	maxpos:=maxpos2;
	maxpos2:=maxpos3;
	while length(s) < n-k do
	begin
		if a[k+1] > a[maxpos] then
		begin
			maxpos2:=maxpos;}
	n:=length(a);
	while length(a) > n-k do
	begin
		mp:=minpos(1);
		delete(a,mp,1);
	end;
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,a);
	close(f);
end;

begin
	input;
	main;
	output;
end.
