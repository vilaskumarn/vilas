-- Exception Handling

declare
    a number:=10;
    b number:=0;
    c number;
begin 
    c:=a/b;
    dbms_output.put_line(c);
Exception
    when zero_divide then
        dbms_output.put_line('cannot divide by zero');
end;
/