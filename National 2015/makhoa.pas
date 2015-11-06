uses math;
const fi = 'makhoa.inp';
      fo = 'makhoa.out';
      maxn = 301;

var n,k,res:longint;
    a,b,c:array[1..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,k);
    for i:=1 to n do read(f,a[i]);
    for i:=1 to n do read(f,b[i]);
    close(f);
    res:=maxlongint;
end;

procedure main;
var offset,i,j,cur,posi:longint;
begin
    for offset:=0 to n-1 do { Move the array. }
    begin
        for i:=1 to n do { Calculate array C - number of times to increase. }
        begin
            { posi: new position after moving. }
            posi:=(i + offset) mod n;
            if posi = 0 then posi:=n;
            if b[posi] >= a[i] then c[i]:=b[posi] - a[i]
            else c[i]:=k + 1 - (a[i] - b[posi]);
        end;

        for i:=1 to n do { Choose a position to increase-all. }
        begin
            cur:=c[i]+offset; { Increase-all c[i] times. }
            for j:=1 to n do { Increase-each other positions. }
                if c[i] <= c[j] then cur:=cur + c[j] - c[i]
                else cur:=cur + (k + 1 - c[i]) + c[j];
            res:=min(res,cur);
        end;
    end;
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,res);
    close(f);
end;

begin
    input;
    main;
    output;
end.
