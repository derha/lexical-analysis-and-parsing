# Lexical Analysis and Parsing
A syntax analyzer for mpl(my programming language) using Lex & YACC.

This analyzer does not deal with semantics. Its goal is limited with syntax only.

All grammar related documentation can be found in general_rules and ebnf files.

To test it on examples use the following commands:
> \> lex mpl.l\
> \> yacc -d mpl.y\
> \> gcc -o run lex.yy.c y.tab.c -ll \
> \> ./run<example.mpl
