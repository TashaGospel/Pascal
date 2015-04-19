const fi = '4-6.inp';
	  fo = '4-6.out';
var s:string;
	n,count:longint;
	a:array[1..15] of boolean;
	res:array[1..100000] of string;

procedure input;
var f:text;
begin
	assign(f,fi);
	reset(f);
	read(f,s);
	close(f);
	n:=length(s);
	fillchar(a,sizeof(a),false);
	count:=0;
end;

//Should have just used binary string instead of boolean
//Much easier to imagine

procedure main(i:longint);
var tmp:string;
	y:longint;
	function ok:boolean;
	var j:longint;
	begin
		for j:=1 to count do if tmp = res[j] then exit(false);
		exit(true);
	end;
begin
	tmp:='';
	a[i]:=true;
	for y:=1 to n do if a[y] then tmp:=tmp+s[y];
	if (i=n) and ok then 
	begin
		inc(count);
		res[count]:=tmp;
	end
	else if i < n then main(i+1);
	a[i]:=false;
	tmp:='';
	for y:=1 to n do if a[y] then tmp:=tmp+s[y];
	if (i=n) and ok then 
	begin
		inc(count);
		res[count]:=tmp;
	end
	else if i < n then main(i+1);
end;

procedure output;
var f:text;
	i:longint;
begin
	assign(f,fo);
	rewrite(f);
	for i:=1 to count-1 do writeln(f,res[i]); //count-1 because res[count]=''
	close(f);
end;

begin
	input;
	main(1);
	output;
end.