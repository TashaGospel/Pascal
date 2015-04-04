const fi = 'kso.inp';
	  fo = 'kso.out';
	  maxn = 1000;
var m,n,k,a,i:longint;

procedure input;
var f:text;
begin
	assign(f,fi); reset(f);
	readln(f,m,n,k);
	close(f);
end;

function DivCon(i,j:longint):longint;
var mid,w:longint;
begin
	if j = 1 then exit(i mod a)
	else
	begin
		mid:=j div 2;
		w:=DivCon(i,mid) mod a;
                if j mod 2 = 0 then exit((w*w) mod a)
                else exit((w*w*i) mod a);
        end;
end;

procedure output;
var  f:text;
begin
        assign(f,fo);
        rewrite(f);
        writeln(f,DivCon(m,n));
        close(f);
end;

begin
        input;
        a:=1;
        for i:=1 to k do a:=a*10;
        output;
end.



