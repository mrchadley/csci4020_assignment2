grammar Expr;

program: line*;

line:	STRING? expr COMMENT?
	|	COMMENT
	|	'\r'? '\n'
	;

prec:	':' NUMBER;

expr: 	term
	|	term '+' expr
	| 	term '-' expr
	|	expr prec
	;
term:	factor
	|	factor '*' term
	|	factor '/' term
	;
factor
	:	NUMBER ('^' NUMBER)?
	|	'(' expr ')'
	|	FUNCTION
	;

ID : [a-z]+;
FUNCTION : ID '(' NUMBER ')';

COMMENT : '#' ~('\n')* '\n';

STRING : '"' ~('"')* '"';

NUMBER
	:	'-'? INT '.' INT
	|	'-'? INT
	;
fragment INT : '0' | [1-9] [0-9]* ;

WS	:	[ \t\n\r]+ -> skip;
