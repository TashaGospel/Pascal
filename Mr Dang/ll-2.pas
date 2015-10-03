uses math;
const fi = 'll-2.inp';
      fo = 'll-2.out';
      maxn = 1001;
      maxval = 8640000;

type task = record
    u,v:longint;
    end;

var n,p,q,r,s:longint;
    a:array[0..maxval+1] of boolean;
    task1,task2:task;

procedure input;
var f:text;
    i,j,d1,d2:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do 
    begin
        read(f,d1,d2);
        for j:=d1 to d2 do a[j]:=true;
    end;
    read(f,p,q,r,s);
    close(f);
    if not a[maxval] then a[maxval+1]:=true;
end;

function task3:boolean;
var i:longint;
begin
    for i:=p to q do if not a[i] then exit(false);
    exit(true);
end;


function task4:boolean;
var i:longint;
begin
    for i:=r to s do if a[i] then exit(false);
    exit(true);
end;

procedure main;
var i,start1,start2:longint;
begin
    start1:=-1; start2:=-1;
    for i:=0 to maxval+1 do
        if a[i] then
        begin
            if start1 =-1  then start1:=i;
            if start2 <> -1 then 
            begin
                if (i - start2) > (task2.v - task2.u + 1) then
                begin
                    task2.u:=start2;
                    task2.v:=i-1;
                end;
                start2:=-1;
            end;
        end
        else
        begin
            if start2 = -1 then start2:=i;
            if start1 <> -1 then 
            begin
                if (i - start1) > (task1.v - task1.u + 1) then
                begin
                    task1.u:=start1;
                    task1.v:=i-1;
                end;
                start1:=-1;
            end;
        end
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    writeln(f,task3);
    writeln(f,task4);
    writeln(f,task1.u,' ',task1.v);
    write(f,task2.u,' ',task2.v);
    close(f);
end;

begin 
    input;
    main;
    output;
end. 
