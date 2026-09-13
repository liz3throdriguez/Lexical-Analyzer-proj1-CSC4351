package Parse;
import ErrorMsg.ErrorMsg;

%% 

%implements Lexer
%function nextToken
%type java_cup.runtime.Symbol
%char

%{
private void newline() {
  errorMsg.newline(yychar);
}

private void err(int pos, String s) {
  errorMsg.error(pos,s);
}

private void err(String s) {
  err(yychar,s);
}

private java_cup.runtime.Symbol tok(int kind) {
    return tok(kind, null);
}

private java_cup.runtime.Symbol tok(int kind, Object value) {
    return new java_cup.runtime.Symbol(kind, yychar, yychar+yylength(), value);
}

private ErrorMsg errorMsg;

Yylex(java.io.InputStream s, ErrorMsg e) {
  this(s);
  errorMsg=e;
}

%}

%eofval{
	{
	 return tok(sym.EOF, null);
        }
%eofval}       


%%
" "	{}
\n	{newline();}
","	{return tok(sym.COMMA, null);}
"auto"      { return tok(sym.AUTO); }
"double"    { return tok(sym.DOUBLE); }
"int"       { return tok(sym.INT); }
"struct"    { return tok(sym.STRUCT); }

"break"     { return tok(sym.BREAK); }
"else"      { return tok(sym.ELSE); }
"long"      { return tok(sym.LONG); }
"switch"    { return tok(sym.SWITCH); }

"case"      { return tok(sym.CASE); }
"enum"      { return tok(sym.ENUM); }
"register"  { return tok(sym.REGISTER); }
"typedef"   { return tok(sym.TYPEDEF); }

"char"      { return tok(sym.CHAR); }
"extern"    { return tok(sym.EXTERN); }
"return"    { return tok(sym.RETURN); }
"union"     { return tok(sym.UNION); }

"const"     { return tok(sym.CONST); }
"float"     { return tok(sym.FLOAT); }
"short"     { return tok(sym.SHORT); }
"unsigned"  { return tok(sym.UNSIGNED); }

"continue"  { return tok(sym.CONTINUE); }
"for"       { return tok(sym.FOR); }
"signed"    { return tok(sym.SIGNED); }
"void"      { return tok(sym.VOID); }

"default"   { return tok(sym.DEFAULT); }
"goto"      { return tok(sym.GOTO); }
"sizeof"    { return tok(sym.SIZEOF); }
"volatile"  { return tok(sym.VOLATILE); }

"do"        { return tok(sym.DO); }
"if"        { return tok(sym.IF); }
"static"    { return tok(sym.STATIC); }
"while"     { return tok(sym.WHILE); }

"var"       { return tok(sym.VAR); }
"fun"       { return tok(sym.FUN); }

[a-zA-Z_][a-zA-Z0-9_]*    { return tok(sym.ID, yytext()); }
"++"  { return tok(sym.INCREMENT); }
"--"  { return tok(sym.DECREMENT); }
"->"  { return tok(sym.ARROW); }

"<<=" { return tok(sym.LSHIFTASSIGN); }
">>=" { return tok(sym.RSHIFTASSIGN); }

"+="  { return tok(sym.ADDASSIGN); }
"-="  { return tok(sym.SUBASSIGN); }
"*="  { return tok(sym.MULASSIGN); }
"/="  { return tok(sym.DIVASSIGN); }
"%="  { return tok(sym.MODASSIGN); }

"&="  { return tok(sym.BWISEANDASSIGN); }
"^="  { return tok(sym.BWISEXORASSIGN); }
"|="  { return tok(sym.BWISEORASSIGN); }

"<<"  { return tok(sym.LSHIFT); }
">>"  { return tok(sym.RSHIFT); }

"<="  { return tok(sym.LE); }
">="  { return tok(sym.GE); }
"=="  { return tok(sym.EQ); }
"!="  { return tok(sym.NEQ); }

"&&"  { return tok(sym.AND); }
"||"  { return tok(sym.OR); }

"+"   { return tok(sym.PLUS); }
"-"   { return tok(sym.MINUS); }
"*"   { return tok(sym.TIMES); }
"/"   { return tok(sym.DIVIDE); }
"%"   { return tok(sym.MODULUS); }

"="   { return tok(sym.ASSIGN); }

"<"   { return tok(sym.LT); }
">"   { return tok(sym.GT); }

"&"   { return tok(sym.BITWISEAND); }
"|"   { return tok(sym.BWISEOR); }
"^"   { return tok(sym.BWISEXOR); }

"~"   { return tok(sym.TILDE); }
"!"   { return tok(sym.NOT); }
. { err("Illegal character: " + yytext()); }
