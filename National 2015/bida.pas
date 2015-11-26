const fi = 'bida.inp';
      fo = 'bida.out';
      maxn = 100001;

var n:longint;
    a:array[0..maxn] of longint;
    b:array[0..maxn] of boolean;

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do read(f,a[i]);
    close(f);
end;

function main:boolean;
var i,cur:longint;
begin
    b[0]:=true;
    b[a[1]]:=true;
    cur:=a[1];
    for i:=2 to n do
    begin
        if a[i] > a[i-1] then cur:=a[i]
        else
        begin
            while b[cur] do dec(cur);
            if cur <> a[i] then exit(true);
        end;
        b[a[i]]:=true;
    end;
    exit(false);
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    if main then write(f,'YES') else write(f,'NO');
    close(f);
end;

begin
    input;
    output;
end.
