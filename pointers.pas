const fi = 'pointers.inp';
      fo = 'pointers.out';
      n = 10;
      maxVal = 10;

type
    thing = record
        x:longint;
        next:^thing;
    end;

    thingPtr = ^thing;

var first:thingPtr;

function insertAtFront(x:longint):thingPtr;
var p:thingPtr;
begin
    new(p);
    p^.x:=x;
    p^.next:=first;
    first:=p;
    exit(p);
end;

function unorderedSearch(x:longint):thingPtr;
var p:thingPtr;
begin
    p:=first;
    while p <> nil do
        if p^.x = x then exit(p)
        else p:=p^.next;
    exit(nil);
end;

function orderedSearch(x:longint):thingPtr;
var p:thingPtr;
begin
    p:=first;
    while p <> nil do
        if p^.x = x then exit(p)
        else if p^.x > x then exit(nil)
        else p:=p^.next;
    exit(nil);
end;

function insertOrdered(x:longint):thingPtr;
var p,node,before:thingPtr;
begin
    new(node);
    node^.x:=x;
    p:=first;
    while (p <> nil) and (p^.x < x) do
    begin
        before:=p;
        p:=p^.next;
    end;
    if p = first then first:=node
    else before^.next:=node;
    node^.next:=p;
    exit(node);
end;

procedure deleteAtFront;
var p:thingPtr;
begin
    if first = nil then exit;
    p:=first;
    first:=p^.next;
    dispose(p);
end;

procedure deleteAfterPointer(node:thingPtr);
var p:thingPtr;
begin
    if node^.next = nil then exit;
    p:=node^.next;
    node^.next:=p^.next;
    dispose(p);
end;

procedure deleteItem(x:longint);
var p,before:thingPtr;
begin
    p:=first;
    while (p <> nil) and (p^.x < x) do
    begin
        before:=p;
        p:=p^.next;
    end;
    if (p <> nil) and (p^.x = x) then
        if p = first then deleteAtFront
        else deleteAfterPointer(before);
end;

procedure main;
var i,res:longint;
    p:thingPtr;
begin
    randomize;
    res:=0;
    for i:=1 to n do insertOrdered(random(maxVal + 1));
    p:=first;
    while p <> nil do
    begin
        inc(res,p^.x);
        write(p^.x,' ');
        p:=p^.next;
    end;
    writeln;
    writeln(res);
end;

begin
    main;
end.
