const fi = '16-40.inp';
      fo = '16-40.out';
      maxn = 10001;

var n,chosenCount,resCount:longint;
    adj,head,res,cur,chosen:array[0..maxn] of longint;

procedure input;
var f:text;
    i,j,tmp:longint;
begin
    assign(f,fi);
    reset(f);
    readln(f,n);
    j:=0;
    for i:=1 to n do
    begin
        read(f,tmp);
        while not seekeoln(f) do
        begin
            inc(j);
            read(f,adj[j]);
        end;
        head[i+1]:=j;
        readln(f);
    end;
    close(f);
end;

procedure check(p:longint);
begin
    if p > resCount then
    begin
        resCount:=p;
        res:=cur;
    end;
end;

procedure visit(c,p:longint);
var i,u:longint;
begin
    cur[p]:=c;
    inc(chosen[c]);
    if chosen[c] = 1 then inc(chosenCount);
    for i:=head[c]+1 to head[c+1] do
    begin
        u:=adj[i];
        inc(chosen[u]);
        if chosen[u] = 1 then inc(chosenCount);
    end;

    if chosenCount = n then check(p)
    else for i:=1 to n do if chosen[i] = 0 then visit(i,p+1);

    dec(chosen[c]);
    if chosen[c] = 0 then dec(chosenCount);
    for i:=head[c]+1 to head[c+1] do
    begin
        u:=adj[i];
        dec(chosen[u]);
        if chosen[u] = 0 then dec(chosenCount);
    end;
end;

procedure main;
var i:longint;
begin
    for i:=1 to n do
    begin
        chosenCount:=0;
        visit(i,1);
    end;
end;

procedure output;
var f:text;
    i:longint;
begin
    assign(f,fo);
    rewrite(f);
    for i:=1 to resCount do write(f,res[i],' ');
    close(f);
end;

begin
    input;
    main;
    output;
end.
