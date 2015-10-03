const fi = '16-13.inp';
	  fo = '16-13.out';
	  maxn = 100000;
var m,n,d:longint;
	t:array[1..maxn] of longint;

procedure input;
var f:text;
	i,d1,d2:longint;
begin
	fillchar(t,sizeof(t),0);
	assign(f,fi);
	reset(f);
	read(f,n,m);
	for i:=1 to m do
	begin
		read(f,d1,d2);
		if (t[d1]=0) and (t[d2]=0) then
		begin
			inc(d);
			t[d1]:=d1;
			t[d2]:=d1;
		end
		else if (t[d1] <> 0) and (t[d2]=0) then begin t[d2]:=t[d1]; inc(d); end;
		else if (t[d1] = 0) and (t[d2] <> 0) then begin t[d1]:=t[d2]; inc(d); end;
		else if (t[d1] <> t[d2]) then
		begin
			tmp:=t[d2];
			for j:=1 to n do if t[j] = tmp then begin t[j]:=t[d1]; inc(d); end;
		end;
	end;
	close(f);
end;
			
procedure output;
var f:text;
begin
	assign(f,fo);
	rewrite(f);
	write(f,n-d);
	close(f);
end;

begin	
	input;
	output;
end.
