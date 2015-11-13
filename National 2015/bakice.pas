const fi = 'bakice.inp';
      fo = 'bakice.out';
      maxn = 10001;

type point = record
    x,y:longint;
    end;

var n,m,col,row,countB,countC,res:longint;
    b,c:array[1..maxn] of point;
    lowest,lowestPos:array[1..maxn] of longint;
    chosenB,chosenC:array[1..maxn] of boolean;

procedure input;
var f:text;
    i,j:longint;
    tmp:char;
begin
    assign(f,fi);
    reset(f);
    readln(f,row,col);
    for i:=1 to row do
    begin
        for j:=1 to col do
        begin
            read(f,tmp);
            if tmp = 'X' then
            begin
                inc(n);
                b[n].x:=i; b[n].y:=j;
            end
            else if tmp = 'L' then
            begin
                inc(m);
                c[m].x:=i; c[m].y:=j;
            end;
        end;
        readln(f);
    end;
    close(f);
end;

function distance(p1,p2:point):longint;
begin
    exit(sqr(p1.x - p2.x) + sqr(p1.y - p2.y));
end;

procedure main;
var i,j,cur,curPos,tmp,curChosen:longint;
begin
    while (countB < n) and (countC < m) do
    begin
        cur:=maxlongint;
        for i:=1 to n do if not chosenB[i] then
        begin
            lowest[i]:=maxlongint;
            for j:=1 to m do if not chosenC[j] then
            begin
                tmp:=distance(b[i],c[j]);
                if tmp < lowest[i] then
                begin
                    lowest[i]:=tmp;
                    lowestPos[i]:=j;
                    if tmp < cur then
                    begin
                        cur:=tmp;
                        curPos:=j;
                    end;
                end;
            end;
        end;
        
        //writeln(cur,' ',c[curPos].x,' ',c[curPos].y);
        curChosen:=0;
        for i:=1 to n do
            if (lowest[i] = cur) and (not chosenB[i])
               and (lowestPos[i] = curPos) then
            begin
                inc(curChosen);
                chosenB[i]:=true;
                inc(countB);
            end;
        chosenC[curPos]:=true;
        inc(countC);
        if curChosen >= 2 then inc(res);
    end;
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
