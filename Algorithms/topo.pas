const fi = 'topo.inp';
      fo = 'topo.out';
      maxn = 1001;

type pnt=^node;
    
    node = record
    index:longint;
    next:pnt;
    end;

    point = record
    count:longint;
    next:pnt;
    end;

var n,m:longint;
    a:array[0..maxn] of point;
    chosen:array[0..maxn] of boolean;
    res:array[0..maxn] of longint;

procedure addNode(var p:pnt; x:longint);
var q:pnt;
begin
    if p = nil then
    begin
        new(p);
        p^.next:=nil;
        p^.index:=x;
    end
    else
    begin
        q:=p;
        while q^.next <> nil do q:=q^.next;
        new(q^.next);
        q^.next^.index:=x;
        q^.next^.next:=nil;
    end
end;

procedure deleteNode(p:pnt);
begin
    if p = nil then exit;
    if p^.next <> nil then deleteNode(p^.next);
    dec(a[p^.index].count);
    dispose(p)
end;

procedure input;
var f:text;
    i,d1,d2:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m);
    for i:=1 to m do
    begin
        read(f,d1,d2);
        addNode(a[d1].next,d2);
        inc(a[d2].count);
    end;
    close(f);
end;

procedure main;
var cnt,i:longint;
begin
    cnt:=0;
    while cnt < n do
    begin
        for i:=1 to n do if (a[i].count = 0) and not chosen[i] then
        begin
            inc(cnt);
            res[cnt]:=i;
            chosen[i]:=true;
            deleteNode(a[i].next);
        end;
    end;
end;

procedure output;
var f:text;
    i:longint;
begin
    assign(f,fo);
    rewrite(f);
    for i:=1 to n do write(f,res[i],' ');
    close(f);
end;

begin
    input;
    main;
    output;
end.
