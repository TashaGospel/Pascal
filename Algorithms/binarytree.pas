const fi = 'binarytree.inp';
      fo = 'binarytree.out';
      maxn = 1000;

type pnode = ^node;
     node = record
        left,right:pnode;
        info:longint;
     end;

var n:longint;
    a:array[1..maxn] of longint;
    root:pnode;

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

procedure addNode(var t:pnode; x:longint);
begin
    if t = nil then
    begin
        new(t);
        t^.left:=nil;
        t^.right:=nil;
        t^.info:=x;
    end
    else if x <= t^.info then addNode(t^.left,x)
    else addNode(t^.right,x);
end;

procedure makeTree;
var i:longint;
begin
    { Should put this in input. }
    for i:=1 to n do addNode(root,a[i]);
end;

procedure middleSearch(t:pnode; var f:text);
begin
    if t = nil then exit;
    middleSearch(t^.left,f);
    write(f,t^.info,' ');
    middleSearch(t^.right,f);
end;
    
procedure output;
var f:text;
begin
    assign(f,fo);
    rewrite(f);
    middleSearch(root,f);
    close(f);
end;

{
function findNode(t:pnode,x:longint):pnode;
begin
    if (t = nil) or (t^.info = x) then exit(t)
    else if t^.info > x then findNode(t^.left,x)
    else findNode(t^.right,x);
end;
}

procedure swap(var c,d:longint);
var tmp:longint;
begin
    tmp:=c;
    c:=d;
    d:=tmp;
end;

procedure deleteNode(t:pnode,x:longint);
var
begin
    
end;

function height(t:pnode):longint;
begin
    if t = nil then exit(1)
    else exit(max(height(t^.left),height(t^.right)) + 1);
end;

begin
    input;
    makeTree;
    output;
end.

{
    //MO TA CAC THAO TAC TREN CAY NHI PHAN TIM KIEM
//         BST (Binary Searching Tree)
//          (Duong Khac Huong-LQD-KH)
//
// input: 50 25 75 12 35 60 85 8 18 30 39 55 68 (gom 13 nut)
// voi du lieu tren, BST se duoc tao ra co hinh dang sau day:
//
//                                50
//                              /    
//                            /        
//                          /            
//                        25              75
//                       /              /  
//                     /               /    
//                   12       35        60      85
//                 /       /        /           
//                8    18  30   39   55   68
//
 
uses crt;
const  fi='BST.INP';
  fo='BST.OUT';
type pnode=^node;
     node=record
info:integer;
          l,r:pnode;
          end;
var  t:pnode; //nut goc cua cay
     n,xoa:integer;
 
//thu tuc chen 1 nut vao BST
procedure insert(var r:pnode; x:integer);
begin
if r=nil then
     begin
      new(r);
          r^.info:=x;
          r^.l:=nil;
          r^.r:=nil;
     end
     else if x>r^.info then insert(r^.r,x)
      else insert(r^.l,x);
end;
procedure inputdata;
var f:text; x,i:integer;
begin
assign(f,fi); reset(f);
     readln(f,n);
     for i:=1 to n do
     begin
      read(f,x);
          insert(t,x);
          if eoln(f) then readln(f);
     end;
     close(f);
end;
procedure duyettruoc(pt:pnode);
begin
     if pt<>nil then
     begin
          write(pt^.info,' ');
          duyettruoc(pt^.l);
          duyettruoc(pt^.r);
     end;
end;
procedure duyetgiua(pt:pnode);
begin
if pt<> nil then
     begin
     duyetgiua(pt^.l);
          write(pt^.info,' ');
          duyetgiua(pt^.r);
     end;
end;
procedure duyetsau(pt:pnode);
begin
if pt<> nil then
     begin
          duyetsau(pt^.l);
          duyetsau(pt^.r);
          write(pt^.info,' ');
     end;
end;
 
//Thu tuc duyet BST dua ra day khoa theo thu tu giam dan
procedure duyetnguoc(pt:pnode);
begin
if pt<> nil then
     begin
      duyetnguoc(pt^.r);
          write(pt^.info,' ');
          duyetnguoc(pt^.l);
     end;
end;
 
//ham tim nut co khoa = x, ham tra ve con tro tro vao nut tim duoc
//hoac con tro nil (neu khong tim thay)
function search(pt:pnode;x:integer):pnode;
begin
     if (pt=nil) or (pt^.info=x) then exit(pt)
     else if x<=pt^.info then exit(search(pt^.l,x))
      else exit(search(pt^.r,x));
end;
 
//ham tim nut co khoa nho nhat tren BST. Neu cay rong, ham tra ve nil
function pmin(pt:pnode):pnode;
begin
if pt = nil then exit(nil);
     while pt^.l<>nil do pt:=pt^.l;
     exit(pt);
end;
 
//ham tim nut co khoa lon nhat tren BST. Neu cay rong, ham tra ve nil
function pmax(pt:pnode):pnode;
begin
if pt= nil then exit(nil);
     while pt^.r<>nil do pt:=pt^.r;
     exit(pt);
end;
 
//Ham tim nut cha cua nut co khoa = x.
//Neu cay rong hoac nut can tim la nut goc thi ham tra ve nil
function Father(pt:pnode;x:integer):pnode;
var r:pnode;
begin
     if (pt=nil) or (pt^.info=x) then exit(nil);
     repeat
r:=pt;
          if x<pt^.info then pt:=pt^.l else pt:=pt^.r;
     until (pt=nil) or (pt^.info=x);
     if pt<>nil then exit(r) else exit(nil); 
end;
 
//thu tuc xoa nut co khoa = x tren BST
procedure deletenode(pt:pnode;x:integer);
var p,q,r,tmp:pnode;
begin
//tim nut can xoa
     p:=search(pt,x);
 
     //truong hop nut can xoa khong tim thay (nut can tim khong ton tai hoac cay rong thi p = nil)
     if p=nil then exit;
 
//truong nut can xoa tim duoc la nut goc va cung la nut la (cay chi co 1 nut)
     if (p=t) and (p^.l=nil) and (p^.r=nil) then
     begin
      t:=nil;
          dispose(p);
          exit;
     end;
 
     //truong hop nut can xoa tim duoc la nut la' can phai tim nut cha cua no
     if (p^.l=nil) and (p^.r=nil) then r:=father(t,x);
 
     //truong hop nut can xoa khong phai la nut la' can tim nut thay the
     //nut thay the la nut cuc phai cua cay con trai hoac cuc trai cua cay con phai
     while (p^.l<>nil) or (p^.r<>nil) do
     begin
      //tim nut thay the la q
      if p^.l<>nil then q:=pmax(p^.l)
          else if p^.r<>nil then q:=pmin(p^.r);
 
          //tim nut cha cua nut thay the (q) la r
          r:=father(t,q^.info);
 
          //thay the du lieu cua nut q cho nut p
          p^.info:=q^.info;
 
          //dinh vi lai con tro p de quay lai tiep tuc tim nut thay the
          //cho den khi nut thay the tim duoc la nut la
          p:=q;
end;
     // gan con tro cua nut cha den nut thay the = nil
     if r^.l = p then r^.l:=nil
     else if r^.r=p then r^.r:=nil;
 
     //xoa nut thay the cuoi cung tim duoc
     dispose(p);
end;
BEGIN
clrscr;
inputdata;
     writeln('Duyet truoc:'); duyettruoc(t); writeln;
xoa:=30;
     if search(t,xoa) = nil then writeln('Ko co nut ',xoa,' tren cay')
     else
     begin
      deletenode(t,xoa);
      writeln('Duyet truoc sau khi da xoa :',xoa);
      duyettruoc(t); writeln;
     end;
     readln;
END.
}
