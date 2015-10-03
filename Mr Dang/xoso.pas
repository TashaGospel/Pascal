const fi = 'xoso.inp';
      fo = 'xoso.out';
      maxn = 101;

var n,m,k:longint;
    res:array[0..maxn] of longint;
    b:array[-1..maxn] of longint;
    ok:array[0..maxn] of boolean;
    a:array[0..maxn,0..maxn] of longint;

procedure input;
var f:text;
    i,j:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m,k);
    for i:=1 to n do
    begin
        for j:=1 to k do read(f,a[i,j]);
        read(f,res[i]);
    end;
    close(f);
end;

procedure output;
var f:text;
    procedure check;
    var i,j,curRes:longint;
    begin
        fillchar(ok,sizeof(ok),false);
        for i:=1 to k do ok[b[i]]:=true;
        for i:=1 to n do
        begin
            curRes:=0;
            for j:=1 to k do if ok[a[i,j]] then inc(curRes);
            if curRes <> res[i] then exit;
        end;
        for i:=1 to k do write(f,b[i],' ');
        writeln(f);
    end;

    procedure main(c:longint);
    var i:longint;
    begin
        if c <= k then
            for i:=b[c-1]+1 to m-k+c do
            begin
                b[c]:=i;
                main(c+1);
            end
        else check;
    end;
begin
    assign(f,fo);
    rewrite(f);
    main(1);
    close(f);
end;

begin
    input;
    output;
end.
