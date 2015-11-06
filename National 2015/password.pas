uses math;
const fi = 'password.inp';
      fo = 'password.out';
      maxn = 100001;

var a,b:ansistring;
    n,m:longint;
    s:array[0..maxn] of longint;

procedure input;
var f:text;
begin
    assign(f,fi);
    reset(f);
    readln(f,a);
    read(f,b);
    close(f);
    n:=length(a); m:=length(b);
end;

procedure output(i,j:longint);
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,i,' ',j);
    close(f);
    halt;
end;

procedure main;
var i,j,s1,s2,tmp:longint;
begin
    i:=1;
    while (a[i] = b[i]) and (i < m) do inc(i);
    s1:=i;

    i:=0;
    while (a[n - i] = b[m - i]) and (m - i > s1) do inc(i);
    s2:=m - i;

    for i:=1 to n do s[i]:=s[i-1] + ord(a[i]) - 48;

    //writeln(s1,' ',s2);

    for i:=s1 downto 1 do
{for j:=min(i + 6,m) downto max(s2,i) do}
        for j:=s2 to min(i+6,m) do
        begin
            val(copy(b,i,j-i+1),tmp);
     //       writeln(i,' ',j,' ',tmp);
            if tmp = s[n - (m - j)] - s[i - 1] then output(i,n - (m -j));
        end;
end;

begin
    input;
    main;
end.
