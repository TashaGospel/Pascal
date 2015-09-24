const fi = 'army.inp';
      fo = 'army.out';
      maxn = 21;

type edge = record
    x1,y1,x2,y2:longint;
    end;

var n:longint;
    a:array[1..maxn] of edge;



function isOverlap(c,d:edge):boolean;
var
begin
    if c.x

{ Merge two edges, if overlapping }
procedure mergeEdges(var c:edge; x1,y1,x2,y2:longint);
var 
begin
    
    

procedure input;
var f:text;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n);
    for i:=1 to n do with a[i] do read(f,x1,y1,x2,y2);
    close(f);
end;


