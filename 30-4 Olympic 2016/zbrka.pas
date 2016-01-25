uses math;
const fi = 'zbrka.inp';
      fo = 'zbrka.out';
      maxn = 1002;
      maxm = 10002;
      divider = 1000000007;

var n, m: longint;
    a:array[0..maxn, 0..maxm] of longint;

procedure input;
var f:text;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m);
    close(f);
end;

procedure main;
var i,j:longint;
begin
    for i:=0 to n do a[i,0]:=1;

    for i:=1 to n do
        for j:=1 to m do
        begin
            a[i,j]:= a[i,j-1] + a[i-1,j];
            if j >= i then dec(a[i,j], a[i-1,j-i]);
            a[i,j]:= a[i,j] mod divider;
        end;
{
            for k:=j downto max(j - i + 1, 0) do
                inc(a[i,j], a[i-1,k]);

    a[i,j] = a[i-1,j-0] + a[i-1,j-1] + ... + a[i-1,j-i+1];
    a[i,j-1] = a[i-1,j-1] + a[i-1,j-2] + ... + a[i-1,j-i];
    => a[i,j] - a[i,j-1] = a[i-1,j] - a[i-1,j-i];

    for i:=1 to n do
    begin
        for j:=1 to m do write(a[i,j],' ');
        writeln;
    end;
}
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f, a[n, m]);
    close(f);
end;

begin
    input;
    main;
    output;
end.
