%{
#include <string.h>
#include <stdio.h>

void yyerror(const char *str)
{
	fprintf(stderr, "error: %s\n", str);
}

int yywrap()
{
	return 1;
}

int main()
{
	yyparse();
}
%}

%token TYPE VAR FLOAT INTEGER WALRUS ECPHONEME

%%

statements:
   	| statements statement
	;

statement:
      declaration
    | assignment
    ;

declaration:
      TYPE VAR WALRUS expression ECPHONEME
    | TYPE VAR ECPHONEME
    ;

assignment:
    VAR WALRUS expression ECPHONEME
    ;

expression:
      INTEGER
    | FLOAT
    ;
