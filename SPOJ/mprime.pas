const fi = 'mprime.inp';
      fo = 'mprime.out';
      
var k:longint;
    curNum, res:int64;

procedure input;
var f:text;
begin
    assign(f,fi);
    reset(f);
    read(f,k);
    close(f);
    curNum:=1;
end;

function isPrime(c:int64):boolean;
var i:longint;
begin
    for i:=2 to trunc(sqrt(c)) do if c mod i = 0 then exit(false);
    exit(true);
end;

function getNextPrime:int64;
begin
    inc(curNum);
    while not isPrime(curNum) do inc(curNum);
    exit(curNum);
end;

procedure main;
var count:longint;
    d1,d2:int64;
    s1,s2:string;
begin
    count:=0;
    while count < k do
    begin
        d1:=getNextPrime;
        d2:=getNextPrime;
        str(d1,s1); str(d2,s2);
        val(s1+s2,res);
        if isPrime(res) then inc(count);
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
