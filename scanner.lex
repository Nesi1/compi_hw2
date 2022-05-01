%{
#define YYSTYPE int
#include "parser.tab.hpp"
%}

%option noyywrap
%option yylineno

num     [0]|([1-9][0-9]*)
id	    [A-Za-z][A-Za-z0-9]*
/* relop   ==|!=|<=|>=|<|> */
relop_eq ==|!=
relop_size <=|>=|<|>
/* binop   \+|\-|\*|\/ */
binop_muldiv   \*|\/
binop_plusminus   \+|\-
whitespace  ([\t\n\r ])
string                  \"([^\n\r\"\\]|\\[rnt"\\])+\"
line_comment            \/\/[^\r\n]*[\r|\n|\r\n]?

%%
void                return VOID;
int                 return INT;
byte                return BYTE;
b                   return B; 
bool                return BOOL;
auto                return AUTO;
and                 return AND;
or                  return OR;
not                 return NOT;
true                return TRUE;
false               return FALSE;
return              return RETURN;
if                  return IF;
else                return ELSE;
while               return WHILE;
break               return BREAK;
continue            return CONTINUE;
\;                  return SC;
\,                  return COMMA;
\(                  return LPAREN;
\)                  return RPAREN;
\{                  return LBRACE;
\}                  return RBRACE;
=                   return ASSIGN;
{relop_eq}          return RELOP_EQ; /*{relop}          return RELOP;*/
{relop_size}        return RELOP_SIZE;
{binop_muldiv}      return BINOP_MULDIV; /* {binop}             return BUNOP; */
{binop_plusminus}   return BINOP_PLUSMINUS; 
{id}                return ID;
{num}               return NUM;
{whitespace}        ;
{line_comment}      ;
{string}            return STRING;
.                   return YYUNDEF;

%%
