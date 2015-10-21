uses math;
const fi = '15-19.inp';
      fo = '15-19.out';
      maxn = 1001;

var n,s,res:longint;
    b,c,m,num,tr:array[0..maxn] of longint;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,s,n);
    for i:=1 to n do read(f,c[i],m[i]);
    close(f);
end;

procedure main;
var i,j,k:longint;
    avail:array[0..maxn] of boolean;
begin
    b[0]:=1;
    for i:=1 to n do
    begin
        for j:=s downto 1 do
            for k:=1 to m[i] do
            begin
                if j >= c[i]*k then
                    b[j]:=b[j] + b[j-c[i]*k];

            end;
    end;
    writeln(b[s]);
end;    
{
procedure path;
var i:longint;
begin
    i:=s;
    while i <> 0 do
    begin
        inc(num[tr[i]]);
        i:=i-a[tr[i]];
    end;
end;
}

{procedure output;
var f:text;
    i:longint;
begin
    assign(f,fo);
    rewrite(f);
    writeln(f,b[s]);
    for i:=1 to n do write(f,num[i],' ');
    close(f);
    writeln;
    for i:=1 to s do write(b[i], ' ');
end;}

begin
    input;
    main;
    //path;
    //output;
end.
