Uses math;
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

Function Lonnhat(i,j:longint):longint;
Var x,y:longint;
Begin
	y:=-maxlongint;
	For x:=i to j do if y < a[x] then y:=a[x];
	Lonnhat:=y;
End;

Function Nhonhat(i,j:longint):longint;
Var x,y:longint;
Begin
	y:=maxlongint;
	For x:=i to j do if y > a[x] then y:=a[x];
	Nhonhat:=y;
End;

Function DoLech(i,j:longint):longint;
Var s,mid:longint;
Begin
	mid:=(i+j) div 2;
	If i <> j then
		Begin
			s:=max(max(DoLech(i,mid),DoLech(mid+1,j)),Lonnhat(mid + 1,j)-Nhonhat(i,mid));
			exit(s);
		End
	Else exit(0);
End;

Procedure Output;
Var f:text;
Begin
	assign(f,'diff.out');
	rewrite(f);
	write(f,DoLech(1,n));
	close(f);
End;

Begin
	Input;
	Output;
End.
