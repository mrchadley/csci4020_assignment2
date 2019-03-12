grammar Expr;

program : number
        ;

WHITESPACE: (' ' | '\t' )+ -> skip;
