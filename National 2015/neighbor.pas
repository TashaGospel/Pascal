const fi = 'neighbor.inp';
      fo = 'neighbor.out';
      maxprime = 7368787;
      maxprimes = 500001;

var n,m,s,l,r:longint;
    p:array[0..maxprimes] of longint;

procedure input;
var f:text;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m,s);
    close(f);
    dec(s);
end;

procedure sieve;
var i,j,count:longint;
    isPrime:array[0..maxprime] of boolean;
begin
    count:=0;
    fillchar(isPrime,sizeof(isPrime),true);
    for i:=2 to maxprime do
        if isPrime[i] then
        begin
            inc(count);
            p[count]:=i;
            if count = m then break;
            for j:=i to maxprime div i do isPrime[i * j]:=false;
        end;
end;

function modl(a,b:longint):longint;
begin
    exit((a mod b + b) mod b);
end;

function forwards(x, prime:longint):longint;
begin
    if x = 0 then exit(modl(prime, n))
    else
    begin
        if x <= prime mod (n - 1) then x:=modl(x-1, n);
        x:=modl(x - (prime div (n - 1)), n);
        exit(x);
    end
end;

function backwards(x, prime:longint):longint;
begin
    if x = modl(prime,n) then exit(0)
    else
    begin
        x:=modl(x + (prime div (n - 1)), n);
        if x+1 <= prime mod (n - 1) then x:=modl(x+1,n);
        exit(x);
    end;
end;

procedure main;
var i:longint;
begin
    sieve;
    for i:=1 to m do s:=forwards(s,p[i]);
    l:=modl(s-1,n); r:=modl(s+1,n);
    for i:=m downto 1 do l:=backwards(l,p[i]);
    for i:=m downto 1 do r:=backwards(r,p[i]);
    inc(l); inc(r);
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,r,' ',l);
    close(f);
end;

begin
    input;
    main;
    output;
end.
