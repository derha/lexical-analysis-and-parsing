DECLARATION

Z start!
Z finish!
Z i!

MAIN

# take start and finish values from the input #
start := IN!
finish := IN!

# if start is greater than finish, terminate the program #
[start > finish] ->
    EXIT!
DONE

# print all integers between start and finish included #
i := start!
WHENEVER [i <= finish]
    OUT i!
    i := i + 1!
DONE

END
