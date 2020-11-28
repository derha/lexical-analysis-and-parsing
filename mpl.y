%{
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

%token EXIT DECLARATION MAIN END
%token TYPE VAR WALRUS ECPHONEME LBRACE RBRACE
%token INTEGER FLOAT CHARACTER
%token OR AND G GE L LE NE E
%token MULT DIV PLUS MINUS

%%

program:
    | DECLARATION declarations MAIN statements END
    ;

declarations:
      declaration
    | declaration declarations
    ;

declaration:
      TYPE VAR ECPHONEME
    ;

statements:
      statement
   	| statement statements
	;

statement:
      assignment
    | EXIT ECPHONEME
    ;

assignment:
      VAR WALRUS or_expr ECPHONEME
    ;

or_expr:
      or_expr OR and_expr
    | and_expr
    ;

and_expr:
      and_expr AND comp
    | comp
    ;

comp:
      comp G expr
    | comp GE expr
    | comp L expr
    | comp LE expr
    | comp E expr
    | comp NE expr
    | expr
    ;

expr:
      expr PLUS term
    | expr MINUS term
    | term
    ;

term:
      term MULT factor
    | term DIV factor
    | factor
    ;

factor:
      LBRACE or_expr RBRACE
    | VAR
    | const
    ;

const:
      INTEGER
    | FLOAT
    | CHARACTER
    ;
