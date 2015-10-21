const fi = 'ant.inp';
      fo = 'ant.out';
      maxs = 1001;
      maxc = 10000001;
      dx:array[1..4] of longint = (0,0,-1,1);
      dy:array[1..4] of longint = (-1,1,0,0);

type point = record
    x,y:longint;
    end;

var c,s,l,r:longint;
    a:array[-maxs..maxs,-maxs..maxs] of longint;
    q:array[1..maxc] of point;

procedure input;
var f:text;
    i,d1,d2:longint;
begin
    assign(f,fi);
    reset(f);
    read(f, c, s);
    for i:=1 to c do
    begin
        read(f,d1,d2);
        a[d1,d2]:=-1;
    end;
    close(f);
end;

procedure main;
var i,x,y,u,v:longint;
begin
    l:=1; r:=1; a[0,0]:=1;
    q[1].x:=0; q[1].y:=0;
    while l <= r do
    begin
        x:=q[l].x; y:=q[l].y;
        inc(l);
        for i:=1 to 4 do
        begin
            u:=x+dx[i];
            v:=y+dy[i];
            if (a[u,v] = 0) and (a[x,y] <= s) then
            begin
                inc(r);
                q[r].x:=u;
                q[r].y:=v;
                a[u,v]:=a[x,y] + 1;
            end;
        end;
    end;
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,r);
    close(f);
end;

begin
    input;
    main;
    output;
end.
