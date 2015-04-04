{Hoang Duc Dat-10 Tin.com.vn-bai 1}
uses math;
const 	fi = 'diff.inp';
        fo = 'diff.out';
	maxn = 100000;
type arr = array[1..maxn] of longint;
var a:arr;
    n,diff,maxd, mind: longint;
//------------------------------------
procedure nhap;
var f:text;
    i:longint;
   begin
	assign(f,fi); reset(f);
	readln(f,n);
	for i:=1 to n do read(f,a[i]);
	close(f);
   end;
//-------------------------------------------------------------
procedure solve(d,c:longint; var maxd,mind, maxdiff:longint);
var m, max1, max2, min1, min2, maxdd1, maxdd2:longint;
   begin
	if d=c then
	begin
		maxd:=a[d];
		mind:=a[d];
		maxdiff:=0;
	end
	else
	begin
		m:= (d+c) div 2;
		solve(d,m,max1, min1,maxdd1);
	        solve(m+1,c,max2, min2,maxdd2);
		maxd:= max(max1,max2);
		mind:=min(min1,min2);
		maxdiff:=maxd-mind;
	end;
    end;
//---------------------------------------------------------------
procedure xuat;
var f:text;
   begin
	assign(f,fo); rewrite(f);
	write(f,diff);
	close(f);
   end;
//-------------------------------------
begin
	nhap;
	solve(1,n,maxd,mind,diff);
	xuat;
end.
