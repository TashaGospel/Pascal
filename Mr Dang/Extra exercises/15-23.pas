const fi = '15-23.inp';
      fo = '15-23.out';
      maxn = 1001;

var n,sum:longint;
    a:array[1..maxn] of longint;

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

procedure main;
var i,j,minPos:longint;
begin
    for i:=1 to n-1 do
    begin
        minPos:=1;
        for j:=2 to n-i do if a[minPos] + a[minPos+1] > a[j] + a[j+1] then minPos:=j;

        a[minPos]:=a[minPos] + a[minPos+1];
        sum:=sum+a[minPos];

        for j:=minPos+1 to n-i do a[j]:=a[j+1];
    end;        
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,sum);
    close(f);
end;

begin
    input;
    main;
    output;
end.
