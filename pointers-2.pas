const fi = 'pointers-2.inp';
      fo = 'pointers-2.out';

type
    thingPtr = ^thing;
    thing = record
        x,y:longint;
        next:thingPtr;
    end;
      
var list1,list2,res:thingPtr;

procedure insertOrdered(x,y:longint; var first:thingPtr);
var p,newNode,before:thingPtr;
begin
    new(newNode);
    newNode^.x:=x;
    newNode^.y:=y;
    p:=first;
    while (p <> nil) and (p^.x < x) do
    begin
        before:=p;
        p:=p^.next;
    end;
    if p = first then first:=newNode
    else before^.next:=newNode;
    newNode^.next:=p;
end;

procedure input;
var f:text;
    i,n,m,d1,d2:longint;
begin
    assign(f,fi);
    reset(f);
    read(f,n,m);
    for i:=1 to n do
    begin
        read(f,d1,d2);
        insertOrdered(d1,d2,list1);
    end;
    for i:=1 to m do
    begin
        read(f,d1,d2);
        insertOrdered(d1,d2,list2);
    end;
    close(f);
end;

procedure main;
var p1,p2:thingPtr;
begin
    p1:=list1;
    p2:=list2;
    while (p1 <> nil) and (p2 <> nil) do
    begin
        insertOrdered(p1^.x,p1^.y + p2^.y,res);
        p1:=p1^.next;
        p2:=p2^.next;
    end;
    if p1 = nil then p1:=p2;
    while p1 <> nil do
    begin
        insertOrdered(p1^.x,p1^.y,res);
        p1:=p1^.next;
    end;
end;

procedure output;
var f:text;
    p:thingPtr;
begin
    assign(f,fo);
    rewrite(f);
    p:=res;
    while p <> nil do
    begin
        write(f,p^.y,' ');
        p:=p^.next;
    end;
    close(f);
end;

begin
    input;
    main;
    output;
end.
