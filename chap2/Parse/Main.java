package Parse;
import java.io.PrintWriter;

public class Main {

  public static void main(String argv[]) throws java.io.IOException {
    for (int i = 0; i < argv.length; ++i) {
      String filename = argv[i];
      if (argv.length > 1)
	System.out.println("***Processing: " + filename);
      ErrorMsg.ErrorMsg errorMsg = new ErrorMsg.ErrorMsg(filename);
      java.io.InputStream inp=new java.io.FileInputStream(filename);
      Lexer lexer = new Yylex(inp,errorMsg);
      java_cup.runtime.Symbol tok;

      do {
	 String extra = "";
         tok=lexer.nextToken();
	 switch (tok.sym) {
	 case sym.ID:     extra = "\t$" + tok.value; break;
	 case sym.DECIMAL_LITERAL: extra = "\t#" + tok.value; break;
   case sym.STRING_LITERAL:  extra = " \"" + tok.value + "\""; break;
   case sym.CHAR_LITERAL:    extra = "\t'" + tok.value + "'"; break;
	 }
	 System.out.println(symnames[tok.sym] + " " + tok.left + extra);
      } while (tok.sym != sym.EOF);

      inp.close();
    }
  }

  static String symnames[] = new String[100];
  static {
     
     symnames[sym.DECIMAL_LITERAL] = "DECIMAL_LITERAL";
     symnames[sym.STRING_LITERAL] = "STRING_LITERAL";
     symnames[sym.CHAR_LITERAL] = "CHAR_LITERAL";
     symnames[sym.EOF] = "EOF";
     symnames[sym.INT] = "INT";
     symnames[sym.GT] = "GT";
     symnames[sym.DIVIDE] = "DIVIDE";
     symnames[sym.COLON] = "COLON";
     symnames[sym.ELSE] = "ELSE";
     symnames[sym.OR] = "OR";
     symnames[sym.DO] = "DO";
     symnames[sym.GE] = "GE";
     symnames[sym.error] = "error";
     symnames[sym.LT] = "LT";
     symnames[sym.MINUS] = "MINUS";
     symnames[sym.FOR] = "FOR";
     symnames[sym.TIMES] = "TIMES";
     symnames[sym.COMMA] = "COMMA";
     symnames[sym.LE] = "LE";
     symnames[sym.ASSIGN] = "ASSIGN";
     symnames[sym.LPAREN] = "LPAREN";
     symnames[sym.RPAREN] = "RPAREN";
     symnames[sym.IF] = "IF";
     symnames[sym.SEMICOLON] = "SEMICOLON";
     symnames[sym.ID] = "ID";
     symnames[sym.WHILE] = "WHILE";
     symnames[sym.LBRACK] = "LBRACK";
     symnames[sym.RBRACK] = "RBRACK";
     symnames[sym.NEQ] = "NEQ";
     symnames[sym.VAR] = "VAR";
     symnames[sym.BREAK] = "BREAK";
     symnames[sym.AND] = "AND";
     symnames[sym.PLUS] = "PLUS";
     symnames[sym.LBRACE] = "LBRACE";
     symnames[sym.RBRACE] = "RBRACE";
     symnames[sym.EQ] = "EQ";
     symnames[sym.AUTO] = "AUTO";
symnames[sym.DOUBLE] = "DOUBLE";
symnames[sym.STRUCT] = "STRUCT";
symnames[sym.LONG] = "LONG";
symnames[sym.SWITCH] = "SWITCH";
symnames[sym.CASE] = "CASE";
symnames[sym.ENUM] = "ENUM";
symnames[sym.REGISTER] = "REGISTER";
symnames[sym.TYPEDEF] = "TYPEDEF";
symnames[sym.CHAR] = "CHAR";
symnames[sym.EXTERN] = "EXTERN";
symnames[sym.RETURN] = "RETURN";
symnames[sym.UNION] = "UNION";
symnames[sym.CONST] = "CONST";
symnames[sym.FLOAT] = "FLOAT";
symnames[sym.SHORT] = "SHORT";
symnames[sym.UNSIGNED] = "UNSIGNED";
symnames[sym.CONTINUE] = "CONTINUE";
symnames[sym.SIGNED] = "SIGNED";
symnames[sym.VOID] = "VOID";
symnames[sym.DEFAULT] = "DEFAULT";
symnames[sym.GOTO] = "GOTO";
symnames[sym.SIZEOF] = "SIZEOF";
symnames[sym.VOLATILE] = "VOLATILE";
symnames[sym.STATIC] = "STATIC";
symnames[sym.FUN] = "FUN";
   }

}
