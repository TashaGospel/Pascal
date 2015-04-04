const fi = 'caykhe.inp';
      fo = 'caykhe.out';
      maxn = 100;
var m,n,number:longint;
    a,b:array[1..maxn] of longint;
    c:array[0..maxn,0..maxn] of longint;
    x:array[1..maxn] of boolean;

procedure input;
var f:text;
    i:longint;
begin
        assign(f,fi);
        reset(f);
        readln(f,n,m);
        for i:=1 to n do readln(f,a[i],b[i]);
        close(f);
        fillchar(c,sizeof(c),0);
        fillchar(x,sizeof(x),false);
end;

procedure main;
var i,j:longint;
begin
        for i:=1 to n do
        for j:=1 to m do
        if (j-b[i] <0) or (c[i-1,j-b[i]]+a[i] <= c[i-1,j]) then c[i,j]:=c[i-1,j]
        else c[i,j]:= c[i-1,j-b[i]]+a[i];
end;

{procedure trace;
var i,j:longint;
begin
        i:=n;j:=m;
        repeat
                if (c[i-1,j-b[i]] < c[i,j]) and (c[i-1,j] <> c[i,j]) then
                begin
                        x[i]:=true;
                        dec(i);
                        j:=j-b[i+1];
                        inc(number);
                end
                else dec(i);
        until i = 0;
end;}

procedure output;
var f:text;
    i:longint;
begin
        assign(f,fo);
        rewrite(f);
        write(f,c[n,m]);
        {write(f,number,' ');
        for i:=1 to n do if x[i] then write(f,i,' ');}
        close(f);
end;

begin
        input;
        main;
        {trace;}
        output;
end.



