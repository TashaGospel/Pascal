uses math;
const fi = 'xauTD.inp';
      fo = 'xauTD.out';
      maxn = 1000;

var a,b:ansistring;

procedure input;
var f:text;
begin
    assign(f,fi);
    reset(f);
    readln(f,a);
    read(f,b);
    close(f);
end;

function main(l1,r1,l2,r2:longint):boolean;
var mid1,mid2:longint;
begin
    if ((r1 - l1 + 1) mod 2 <> 0) or ((r2 - l2 + 1) mod 2 <> 0) then exit(false);
    if (l1 - r1 > 1) then
    begin
        mid1:=(l1 + r1) div 2;
        mid2:=(l2 + r2) div 2;
        exit((main(l1,mid1,l2,mid2) and main(mid1+1,r1,mid2+1,r2))
             or (main(l1,mid1,mid2+1,r2) and main(mid1+1,r1,l2,mid2)));    
    end
    else exit(((a[l1] = b[r2]) and (a[r1] = b[l2]))
             or ((a[l1] = b[r1])) and (a[l2] = b[r2]));
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    if main(1,length(a),1,length(b)) then write(f,'YES')
    else write(f,'NO');
    close(f);
end;

begin
    input;
    output;
end.
