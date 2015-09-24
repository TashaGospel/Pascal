const fi = 'dautu.inp';
      fo = 'dautu.out';
      maxn = 1000;

var n,m:longint;
    a,b,u:array[0..maxn,0..maxn] of longint;

procedure input;
var f:text;
    i,j:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,m,n);
    for i:=1 to m do
        for j:=1 to n do read(f,a[j,i]);
    close(f);
end;

procedure main;
var i,j,k,tmp:longint;
begin
    for i:=1 to n do
        for j:=1 to m do
            for k:=0 to j do 
            begin
                tmp:=b[i-1,j-k] + a[i,k];
                if tmp > b[i,j] then
                begin
                    b[i,j]:=tmp;
                    u[i,j]:=k;
                end;
            end;
end;

function chosenPath(i,j:longint):string;
var tmp:string;
begin
    if (i <= 0) or (j < 0) then exit('');
    begin
        str(u[i,j],tmp);
        exit(chosenPath(i-1,j-u[i,j]) + tmp + ' ');
    end;
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    writeln(f,b[n,m]);
    write(f,chosenPath(n,m));
    close(f);
end;

begin
    input;
    main;
    output;
end.           
