//Tran Anh Tuan - September 3rd, 2015

var a:array[1..9] of integer; // array of the current set of numbers
    ok:array[1..9] of boolean; // keep track of which number is already chosen

// print the current out
procedure output;
var i:integer;
begin
	for i:=1 to 9 do write(a[i]);
	writeln;
end;

// c is our current position in array a
procedure main(c:integer);
var i:integer;
begin
	if c = 10 then output // array is only 9 in length, so stop when c = 10 and print out the array
	else
	begin
        // check which number is not already chosen, then choose it
		for i:=1 to 9 do if ok[i] {if it is not chosen} then
		begin
			a[c]:=i; // choose it
            ok[i]:=false; // mark it as chosen
            main(c+1); // move on to next position in the array
            ok[i]:=true; // unmark it
		end;
	end;
end;

begin
    fillchar(ok,sizeof(ok),true); // everything is available to be chosen at beginning
	main(1); // start the recursion
end.
