const fi = 'hoahoc.inp';
      fo = 'hoahoc.out';
      maxn = 1001;
      
var s:ansistring;
    stackCount,res:longint;
    stack:array[0..maxn] of longint;

procedure input;
var f:text;
begin
    assign(f,fi);
    reset(f);
    read(f,s);
    close(f);
end;

procedure push(c:longint);
begin
    inc(stackCount);
    stack[stackCount]:=c;
end;

function pop:longint;
begin
    dec(stackCount);
    exit(stack[stackCount + 1]);
end;

function isEmpty:boolean;
begin
    exit(stackCount = 0);
end;

function weight(c:char):longint;
begin
    if c = 'C' then exit(12)
    else if c = 'O' then exit(16)
    else if c = 'H' then exit(1)
    else if c = '(' then exit(-1)
    else if c = ')' then exit(-2);
end;

procedure main;
var i,sum,brackets,tmp:longint;
begin
    for i:=1 to length(s) do
    begin
        if ('2' <= s[i]) and (s[i] <= '9') then
        begin
            sum:=0;
            brackets:=0;
            repeat
                tmp:=pop;
                if tmp = -1 then dec(brackets)
                else if tmp = -2 then inc(brackets)
                else inc(sum,tmp);
            until brackets = 0;
            push(sum * (ord(s[i]) - 48));
        end
        else push(weight(s[i]));
    end;

    while not isEmpty do
    begin
        tmp:=pop;
        if tmp > 0 then inc(res,tmp);
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
