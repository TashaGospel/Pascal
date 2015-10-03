uses math;
const fi = 'paswap.inp';
	  fo = 'paswap.out';
	  maxn = 1000;
var n:longint;
	a:array[1..maxn] of longint;

procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	readln(f,n);
	for i:=1 to n do read(f,a[i]);
	close(f);
end;

function main(c,d:longint; var posi:longint):longint; //pos result of whole function
var postmp,maxval,i,mid,pos1,pos2,t1,t2:longint; //postmp:temporary pos; 
	b:array[1..maxn] of longint; 
begin
	if c=d then 
	begin
		if a[c]=1 then exit(1) else exit(0);
	end
	else
	begin
		fillchar(b,sizeof(b),0);
		maxval:=-maxlongint;
		mid:=(d+c) div 2;
		for i:=c to d do 
		begin
			inc(b[a[i]]); //distribution counting
			if maxval < a[i] then maxval:=a[i]; //maxval:highest number of string
		end;
		for i:=1 to maxval do if b[i] = 0 then break;
		dec(i); //length of permutation
		for postmp:=c to d do if a[postmp]<=i then break; //pos of permutation
		t1:=main(c,mid,pos1);
		t2:=main(mid+1,d,pos2);
		if (i>t1) and (i>t2) then
		begin
			posi:=postmp;
			exit(i)
		end
		else if t1>t2 then
		begin
			posi:=pos1;
			exit(t1);
		end
		else
		begin
			posi:=pos2;
			exit(t2);
		end;
	end;
end;		

procedure output;
var f:text;
	res,respos:longint;
begin
	assign(f,fo);
	rewrite(f);
	res:=main(1,n,respos);
	if res = 0 then write(f,0)
	else
	begin
		writeln(f,respos);
		write(f,res);
	end;
	close(f);
end;

begin
	input;
	output;
end.
