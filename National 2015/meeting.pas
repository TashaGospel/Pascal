const fi = 'meeting.inp';
      fo = 'meeting.out';
      maxn = 1001;

type num = record
    v,vertex:longint;
    end;

var n,curSum,count,sum:longint;
    a:array[0..maxn,0..maxn] of boolean;
    chosen,s,chosenRes:array[0..maxn] of boolean;
    b:array[0..maxn] of num;
    res:array[-1..1,1..maxn] of longint;
    resCount:array[-1..1] of longint;
    tr,countSide:array[0..maxn] of longint;

procedure input;
var f:text;
    d1,d2:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    while not seekeof(f) do
    begin
        read(f,d1,d2);
        a[d1,d2]:=true;
        a[d2,d1]:=true;
    end;
    close(f);
end;

procedure visit(c,side:longint);
var i:longint;
begin
    curSum:=curSum + side;
    chosen[c]:=true;
    for i:=1 to n do if a[c,i] and (not chosen[i]) then visit(i,-side);
end;

procedure visit2(c,side:longint);
var i:longint;
begin
    chosen[c]:=true;
    inc(resCount[side]);
    res[side,resCount[side]]:=c;
    for i:=1 to n do if a[c,i] and (not chosen[i]) then visit2(i,-side);
end;
    
procedure main;
var i,j:longint;
begin
    for i:=1 to n do if not chosen[i] then
    begin
        curSum:=0;
        visit(i,1);
        inc(count);
        if curSum < 0 then
        begin
            curSum:= -curSum;
            countSide[count]:=-1
        end
        else countSide[count]:=1;
        b[count].v:=curSum;
        b[count].vertex:=i;
        inc(sum,curSum);
    end;

    //for i:=1 to count do write(b[i].v);

    s[0]:=true;
    for i:=1 to count do if b[i].v <> 0 then
    begin
        for j:= sum div 2 downto b[i].v do if (s[j-b[i].v]) and (not s[j]) then
        begin
            s[j]:=true;
            tr[j]:=i;
        end;
    end;

    //for i:=1 to sum div 2 do write(tr[i]);

    for i:=sum div 2 downto 0 do if s[i] then break;
    //write(i);
    while i <> 0 do
    begin
        chosenRes[tr[i]]:=true;
        i:=i - b[tr[i]].v;
    end;

    //for i:=1 to count do write(chosenRes[i]);

    fillchar(chosen,sizeof(chosen),false);

    for i:=1 to count do
    begin
        //writeln(b[i].vertex,' ',countSide[i]);
        if chosenRes[i] then visit2(b[i].vertex,countSide[i])
        else visit2(b[i].vertex,-countSide[i]);
    end;
end;

procedure output;
var f:text;
    i:longint;
begin
    assign(f,fo);
    rewrite(f);
    writeln(f,resCount[1],' ',resCount[-1]);
    for i:=1 to resCount[1] do write(f,res[1,i],' ');
    writeln(f);
    for i:=1 to resCount[-1] do write(f,res[-1,i],' ');
    close(f);
end;

begin
    input;
    main;
    output;
end.
