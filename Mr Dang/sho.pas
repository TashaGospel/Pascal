const fi = 'sho.inp';
      fo = 'sho.out';
      maxn = 1001;
      whitesPerCol = 2;

var n, m:longint;
    a:array[0..maxn,0..maxn] of boolean; // rows
    c:array[0..maxn] of longint;
    chosen:array[0..maxn] of boolean;

function main:ansistring;
var count,i,j,minPos,minVal:longint;
    resArr:array[0..maxn] of longint;
    res,tmp:ansistring;
begin
    res:='';
    for count:=1 to m do
    begin
        minVal:=maxlongint;
        for i:=1 to n do if (c[i] > 0) and (c[i] < minVal) and (not chosen[i]) then
        begin
            minPos:=i;
            minVal:=c[i];
        end;

        if minVal = maxlongint then
            for i:=1 to n do if (c[i] > 0) and (c[i] < minVal)  then
            begin
                minPos:=i;
                minVal:=c[i];
            end;

        if minVal = maxlongint then exit('NO');
        chosen[minPos]:=true;

        j:=1;
        while not a[minPos,j] do inc(j);

        resArr[j]:=minPos;

        for i:=1 to n do if (a[i,j]) then
        begin
            a[i,j]:=false;
            dec(c[i]);
        end;
    end;

    for i:=1 to n do if not chosen[i] then exit('NO');

    for i:=1 to m do
    begin
        str(resArr[i],tmp);
        res:=res + tmp + ' ';
    end;

    exit(res);
end;

procedure parseFile;
var f,g:text;
    t,i,j,count:longint;
begin
    assign(f,fi);
    assign(g,fo);
    reset(f);
    rewrite(g);
    read(f,t);
    for j:=1 to t do
    begin
        fillchar(a,sizeof(a),0);
        fillchar(c,sizeof(c),0);
        fillchar(chosen,sizeof(chosen),false);
        read(f,n,m);
        for i:=1 to m do
            for count:=1 to whitesPerCol do
            begin
                read(f,t);
                inc(c[t]);
                a[t,i]:=true;
            end;
        writeln(g,main);
    end;
    close(f);
    close(g);
end;

begin
    parseFile;
end.
