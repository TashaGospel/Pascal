Uses math;
Type values =record
	diff,max,min:longint;
	end;
Var a:array[1..100] of longint;
	n:longint;

Procedure Input;
Var f:text; i:longint;
Begin
	assign(f,'diff.inp');
	reset(f);
	readln(f,n);
	for i:=1 to n do read(f,a[i]);
	close(f);
End;

Function DoLech(i,j:longint):values;
Begin
	If i <> j then
		Begin
			DoLech(i,j).diff:=max(DoLech(i,j div 2).diff,DoLech(j div 2 + 1,j).diff,DoLech(j div 2 + 1,j).max-DoLech(i,j div 2).min);
			DoLech(i,j).max:=max(DoLech(i,j div 2).max,DoLech(j div 2 +1, j).max);
			DoLech(i,j).min:=min(DoLech(i,j div 2).min,DoLech(j div 2 +1, j).min);
		End
	Else
	Begin
		DoLech(i,j).diff:=0;
		DoLech(i,j).max:=a[i];
		DoLech(i,j).min:=a[i];
	End;
End;

Procedure Output;
Var f:text;
Begin
	assign(f,'diff.out');
	rewrite(f);
	write(f,DoLech(1,n).diff);
	close(f);
End;

Begin
	Input;
	Output;
End.
