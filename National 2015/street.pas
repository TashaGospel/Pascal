uses math;
const fi = 'street.inp';
      fo = 'street.out';
      maxn = 5000;
      inf = 1000000000000000000;
      //inf = 1000;

var a:array[0..maxn] of qword;
    count:longint;

function min(i,j,k:qword):qword;
begin
    if (i <= j) and (i <= k) then exit(i)
    else if (j <= k) then exit(j)
    else exit(k);
end;

procedure buildArray;
var i3,i5,i7:longint;
begin
    a[1]:=3; a[2]:=5; a[3]:=7;
    i3:=1; i5:=1; i7:=1;
    count:=3;
    while a[count] < inf do
    begin
        inc(count);
        a[count]:=min(a[i3] * 3, a[i5] * 5, a[i7] * 7);
        if a[count] = a[i3] * 3 then inc(i3);
        if a[count] = a[i5] * 5 then inc(i5);
        if a[count] = a[i7] * 7 then inc(i7);
        //writeln(count,' ',a[count],' ',i3,' ',i5,' ',i7);
    end;
    //for i:=1 to 10 do writeln(a[i]);
end;

function binarySearch(l,r:longint;x:qword):longint;
var mid:longint;
begin
    while l <= r do
    begin
        mid:=(l + r) div 2;
        if a[mid] = x then exit(mid)
        else if a[mid] < x then l:=mid + 1
        else r:=mid-1;
    end;
    exit(-1);
end;

function main(n:qword):char;
var tmp:longint;
begin
    tmp:=binarySearch(1,count,n);
    if tmp = -1 then exit('N')
    else if tmp mod 2 = 0 then exit('R')
    else exit('L');
end;

procedure parseFile;
var f,g:text;
    n:int64;
begin
    assign(f,fi);
    assign(g,fo);
    reset(f);
    rewrite(g);
    while not seekeof(f) do
    begin
        read(f,n);
        writeln(g,main(n));
    end;
    close(f);
    close(g);
end;

begin
    buildArray;
    parseFile;
end.
