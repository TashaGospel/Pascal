function getBit(x,i:longint):longint;
begin
    exit((x shr i) and 1);
end;

function getNum(x,j,i:longint):longint;
begin
    exit((x shr i) and (1 shl (j-i+1) - 1));
end;

{function getNum(x,j,i:longint):longint;
var k:longint;
begin
    k:=sizeof(x) shl 3 - 1 - j;
    exit(x shl k shr k shr i);
end;}

function toBinary(x:longint):string;
var i:longint;
    res:string;
begin
    res:='';
    for i:=sizeof(x) shl 3 - 1 downto 0 do
        res:=res + chr(getBit(x,i) + 48);
    while res[1] = '0' do delete(res,1,1);
    exit(res);
end;

function toHex(x:longint):string;
var res:string;
    tmp:longint;
begin
    res:='';
    while x > 0 do
    begin
        tmp:=getNum(x,3,0);
        if tmp < 10 then res:=chr(tmp + 48) + res
        else res:=chr(tmp + 55) + res;
        x:=x shr 4;
    end;
    exit(res);
end;

function bitOn(x,i:longint):longint;
begin
    exit((1 shl i) or x)
end;

function bitOff(x,i:longint):longint;
begin
    exit((not (1 shl i)) and x)
end;

begin
    writeln(getBit(214,4));
    writeln(getNum(214,6,2));
    writeln(toBinary(214));
    writeln(toHex(214));
    writeln(bitOff(215,0));
end.
