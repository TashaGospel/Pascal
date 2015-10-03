uses math;
const fi = '15-7.inp';
	  fo = '15-7.out';
	  maxn = 1001;

var n,sum,res:longint;
	a,t,tr:array[0..maxn] of longint;
    chosen:array[1..maxn] of boolean;

procedure input;
var f:text;
	i:longint;
begin
	assign(f,fi);
	reset(f);
	read(f,n);
	for i:=1 to n do 
	begin
		read(f,a[i]);
		sum:=sum+a[i];
	end;
	close(f);
end;

procedure path(i:longint);
begin
    if tr[i] <> 0 then
    begin
        chosen[tr[i]]:=true;
        path(i-a[tr[i]]);
    end;
end;

procedure main;
var i,j:longint;
begin
    t[0]:=1;
    for i:=1 to n do
        for j:=sum div 2 downto 1 do
            if (t[j] = 0) and (t[j-a[i]] = 1) then 
            begin
                t[j]:=1;
                tr[j]:=i;
                if res < j then res:=j;
            end;            
end;

procedure output;
var f:text;
	i:longint;
begin
	assign(f,fo);
	rewrite(f);
	for i:=1 to n do if chosen[i] then write(f,i,' ');
	writeln(f,res);
	for i:=1 to n do if not chosen[i] then write(f,i,' ');
	write(f,sum - res);
	close(f);
end;

begin
	input;
	main;
	path(res);
	output;
end.
