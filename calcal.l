%option noyywrap
%{
	#include<math.h>
	#include"y.tab.h"
%}

%%
[0-9]+ {yylval=atoi(yytext); return NUM;}
[-+*/] {return *yytext;}
\n {return 0;}
. {return yytext[0];}	
sin {return SIN;}
cos {return COS;}
tan {return TAN;}
log {return LOG;}
%%
