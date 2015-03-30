Var a,n,s:longint;

Procedure Input;
Var
Begin
	readln(a,n);
End;

Procedure Main(i,j:longint;);
Begin
	if j = 1 then s=s*a
	else Main(i,j/2);
End;

BEGIN
	Input;
	Main(a,n);
	writeln(s);
END.