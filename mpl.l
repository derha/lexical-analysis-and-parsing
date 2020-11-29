%{ /* definitions */
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
%}

%% /* rules */

Z|Q|CHAR                    return TYPE;

[a-z][a-z0-9_]*             return VAR;

":="                        return WALRUS;
"\\/"                       return OR;
"/\\"                       return AND;
">"                         return G;
">="                        return GE;
"<"                         return L;
"<="                        return LE;
"="                         return E;
"X="                        return NE;
"\*"                        return MULT;
":"                         return DIV;
"+"                         return PLUS;
"-"                         return MINUS;
")"                         return RBRACE;
"("                         return LBRACE;


[+-]?[0-9]+                 yylval = atoi(yytext); return INTEGER;
[+-]?[0-9]+\.[0-9]+         yylval = atof(yytext); return FLOAT;
\'.\'                       return CHARACTER;

!                           return ECPHONEME;

EXIT                        return EXIT;
DECLARATION                 return DECLARATION;
MAIN                        return MAIN;
END                         return END;
IN                          return IN;
OUT                         return OUT;

^#.*#$                      return COMMENT;

"]"                         return RBRACKET;
"["                         return LBRACKET;
"->"                        return THEN;
"-->"                       return ELSETHEN;
"--"                        return ELSE;
WHENEVER                    return WHENEVER;
DONE                        return DONE;

\n                          /* ignore end of line */;
[ \t]+                      /* ignore whitespace */;

%%

int yywrap()
{
	return 1;
}