const fi = 'vratf.inp';
      fo = 'vratf.out';
      maxn = 100000000;

var n,k:longint;
    a:array[0..maxn] of longint;

procedure input;
var f:text;
begin
    assign(f,fi);
    reset(f);
    read(f,n,k);
    close(f);
end;

function main(i:longint):longint;
var tmp,res:longint;
begin
    if (i <= k) or ((i - k) mod 2 <> 0) then exit(1)
    else
    begin
        if (i <= maxn) and (a[i] <> 0) then exit(a[i]);
        tmp:=(i - k) div 2;
        res:=main(tmp) + main(tmp + k);
        if i <= maxn then a[i]:=res;
        exit(res);
    end;
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,main(n));
    close(f);
end;

begin
    input;
    output;
end.
