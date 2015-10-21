uses math;
const fi = 'minstr.inp';
      fo = 'minstr.out';
      maxn = 201;

var s1,s2:string;
    n,m:longint;
    a:array[1..maxn,1..maxn] of longint;

procedure input;
var f:text;
begin
    assign(f,fi);
    reset(f);
    readln(f,s1);
    read(f,s2);
    close(f);
    n:=length(s1);
    m:=length(s2);
end;

procedure main;
var i,j:longint;
begin
    for i:=n downto 1 do
        for j:=m downto 1 do
            if s1[i] = s2[j] then a[i,j]:=a[i+1,j+1] + 1
            else a[i,j]:=max(a[i+1,j], a[i,j+1]);
end;

function path(i,j:longint):string;
var num1,num2:longint;
    str1,str2:string;
begin
    if (i > n) or (j > m) then exit('');
    if s1[i] = s2[j] then
        exit(s1[i] + path(i+1,j+1))
    else if a[i+1,j] = a[i,j+1] then
    begin
        str1:=path(i+1,j);
        str2:=path(i,j+1);
        val(str1,num1);
        val(str2,num2);
        if num1 <= num2 then exit(str1)
        else exit(str2)
    end
    else if a[i+1,j] > a[i,j+1] then
        exit(path(i+1,j))
    else exit(path(i,j+1));
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    if a[1,1] = 0 then write(f,-1) else write(f,path(1,1));
    close(f);
end;

begin
    input;
    main;
    output;
end.
