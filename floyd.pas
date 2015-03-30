const 	fi='duongdi.inp';
		fo='floyd.out';
		max = 1000;
		vc = maxint;
var	d,T: array[1..max,1..max] of integer;
	m,n,u,v:integer;
	
procedure inputdata;
var f:text; i,j,d1,d2:integer;
begin
	assign(f,fi); reset(f);
    readln(f,m,n,u,v);
    for i:=1 to n do
     	for j:=1 to n do 
			if i = j then d[i,j]:= 0 else d[i,j]:= vc;
    for i:=1  to m do readln(f,d1,d2,d[d1,d2]);
    close(f);
	fillbyte(T,sizeof(T),0);
end;

procedure floyd;
var i,j,k:longint;
begin
	for k:=1 to n do
		for i:=1 to n do
			for j:=i to n do
				if D[i,j] > D[i,k] + D[k,j] then
				begin
					D[i,j]:= D[i,k] + D[k,j];
					T[i,j]:=k;
				end;
end;

function path(i,j:integer):string;
var k:integer; s:string;
begin
	if t[i,j] <> 0 then
	begin
		k:=T[i,j];
		str(k,s);
		path:= path(i,k) + ' ' + s + ' ' + path(k,j);
	end
	else exit('');
end;

procedure outputdata;
var i,j:integer;
	st:string;
	f:text;
begin
	assign(f,fo); rewrite(f);
	if d[u,v] = vc then writeln(f,'KHONG CO DUONg Di')
	else
	begin
		st:=path(u,v);
		while st[1]=' ' do delete(st,1,1);
        while st[length(st)]=' ' do delete(st,length(st),1);
		while pos('  ',st) > 0 do
		begin
			delete(st,pos('  ',st),1);
		end;
		writeln(f,d[u,v]);
        writeln(f,u,' ',st,' ',v);
    end;
    close(f);
end;

begin
	inputdata;
    floyd;
    outputdata;
end.
