%{ /* definitions */
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
%}

%% /* rules */

Z|Q                         return TYPE;

[a-z][a-z0-9_]*             return VAR;

:=                          return WALRUS;

[+-]?[0-9]+                 yylval=atoi(yytext); return INTEGER;
[+-]?[0-9]+\.[0-9]*         yylval=atof(yytext); return FLOAT;

!                           return ECPHONEME;

EXIT                        return EXIT;

\n                          /* ignore end of line */;
[ \t]+                      /* ignore whitespace */;

%%