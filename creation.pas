const fi = 'creation.inp';
	  fo = 'creation.out';
	  maxn = 100;
type vitrison = record
	x1,y1,x2,y2,c:integer;
	end;
var a:array[0..maxn] of vitrison;
	b:array[1..maxn] of integer;
	p,m,n,empty:integer;

procedure input;
var f:text;
	i:integer;
begin
	assign(f,fi);
	reset(f);
	readln(f,p,m,n);
	for i:=1 to p do readln(f,a[i].x1,a[i].y1,a[i].x2,a[i].y2,a[i].c);
	close(f);
	fillchar(b,sizeof(b),0);
	empty:=0;
	a[0].x1:=0;
	a[0].x2:=m;
	a[0].y1:=0;
	a[0].y2:=n;
end;

procedure check(i:integer);
var counted:array[1..maxn,1..maxn] of boolean;
	j:integer;
	function overlap(i,j:integer):integer;
	var xx1,xx2,yy1,yy2,dt,k,l:integer;
	begin
	dt:=0;
	//Tinh x phan overlap
	if a[j].x1 > a[i].x2 then exit(0)
	else if (a[j].x1 >= a[i].x1) and (a[j].x1 <= a[i].x2) then
		if (a[j].x2 >= a[i].x1) and (a[j].x2 <= a[i].x2) then begin xx2:=a[j].x2; xx1:=a[j].x1; end
		else begin xx2:=a[i].x2; xx1:=a[j].x1; end
	else	
		if a[j].x2 < a[i].x1 then exit(0)
		else if (a[j].x2 >= a[i].x1) and (a[j].x2 <= a[i].x2) then begin xx2:=a[j].x2; xx1:=a[i].x1; end
		else begin xx2:=a[i].x2; xx1:=a[i].x1; end;
	//Tinh y phan overlap
	if a[j].y1 > a[i].y2 then exit(0)
	else if (a[j].y1 >= a[i].y1) and (a[j].y1 <= a[i].y2) then
		if (a[j].y2 >= a[i].y1) and (a[j].y2 <= a[i].y2) then begin yy2:=a[j].y2; yy1:=a[j].y1; end
		else begin yy2:=a[i].y2; yy1:=a[j].y1; end
	else	
		if a[j].y2 < a[i].y1 then exit(0)
		else if (a[j].y2 >= a[i].y1) and (a[j].y2 <= a[i].y2) then begin yy2:=a[j].y2; yy1:=a[i].y1; end
		else begin yy2:=a[i].y2; yy1:=a[i].y1; end;
	//Danh dau va dien tich phan overlap
	for k:=xx1+1 to xx2 do
		for l:=yy1+1 to yy2 do if not counted[k,l] then
		begin
			counted[k,l]:=true;
			inc(dt);
		end;
	exit(dt);
	end;
begin
	fillchar(counted,sizeof(counted),false);
	for j:=i-1 downto 1 do b[a[j].c]:=b[a[j].c] - overlap(j,i);
end;

//Them phan paint ben ngoai gioi han?

function dt(i,j:integer):integer;
var xx1,xx2,yy1,yy2:integer;
begin
	//Tinh x phan overlap
	if a[j].x1 > a[i].x2 then exit(0)
	else if (a[j].x1 >= a[i].x1) and (a[j].x1 <= a[i].x2) then
		if (a[j].x2 >= a[i].x1) and (a[j].x2 <= a[i].x2) then begin xx2:=a[j].x2; xx1:=a[j].x1; end
		else begin xx2:=a[i].x2; xx1:=a[j].x1; end
	else	
		if a[j].x2 < a[i].x1 then exit(0)
		else if (a[j].x2 >= a[i].x1) and (a[j].x2 <= a[i].x2) then begin xx2:=a[j].x2; xx1:=a[i].x1; end
		else begin xx2:=a[i].x2; xx1:=a[i].x1; end;
	//Tinh y phan overlap
	if a[j].y1 > a[i].y2 then exit(0)
	else if (a[j].y1 >= a[i].y1) and (a[j].y1 <= a[i].y2) then
		if (a[j].y2 >= a[i].y1) and (a[j].y2 <= a[i].y2) then begin yy2:=a[j].y2; yy1:=a[j].y1; end
		else begin yy2:=a[i].y2; yy1:=a[j].y1; end
	else	
		if a[j].y2 < a[i].y1 then exit(0)
		else if (a[j].y2 >= a[i].y1) and (a[j].y2 <= a[i].y2) then begin yy2:=a[j].y2; yy1:=a[i].y1; end
		else begin yy2:=a[i].y2; yy1:=a[i].y1; end;
	//Danh dau va dien tich phan overlap
	exit((xx2-xx1)*(yy2-yy1));
end;

procedure main;
var i:integer;
begin
	for i:=1 to p do
	begin
		b[a[i].c]:=dt(i,0);
		check(i);
	end;
end;

function ininput(i:integer):boolean;
var j:integer;
begin
	for j:=1 to n do if i = a[j].c then exit(true);
	exit(false);
end;

procedure output;
var f:text;
	i:integer;
begin
	assign(f,fo);
	rewrite(f);
	for i:=1 to p do if b[a[i].c] = 0 then inc(empty);
	writeln(f,empty);
	for i:=1 to 100 do if ininput(i) then
	begin
		writeln(f,i,' ',b[i]);
	end;
	close(f);
end;

begin
	input;
	main;
	output;
end.