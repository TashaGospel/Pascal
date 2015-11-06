const fi = 'chiadoi.inp';
      fo = 'chiadoi.out';
      maxn = 33;

var n:longint;
    a,b:array[1..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do read(f,a[i]);
    close(f);
end;

{ Split the collection
  Build an array of the sums of all subcolls of coll 1.
  Build sums of all subcolls of coll 2, process each.
  Process: Choose the max but not greater then sum
  in subcolls1[i]. Calculate offset and compare with res. }

procedure buildSums;
var 

function binarySearch(l,r,x:longint):longint;
var res:longint;
begin
    res:=0;
    while l <= r do
    begin
        mid:=(l + r) div 2;
        if b[mid] <= x then
        begin
            res:=mid;
            l:=mid + 1;
        end
        else r:=mid - 1;
    end;
    exit(res);
end;

procedure main;
var
