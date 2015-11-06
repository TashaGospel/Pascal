const fi = 'key.inp';
      fo = 'key.out';
      maxn = 100001;
      alpha = 26;

var n,num:longint;
    a:array[0..alpha,0..alpha] of boolean;
    chosen,inStack,sorted:array[0..alpha] of boolean;
    s:array[0..maxn] of string;
    b:array[0..alpha] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    readln(f,n);
    for i:=1 to n do readln(f,s[i]);
    close(f);
    num:=alpha;
end;

procedure output(isCyclic:boolean);
var f:text;
    i:longint;
begin
    assign(f,fo);
    rewrite(f);
    if isCyclic then write(f,'No solution')
    else for i:=1 to alpha do write(f,char(b[i] + 96));
    close(f);
    halt;
end;

procedure visit(c:longint);
var i:longint;
begin
    chosen[c]:=true;
    inStack[c]:=true;
    for i:=1 to alpha do if a[c,i] then
        if inStack[i] then output(true)
        else if (not chosen[i]) then visit(i);
    inStack[c]:=false;
    b[num]:=c;
    dec(num);
end;

procedure main;
var i,j:longint;
begin
    for i:=1 to 100 do
        for j:=2 to n do if (s[j-1][i] <> '') and (s[j][i] <> '') then
        begin
            if (s[j-1][i] <> s[j][i]) and (not sorted[j]) then 
            begin
                a[ord(s[j-1][i]) - 96,ord(s[j][i]) - 96]:=true;
                sorted[j]:=true;
            end;
        end;

    for i:=alpha downto 1 do if not chosen[i] then visit(i);
end;

begin
    input;
    main;
    output(false);
end.
