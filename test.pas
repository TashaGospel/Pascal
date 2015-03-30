Var a,n,s:longint;

Procedure Input;
Begin
	readln(a,n);
End;

Procedure Main(i,j:longint);
Begin
	if j = 1 then s:=s*a
	else 
	begin
        Main(i,j div 2);
        Main(i,j-(j div 2));
    end;
End;

BEGIN
	Input;
    s:=1;
	Main(a,n);
	writeln(s);
END.
