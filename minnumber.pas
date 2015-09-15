uses math;
const fi = 'minnumber.inp';
      fo = 'minnumber.out';
      maxn = 1000;

var n:longint;
    s,res:string;

procedure input;
var f:text;
    tmp:char;
begin
    assign(f,fi);
    reset(f);
    readln(f,n);
    while not eof(f) do
    begin
        read(f,tmp);
        if ('0' <= tmp) and (tmp <= '9') then
            s:=s+tmp;
    end;
    close(f);
end;

procedure main;
var len,i,curNum,minNum,minPos:longint;
begin
    len:=0;
    while (len < n) do
    begin
        minNum:=10;
        for i:=1 to length(s) - (n-len) + 1 do
        begin
            curNum:=ord(s[i]) - 48;
            if minNum > curNum then
            begin
                minNum:=curNum;
                minPos:=i;
            end;
        end;
        res:=res+s[minPos];
        delete(s,1,minPos);
        inc(len);
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
