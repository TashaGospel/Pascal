var a, b, ucln, tam:integer;
begin
    // Nhap vao 2 so a, b cho den khi a <> b
    repeat
        readln(a,b);
    until a <> b;

    // Tim UCLN cua a, b
    ucln:=a;
    tam:=b;
    while ucln <> tam do
        if ucln < tam then tam:=tam - ucln
        else ucln:=ucln - tam;

    // BCNN = a * b / UCLN
    if a > b then writeln(ucln)
    else writeln(a * b div ucln);
end.
