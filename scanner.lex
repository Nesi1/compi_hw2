%{
#define YYSTYPE int
#include "parser.tab.hpp"
%}

%option noyywrap
%option yylineno

num     [0]|([1-9][0-9]*)
id	    [A-Za-z][A-Za-z0-9]*
relop   ==|!=|<=|>=|<|>
binop   \+|\-|\*|\/
whitespace ([\t\n\r ])
string  \"([^\n\r\"\\]|\\[rnt"\\])+\"

%%
void        return VOID;
int         return INT;
byte        return BYTE;
b           return B; 
bool        return BOOL;
and         return AND;
or          return OR;
not         return NOT;
true        return TRUE;
false       return FALSE;
return      return RETURN;
if          return IF;
else        return ELSE;
while       return WHILE;
break       return BREAK;
continue    return CONTINUE;
\;          return SC;
\,          return COMMA;
\(          return LPAREN;
\)          return RPAREN;
\{          return LBRACE;
\}          return RBRACE;
=           return ASSIGN;
{relop}     return RELOP;
{binop}     return BINOP;
{id}        return ID;
{num}       return NUM;
{whitespace} ;
{string}    return STRING;
.           return YYUNDEF;

%%
