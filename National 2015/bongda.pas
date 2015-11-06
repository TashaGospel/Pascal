const fi = 'bongda.inp';
      fo = 'bongda.out';
      maxn = 1001;

type pnt = ^node;
     node = record
        index:longint;
        next:pnt;
     end;

     vertex = record
        count:longint;
        next:pnt;
     end;

var n:longint;
    a:array[1..maxn] of vertex;
    c,d,tr:array[1..maxn] of longint;
    chosen:array[1..maxn] of boolean;

procedure addNode(var p:pnt; x:longint);
var v:pnt;
begin
    v:=p;
    if p = nil then
    begin
        new(p);
        p^.index:=x;
        p^.next:=nil;
    end
    else
    begin
        while v^.next <> nil do v:=v^.next;
        new(v^.next);
        v^.next^.index:=x;
        v^.next^.next:=nil;
    end;
end;

procedure deleteNode(p:pnt);
begin
    if p = nil then exit;
    if p^.next <> nil then deleteNode(p^.next);
    dec(a[p^.index].count);
end;

procedure input;
var f:text;
    i,j:longint;
    tmp:char;
begin
    assign(f,fi);
    reset(f);
    readln(f,n);
    for i:=1 to n do
        for j:=1 to n+1 do
        begin
            read(f,tmp);
            if tmp = '1' then
            begin
                addNode(a[i].next,j);
                inc(a[j].count);
            end;
        end;

    close(f);
end;

procedure checkDistance(x:longint);
var p:pnt;
begin
    p:=a[c[x]].next;
    while p <> nil do
    begin
        if d[p^.index] < d[c[x]] + 1 then
        begin
            d[p^.index]:= d[c[x]] + 1;
            tr[p^.index]:=c[x];
        end;
        p:=p^.next;
    end;
end;

procedure main;
var cnt,i:longint;
begin
    cnt:=0;
    while cnt < n do
    begin
        for i:=1 to n do if (not chosen[i]) and (a[i].count = 0) then
        begin
            deleteNode(a[i].next);
            chosen[i]:=true;
            inc(cnt);
            c[cnt]:=i;
        end;
    end;

    for i:=1 to n do checkDistance(i);
end;

function path(i:longint):ansistring;
var tmp:string;
begin
    str(i,tmp);
    if tr[i] = 0 then exit(tmp + ' ')
    else exit(path(tr[i]) + tmp + ' ');
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    if d[c[n]] <> n - 1 then write(f,-1)
    else write(f,path(c[n]));
    close(f);
end;

begin
    input;
    main;
    output;
end.
