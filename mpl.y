%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *str)
{
	fprintf(stderr, "error: %s\n", str);
	exit(0);
}


%}

%token EXIT DECLARATION MAIN END COMMENT IN OUT
%token TYPE VAR WALRUS ECPHONEME LBRACE RBRACE
%token INTEGER FLOAT CHARACTER
%token OR AND G GE L LE NE E
%token MULT DIV PLUS MINUS

%left OR
%left AND
%left G GE L LE NE E
%left PLUS MINUS
%left MULT DIV

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
    | COMMENT
    ;

statements:
      statement
   	| statement statements
	;

statement:
      assignment
    | EXIT ECPHONEME
    | COMMENT
    | OUT expression ECPHONEME
    ;

assignment:
      VAR WALRUS expression ECPHONEME
    | VAR WALRUS IN ECPHONEME
    ;

expression:
      const
    | VAR
    | expression OR expression
    | expression AND expression
    | expression G expression
    | expression GE expression
    | expression L expression
    | expression LE expression
    | expression E expression
    | expression NE expression
    | expression PLUS expression
    | expression MINUS expression
    | expression MULT expression
    | expression DIV expression
    | LBRACE expression RBRACE
    ;

const:
      INTEGER
    | FLOAT
    | CHARACTER
    ;

%%

int main()
{
	yyparse();
	printf("OK!\n");
	return 0;
}
