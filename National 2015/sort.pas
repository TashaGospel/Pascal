uses math;
const fi = 'sort.inp';
      fo = 'sort.out';
      maxn = 10000;

var n,res:longint;
    a,b,c:array[0..maxn] of longint;

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
        inc(c[a[i]]);
    end;
    close(f);
    inc(c[2],c[1]);
    c[3]:=n;
end;

function isInRange(i,rangeNum:longint):boolean;
begin
    exit((i > c[rangeNum-1]) and (i <= c[rangeNum]));
end;

procedure swap(var i,j:longint);
var tmp:longint;
begin
    tmp:=i;
    i:=j;
    j:=tmp;
end;

procedure main;
var i,j,count:longint;
begin
    count:=0;
    for i:=1 to n do if not isInRange(i,a[i]) then
    begin
        inc(count);
        b[count]:=a[i];
    end
    else for j:=a[i] to 3 do dec(c[j]);

    for i:=1 to c[3] do
        for j:=i+1 to c[3] do
            if (b[i] > b[j]) and (isInRange(i,b[j]) or isInRange(j,b[i])) then
            begin
                inc(res);
                swap(b[i],b[j]);
            end;
    //for i:=1 to c[3] do writeln(b[i]);
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
