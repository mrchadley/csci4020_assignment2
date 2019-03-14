grammar Expr;

program: NEWLINE* line (NEWLINE* line)* NEWLINE?;

line:	STRING? expr COMMENT?
	|	COMMENT
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

COMMENT : '#' ~('\r' | '\n')*;// '\n';

STRING : '"' ~('"')* '"';

NUMBER
	:	'-'? INT '.' INT
	|	'-'? INT
	;
fragment INT : '0' | [1-9] [0-9]* ;

NEWLINE : '\r'? '\n';

WS	:	[ \t\n\r]+ -> skip;
