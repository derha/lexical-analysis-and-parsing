DECLARATION

Q a!
Q b!
Q c!
Q discriminant!
Z discriminant_num!
CHAR ans!

MAIN

# take a, b, and c values from the input #
a := IN!
b := IN!
c := IN!

# calculate discriminant #
discriminant := b * b - 4 * a * c!

# determine the amount of roots of a quadratic equation #
[discriminant < 0] ->
    discriminant_num := 0!
--  [discriminant > 0] ->
        discriminant_num := 2!
    --
        discriminant_num := 1!
    DONE
DONE

# determine the answer #
[discriminant_num = 1 \/ discriminant_num = 2] ->
    ans := 'Y'!
--
    ans := 'N'!
DONE

OUT ans!
OUT discriminant_num!

END
