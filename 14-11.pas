const maxn = 999;
var n:longint;
        s:string;
        a:array[1..maxn] of char;
        b:array[1..maxn] of boolean;

const maxn = 999;
var n:longint;
        s:string;
        a:array[1..maxn] of char;
        b:array[1..maxn] of boolean;

procedure input;
begin
        readln(s);
        n:=length(s);
        fillchar(b,sizeof(b),false);
end;

procedure output;
var i:longint;
begin
        for i:=1 to n do write(a[i]);
        write(' ');
end;

procedure try(i:longint);
var j:longint;
begin
        for j:=1 to n do
                if not b[j] then
                begin
                        b[j]:=true;
                        a[i]:=s[j];
                        if i = n then output else
                        try(i+1);
                        b[j]:=false;
                end;
end;

begin
        input;
        try(1);
        readln;

end.
procedure input;
begin
        readln(s);
        n:=length(s);
        fillchar(b,sizeof(b),false);
end;

procedure output;
var i:longint;
begin
        for i:=1 to n do write(a[i]);
        write(' ');
end;

procedure try(i:longint);
var j:longint;
begin
        for j:=1 to n do
                if not b[j] then
                begin
                        b[j]:=true;
                        a[i]:=s[j];
                        if i = n then output else
                        try(i+1);
                        b[j]:=false;
                end;
end;

begin
        input;
        try(1);
        readln;

end.
const maxn = 999;
var n:longint;
        s:string;
        a:array[1..maxn] of char;
        b:array[1..maxn] of boolean;

procedure input;
begin
        readln(s);
        n:=length(s);
        fillchar(b,sizeof(b),false);
end;

procedure output;
var i:longint;
begin
        for i:=1 to n do write(a[i]);
        write(' ');
end;

procedure try(i:longint);
var j:longint;
begin
        for j:=1 to n do
                if not b[j] then
                begin
                        b[j]:=true;
                        a[i]:=s[j];
                        if i = n then output else
                        try(i+1);
                        b[j]:=false;
                end;
end;

begin
        input;
        try(1);
        readln;

end.
