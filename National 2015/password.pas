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
    if s1 = n then output(1,1);

    i:=0;
    while (a[n - i] = b[m - i]) and (m - i > s1) do inc(i);
    s2:=m - i;

 //   write(s1,s2);

    for i:=1 to n do s[i]:=s[i-1] + ord(a[i]) - 48;

    for i:=s1 downto max(s2-5,1) do
        for j:=0 to 5 do { i, i + j }
        begin
            if i + j > m then break;
            if i + j < s2 then continue;
            //writeln(i,' ',j + i);
            val(copy(b,i,j + 1),tmp);
            //write(s[n-m+i+j] - s[i-1]);
            if tmp = s[n- m + i+j] - s[i-1] then output(i,n-m+i+j);
        end;
end;

begin
    input;
    main;
end.
