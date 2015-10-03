uses math;
const fi = 'apples.inp';
      fo = 'apples.out';
      maxn = 1000;

var n,width,ship,res:longint;

procedure mov(position:longint);
begin
    if (ship <= position) and (position <= ship + width - 1) then exit;
    if position < ship then
    begin
        res:=res+(ship - position);
        ship:=position;
    end
    else
    begin
        res:=position - ship - width + 1;
        ship:=position - width + 1;
    end;
end;

procedure input;
var f:text;
    num,i,tmp:longint;
begin
    ship:=1;
    assign(f,fi);
    reset(f);
    read(f,n,width,num);
    for i:=1 to num do
    begin
        read(f,tmp);
        mov(tmp);
    end;        
    close(f);
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,res);
    close(f);
end;

begin
    input;
    output;
end.
