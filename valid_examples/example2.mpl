DECLARATION

Q num1!
Q num2!
CHAR _res!

MAIN

# take num1 and num2 values from the input #
num1 := IN!
num2 := IN!

# if the sum of n1 and n2 is less then 0, then _res is '-', otherwise '+' #
[num1 + num2 < 0] ->
    _res := '-'!
--
    _res := '+'!
DONE

OUT _res!

END
