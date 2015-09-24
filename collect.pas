const fi = 'collect.inp';
      fo = 'collect.out';
      maxn = 1001;
      maxval = 4;

var k,b,c,e,b0,c0,d0,res:longint;
    d:array[0..maxval,0..maxval,0..maxval,0..maxval,0..maxval,0..maxval] of longint;
    a:array[0..maxval,0..maxval,0..maxval] of boolean;
    
procedure input;
var f:text;
    d1,d2,d3,d4,d5,d6,ib,ic,id:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,k,b,c,e,b0,c0,d0);
    while not seekeof(f) do
    begin
        read(f,d1,d2,d3,d4,d5,d6);
        if (b+d4-d1>=b0) and (c+d5-d2>=c0) and (e+d6-d3>=d0) and
           (b+d4-d1<=4) and (c+d5-d2<=4) and (e+d6-d3<=4) then 
            writeln(d1,d2,d3,d4,d5,d6,b+d4-d1,c+d5-d2,e+d6-d3);
        for ib:=0 to maxval do
        for ic:=0 to maxval do
        for id:=0 to maxval do
        begin
            if (ib-d1 >= 0) and (ib+d4-d1 <= maxval) and
               (ic-d2 >= 0) and (ic+d5-d2 <= maxval) and
               (id-d3 >= 0) and (id+d6-d3 <= maxval) then 
                d[ib,ic,id,ib+d4-d1,ic+d5-d2,id+d6-d3]:=1;
{if (ib = b) and (ic = c) and (id = e) then
            if (ib+d4-d1 = 4) and (ic+d5-d2 = 4) and (id+d6-d3 = 3) then
                    writeln(d[b,c,e,ib+d4-d1,ic+d5-d2,id+d6-d3]);}

        end;
    end;
    close(f);
end;

procedure main;
var kb,kc,kd,ib,ic,id,jb,jc,jd:longint;
begin
    for kb:=0 to maxval do
    for kc:=0 to maxval do
    for kd:=0 to maxval do 
        for ib:=0 to maxval do
        for ic:=0 to maxval do
        for id:=0 to maxval do 
            for jb:=0 to maxval do
            for jc:=0 to maxval do
            for jd:=0 to maxval do
            begin
                if d[ib,ic,id,kb,kc,kd] = 0 then d[ib,ic,id,kb,kc,kd]:=k+1;
                if d[kb,kc,kd,jb,jc,jd] = 0 then d[kb,kc,kd,jb,jc,jd]:=k+1;
                if d[ib,ic,id,jb,jc,jd] = 0 then d[ib,ic,id,jb,jc,jd]:=k+1;

                if (kb < b0) or (kc < c0) or (kd < d0) then 
                if (ib < b0) or (ic < c0) or (id < d0) then
                begin

                if (kb = 4) and (kc = 1) and (kd = 1) and (ib = 4) 
                and (ic = 0) and (id = 1) then begin end;


                    if d[ib,ic,id,jb,jc,jd] > d[ib,ic,id,kb,kc,kd] + d[kb,kc,kd,jb,jc,jd] then
                        d[ib,ic,id,jb,jc,jd]:= d[ib,ic,id,kb,kc,kd] + d[kb,kc,kd,jb,jc,jd];

                    if (jb >= b0) and (jc >= c0) and (jd >= d0) and (d[b,c,e,jb,jc,jd] <= k) 
                       and (not a[jb,jc,jd]) and (d[b,c,e,jb,jc,jd] > 0) then
                    begin
                        a[jb,jc,jd]:=true;
                        inc(res);
                        //writeln(jb,jc,jd,d[b,c,e,jb,jc,jd]);
                    end;

                end;
            end;           
end;

procedure output;
var f:text;
    d1,d2,d3:longint;
begin
    assign(f,fo);
    rewrite(f);
    if res = 0 then write(f,-1)
    else
    begin
        writeln(f,res);
        for d1:=b0 to maxval do
        for d2:=c0 to maxval do
        for d3:=d0 to maxval do
            if d[b,c,e,d1,d2,d3] <= k then writeln(f,d1,' ',d2,' ',d3,' ',d[b,c,e,d1,d2,d3]);
    end;
    close(f);
end;

begin
    input;
    main;
    output;
end.
