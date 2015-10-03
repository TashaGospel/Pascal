uses math;
const fi = '15-15.inp';
      fo = '15-15.out';
      maxn = 1000;

var n,s:longint;
    a,t,tr:array[0..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,s);
    for i:=1 to n do read(f,a[i]);
    close(f);
end;
            
procedure main;
var i,j:longint;
begin
    t[0]:=1;
    for i:=1 to n do
        for j:=s downto 1 do
            if (t[j] = 0) and (t[j-a[i]] = 1) then 
            begin
                t[j]:=1;
                tr[j]:=j-a[i];
            end;
end;

function path(i:longint):string;
var tmp:string;
begin
    str(i - tr[i],tmp);
    if tr[i] = 0 then exit(tmp + ' ')
    else exit(path(tr[i]) + tmp + ' ');
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    if t[s] = 1 then write(f,path(s))
    else write(f,-1);
    close(f);
end;

begin
    input;
    main;
    output;
end.
