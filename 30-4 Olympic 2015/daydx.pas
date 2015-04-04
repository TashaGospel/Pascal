Var s:array[1..5000] of longint;
    a:array[1..5000,1..5000] of longint;
    b:array[1..5000] of boolean;
    n:longint;

Procedure Input;
Var f:text;
	i:longint;
Begin
	assign(f,'daydx.inp');
	reset(f);
	readln(f,n);
	for i:=1 to n do read(f,s[i]);
	close(f);
End;

Procedure Main;
Var i,j,kc:longint;
Begin
	For j:= 1 to n do
		For i:= 1 to j do
		If i = j then a[i,j]:= 1;
	For kc:= 1 to n-1 do //Khoang cach giua 2 chi so trong bang
		For i:= kc+1 to n do
		Begin
			j:=i-kc;
			If s[i]=s[j] then a[i,j]:=a[i-1,j+1] + 2
                        Else if a[i-1,j]>a[i,j+1] then a[i,j]:= a[i-1,j] else a[i,j]:= a[j,i-1];
		End;
End;

Procedure Result;
Var i,j:longint;
Begin
	i:=n;j:=1;
	Repeat
		If s[i] = s[j] then
		Begin
			b[i]:=true;
			b[j]:=true;
			dec(i);inc(j);
		End
		else if a[i-1,j] > a[i,j+1] then dec(i) else inc(j);
	Until i < j;
End;

Procedure Output;
Var f:text;
	i,count:longint;
Begin
	count:=0;
	assign(f,'daydx.out');
	rewrite(f);
	for i:=1 to n do if b[i] then inc(count);
	writeln(f,count);
	For i:=1 to n do If b[i] then write(f, s[i],' ');
  	close(f);
End;

Begin
        Fillchar(b,sizeof(b),false);
	Input;
	Main;
	Result;
	Output;
End.




