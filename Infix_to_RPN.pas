program ConvertInfixToRPN;
type
TStackNode = record
// Ngăn xêp ñưIc cài ñat bang danh sách móc nôi kieu LIFO
value: AnsiChar;
link: Pointer;
end;
PStackNode = ^TStackNode;
var
Infix: AnsiString;
top: PStackNode;
procedure Push(const c: AnsiChar);
var p: PStackNode;
begin
New(p);
p^.value := c;
p^.link := top;
top := p;
end;
function Pop: AnsiChar; 
var p: PStackNode;
begin
Pop := top^.value;
p := top^.link;
Dispose(top);
top := p;
end;
function Get: AnsiChar;
begin
Get := top^.value;
end;
function Priority(c: Char): Integer;  
begin
case c of
'*', '/': Priority := 2;
'+', '-': Priority := 1;
'(': Priority := 0;
end;

end;
procedure ProcessToken(const token: AnsiString);
var
x: AnsiChar;
Opt: AnsiChar;
begin
Opt := token[1];
case Opt of
	'(': Push(Opt); //token là dâu ngoac mJ
	')': //token là dâu ngoac ñóng
repeat
x := Pop;
if x <> '(' then Write(x, ' ')
else Break;
until False;
'+', '-', '*', '/': //token là toán t 
begin
while (top <> nil)
and (Priority(Opt) <= Priority(Get)) do
Write(Pop, ' ');
Push(Opt);
end;
else //token là toán h)ng
Write(token, ' ');
end;
end;
procedure Parsing;
const Operators = ['(', ')', '+', '-', '*', '/'];
var i: Integer;
begin
for i := 1 to Length(Infix) do
	if infix[i] <> ' ' then ProcessToken(infix[i]);
//ðNc hêt bieu th3c trung tô, lây nôt các phân t  trong ngăn xêp ra và hien th$
while top <> nil do
Write(Pop, ' ');
WriteLn;
end;
begin
ReadLn(Infix); //Nhap dW lieu
top := nil; //KhJi t)o ngăn xêp rong
Parsing; //ðNc bieu th3c trung tô và chuyen thành d)ng RPN
end.