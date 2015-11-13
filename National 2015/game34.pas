uses math;
const fi = 'game34.inp';
      fo = 'game34.out';
      n = 12;
      dx:array[1..17] of byte = (1,2,3,1,2,3,4,8,7,6,8,7,6,5,9,10,11);
      dy:array[1..17] of byte = (2,3,4,8,7,6,5,7,6,5,9,10,11,12,10,11,12);

var a:array[1..n,1..n] of longint;
    state,degree:array[1..17] of longint;
    sum,s:int64;

procedure addEdge(x,y:longint; var f:text);
var v:longint;
begin
    read(f,v);
    sum:=sum + v;
    if v <> 0 then a[x,y]:=trunc(ln(v)/ln(2)) + 1
    else a[x,y]:=0;
    degree[x]:=degree[x] + a[x,y];
    degree[y]:=degree[y] + a[x,y];
end;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    for i:=1 to 17 do addEdge(dx[i],dy[i],f);
    close(f);
    s:=maxlongint;
    //for i:=1 to 12 do write(degree[i],' ');
end;

procedure check;
var i,curS,oddCount:longint;
begin
    oddCount:=0;
    for i:=1 to 12 do if odd(degree[i]) then inc(oddCount);
    if oddCount <= 2 then
    begin
        curS:=0;
        for i:=1 to 17 do if state[i] = 0 then inc(curS);
        s:=min(curS,s);
//        write(s, ' ');
    end;
end;

procedure recur(c:longint);
var i:longint;
begin
    if c > 17 then check
    else for i:=0 to 1 do
    begin
        state[c]:=i;
        if (a[dx[c],dy[c]] = 0) and (i = 0) then continue;
        if state[c] = 0 then
        begin
            dec(degree[dx[c]]);
            dec(degree[dy[c]]);
        end;
        recur(c+1);
        if state[c] = 0 then
        begin
            inc(degree[dx[c]]);
            inc(degree[dy[c]]);
        end;
    end;
end;

procedure main;
begin
{
    for i:=1 to 12 do write(degree[i],' ');
    for i:=1 to 17 do state[i]:=1;
    state[3]:=0;
    dec(degree[dx[3]]);
    dec(degree[dy[3]]);
    check;
    inc(degree[dx[3]]);
    inc(degree[dy[3]]);
}
    
    
    recur(1);
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,sum - s);
    close(f);
end;

begin
    input;
    main;
    output;
end.
