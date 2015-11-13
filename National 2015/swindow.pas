uses math;
const fi = 'swindow.inp';
      fo = 'swindow.out';
      maxn = 2000001;
      
var t,p,s:ansistring;
    k,n,m:longint;
    res:int64;
    z:array[0..maxn] of longint;

procedure input;
var f:text;
begin
    assign(f,fi);
    reset(f);
    readln(f,t);
    readln(f,p);
    read(f,k);
    close(f);
    s:=p + '*' + t;
    n:=length(s);
    m:=length(p);
end;

procedure z_func;
var l,r,i:longint;
begin
    l:=1; r:=1;
    for i:=2 to n do
    begin
        if r >= i then
            z[i]:=min(z[i - l + 1], r - i +1);
        while (z[i] + i <= n) and (s[z[i]+1] = s[z[i] + i]) do inc(z[i]);
        if z[i] + i - 1 > r then
        begin
            l:=i;
            r:=z[i] + i - 1;
        end;
    end;
    z[1]:=n;
end;

procedure main;
var i,l,added:longint;
begin
    z_func;
    //writeln(s);
    //for i:=1 to n do write(z[i],' ');
    l:=m+1;
    for i:=m+2 to n - m + 1 do if z[i] = m then
    begin
    writeln(i - m - 1,' ',i + m - 1 - m - 1,'->',min(i + k - 1,n) - m - 1);
        added:=min(i + k - 1, n) - (i + m - 1) + 1;
        res:=res + added;
        //res:=res + min(k - m + 1;
      //writeln(res);
    //    write(i - k + m - 3);
    //    writeln(i-3,k,m);
        write(res,' ',l,' ',i - k + m,' ',(l - (i - k + m) + 1),' ');
        if l >= (i -k + m) then res:=res - min((l - (i - k + m) + 1),added);
        writeln(res);
        l:=i;
    end;
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    if k < length(p) then write(f,0)
    else write(f,res);
    close(f);
end;

begin
    input;
    main;
    output;
end.
