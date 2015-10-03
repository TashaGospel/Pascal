const fi = 'doidau.inp';
      fo = 'doidau.out';
      maxn = 10001;

var n, u, res, resPos, curType:longint;
    a, up, down, trUp, trDown:array[0..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,u);
    for i:=1 to n do read(f,a[i]);
    close(f);
end;

procedure main;
var i,j:longint;
begin
    for i:=1 to n do
    begin
        up[i]:=1; down[i]:=1;
        for j:=i-1 downto 1 do
            if abs(a[i] - a[j]) >= u then
                if (a[i] > a[j]) and (up[i] < down[j] + 1) then
                begin
                    up[i]:=down[j] + 1;
                    trUp[i]:=j;
                end
                else if (down[i] < up[j] + 1) then
                begin
                    down[i]:=up[j] + 1;
                    trDown[i]:=j;
                end;

        if up[i] > res then
        begin
            res:=up[i];
            resPos:=i;
            curType:=1;
        end;

        if down[i] > res then
        begin
            res:=down[i];
            resPos:=i;
            curType:=0;
        end;

    end;
end;

function path:ansistring;
var res, tmp:ansistring;
    c:longint;
begin
    res:='';
    c:=resPos;
    while true do
    begin
        if curType = 1 then
        begin
            if c = 0 then exit(res);
            str(a[c],tmp);
            c:= trUp[c];
        end
        else
        begin
            if c = 0 then exit(res);
            str(a[c],tmp);
            c:= trDown[c];
        end;

        res:=tmp + ' ' + res;
        curType:= 1 - curType;
    end;
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    writeln(f,res);
    write(f,path);
    close(f);
end;

begin
    input;
    main;
    output;
end.
