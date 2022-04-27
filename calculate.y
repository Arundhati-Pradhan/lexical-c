%{
	#include<stdlib.h>
	#include<stdio.h>
	#include<math.h>
	int yylex(void);
	void yyerror(char *);
%}

%token NUM
%token SIN COS TAN LOG
%left '+''-'
%left '/''*'
%start s
%%

s	: exp {printf("RESULT %d", $$);}
	;
exp	: exp '+' exp {$$ = $1 + $3;}
	| exp '-' exp {$$ = $1 - $3;}
	| exp '*' exp {$$ = $1 * $3;}
	| exp '/' exp {
		if ($3 == 0) {
			printf("Division by zero");
			exit(0);
		} else 
			$$ = $1 / $3;
	}
	| SIN '('exp')' {$$ = sin($3);}
	| COS '('exp')' {$$ = cos($3);}
	| TAN '('exp')' {$$ = tan($3);}
	| LOG '('exp')' {$$ = log10($3);}
	| NUM {$$ = $1;}
	;

%%

void yyerror(char *s){
	fprintf(stderr, "%s\n", s);
}

int main()
{
	printf("Enter expression: ");
	yyparse();
	return 0;
}
