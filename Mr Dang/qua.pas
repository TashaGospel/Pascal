const fi = 'qua.inp';
      fo = 'qua.out';
      maxn = 1001;

var n, m, resCount:longint;
    adj,head,b,res:array[0..maxn] of longint;
    chosen:array[0..maxn] of boolean;

procedure input;
var f:text;
    i,j,t:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m);
    for i:=1 to n do
    begin
        read(f,t);
        for j:=1 to t do read(f,adj[head[i]+j]);
        head[i+1]:=head[i]+t;
    end;
    close(f);
end;

procedure check;
var i,count:longint;
begin
    count:=0;
    for i:=1 to n do if b[i] <> 0 then inc(count);
    if count <= resCount then exit;
    resCount:=count;
    res:=b;
end;

procedure visit(c:longint);
var i,u:longint;
begin
    for i:=head[c] + 1 to head[c+1] do if not chosen[adj[i]] then
    begin
        u:=adj[i];
        b[c]:=u;
        chosen[u]:=true;
        if c < n then visit(c+1)
        else check;
        b[c]:=0;
        chosen[u]:=false;
    end;
    if c < n then visit(c+1)
    else check;
end;

procedure output;
var f:text;
    i:longint;
begin
    assign(f,fo);
    rewrite(f);
    writeln(f,resCount);
    for i:=1 to n do if res[i] <> 0 then writeln(f,i,' ',res[i]);
    close(f);
end;

begin
    input;
    visit(1);
    output;
end.
