%{
#include <string.h>
#include <stdio.h>

void yyerror(const char *str)
{
	fprintf(stderr, "error: %s\n", str);
	exit(0);
}

int yywrap()
{
	return 1;
}

int main()
{
	yyparse();
	printf("OK!\n");
	return 0;
}
%}

%token TYPE VAR FLOAT INTEGER WALRUS ECPHONEME EXIT

%%

statements:
   	| statements statement
	;

statement:
      declaration
    | assignment
    | EXIT ECPHONEME
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
