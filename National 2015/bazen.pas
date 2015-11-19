const fi = 'bazen.inp';
      fo = 'bazen.out';
      edge = 250;
      size = (edge * edge) / 2;

type point = record
    x,y:real;
    end;

var d,res:point;

procedure input;
var f:text;
begin
    assign(f,fi);
    reset(f);
    read(f,d.x,d.y);
    close(f);
end;

procedure main;
begin
    if (d.x = 0) and (d.y = 0) then
    begin
        res.x:=125;
        res.y:=125;
    end
    else if d.y = 0 then
    begin
        res.x:=0;
        res.y:=size / d.x;
        if res.y > edge then 
        begin
            res.y:=size / (edge - d.x);
            res.x:=edge - res.y;
        end;
    end
    else if d.x = 0 then
    begin
        res.y:=0;
        res.x:=size / d.y;
        if res.x > edge then 
        begin
            res.x:=size / (edge - d.y);
            res.y:=edge - res.x;
        end;
    end
    else
    begin
        res.x:=edge - size / d.y;
        res.y:=0;
        if res.x < 0 then
        begin
            res.y:=edge - size / d.x;
            res.x:=0;
        end;
    end;
end;

procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    write(f,res.x:0:2,' ',res.y:0:2);
    close(f);
end;

begin
    input;
    main;
    output;
end.
