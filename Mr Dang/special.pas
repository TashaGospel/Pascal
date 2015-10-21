const fi = 'special.inp';
      fo = 'special.out';

var a:array[0..255] of byte;
    
procedure input;
var f:text;
    s:string;
    i:longint;
begin
    assign(f,fi);
    reset(f);
    s:='';
    while true do
    begin
        readln(f,s);
        if s = '###' then break;
        for i:=1 to length(s) do a[i]:=a[i] xor ord(s[i]);
    end;
    close(f);
end;

procedure output;
var f:text;
    i:longint;
begin
    assign(f,fo);
    rewrite(f);
    for i:=0 to 255 do if a[i] > 0 then write(f,chr(a[i]));
    close(f);
end;

begin
    input;
    output;
end.
