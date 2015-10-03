const fi = 'robottrees.inp';
      fo = 'robottrees.out';
      maxn = 17;
      dx:array[1..4] of longint = (1, -1, 0, 0);
      dy:array[1..4] of longint = (0, 0, 1, -1);

var n,m,sx,sy,count,res:longint;
    a:array[0..maxn,0..maxn] of longint;
    b,path:array[0..maxn] of longint;

procedure input;
var f:text;
    i,j:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m,sx,sy);
    for i:=1 to n do
        for j:=1 to m do read(f,a[i,j]);
    close(f);
end;

procedure check;
begin
    if res < count then
    begin
        res:=count;
        path:=b;
    end;
end;

procedure main(x,y:longint);
var i,u,v:longint;
begin
    check;
    a[x,y]:=1;
    for i:= 1 to 4 do 
    begin
        u:=x+dx[i];
        v:=y+dy[i];
        if (u >= 1) and (u <= n) and (v >= 1) and (v <= m) and (a[u,v] <> 1) then
        begin
            inc(count);
            b[count]:=i;
            main(u,v);
            dec(count);
        end;
    end;
    a[x,y]:=0;
end;

procedure output;
var f:text;
    i:longint;
    cur:char;
begin
    assign(f,fo);
    rewrite(f);
    for i:=1 to res do
    begin
        case path[i] of
            1:cur:='N';
            2:cur:='B';
            3:cur:='T';
            4:cur:='D';
        end;
        write(f,cur);
    end;
    close(f);
end;

begin
    input;
    main(sx,sy);
    output;
end.
