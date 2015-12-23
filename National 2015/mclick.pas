const fi = 'mclick.inp';
      fo = 'mclick.out';
      maxn = 100001;

type win = record
    x1,y1,x2,y2,index:longint;
    end;

    arr = array[0..maxn] of win;

var n:longint;
    a:array[0..maxn] of win;
    b:array[0..maxn] of longint;

procedure input;
var f:text;
    i,r1,s1,r2,s2:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do with a[i] do
    begin
        read(f,r1,s1,r2,s2);
        x1:=r1; y1:=s2;
        x2:=r2; y2:=s1;
        index:=i;
    end;
    close(f);
end;

function cover(p1,p2:win):boolean;
begin
    exit((p1.x1 >= p2.x1) and (p1.y1 <= p2.y1)
     and (p1.x1 <= p2.x2) and (p1.y1 >= p2.y2));
end;

procedure main;
var i,j:longint;
begin
    for i:=1 to n do b[i]:=1;
    for i:=n downto 1 do
        for j:=i-1 downto 1 do if cover(a[j],a[i]) then
        begin
            inc(b[j],b[i]);
            break;
        end;
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,b[1]);
    close(f);
end;

begin
    input;
    main;
    output;
end.
