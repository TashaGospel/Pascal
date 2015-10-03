uses math;
const fi = 'svot.inp';
      fo = 'svot.out';
      maxn = 1001;

var days,subjects:longint;
    a,b,u:array[0..maxn,0..maxn] of longint;
    v:array[0..maxn] of longint;

procedure input;
var f:text;
    i,j:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,days,subjects);
    for i:=1 to days do 
        for j:=1 to subjects do read(f,a[j,i]);
    close(f);
    for i:=1 to days do
    begin
        for j:=1 to subjects do write(a[i,j], ' ');
        writeln;
    end;
    writeln;
end;

procedure main;
var i,j,k,tmp:longint;
begin
    for i:=1 to subjects do
        for j:=1 to days do
            for k:=0 to j do
            begin
                tmp:=b[i-1,j-k] + a[i,k]; 
                if b[i,j] < tmp then 
                begin
                    b[i,j]:=tmp;
                    u[i,j]:=k;
                end;
            end;
end;

procedure chosenPath;
var cur,i:longint;
begin
    cur:=days;
    for i:=subjects downto 1 do
    begin
        v[i]:=u[i,cur];
        cur:=cur-v[i];
    end;   
end;

procedure output;
var f:text;
    i:longint;
begin
    assign(f,fo);
    rewrite(f);
    writeln(f,b[subjects,days]);
    for i:=1 to subjects do writeln(f,i,' ',v[i]);
    close(f);
end;

begin
    input;
    main;
    chosenPath;
    output;
end.
