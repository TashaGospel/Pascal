const fi = 'binback.inp';
	  fo = 'binback.out';
	  maxn = 1000;
var n,w,done,res:longint;
	a:array[1..maxn] of longint;
	ok:array[1..maxn] of boolean;

procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	readln(f,n,w);
	for i:=1 to n do read(f,a[i]);
	close(f);
	fillchar(ok,sizeof(ok),true);
end;

procedure quicksort(d,c:longint);
var i,j,mid,tmp:longint;
begin
	i:=d; j:=c; mid:=a[(d+c) div 2];
	repeat
		while a[i] < mid do inc(i);
		while mid < a[j] do dec(j);
		if i <= j then
		begin
			tmp:=a[i];
			a[i]:=a[j];
			a[j]:=tmp;
			inc(i);
			dec(j);
		end;
	until i > j;
	if i < c then quicksort(i,c);
	if d < j then quicksort(d,j);
end;

procedure main;
var i,cur:longint;
begin
	if a[n] > w then exit;
	while done < n do
	begin
		cur:=0;
		for i:=n downto 1 do
			if (cur + a[i] <= w) and (ok[i]) then
			begin
				cur:=cur+a[i];
				inc(done);
				ok[i]:=false;
			end;
		inc(res);
	end;
end;

procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,res);
	close(f);
end;

begin
	input;
	quicksort(1,n);
	main;
	output;
end.
