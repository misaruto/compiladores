import java_cup.runtime.Symbol;
import error.ListError;
%%

%class Scanner
%unicode
%cup
%line
%column

%{  
  private ListError lsError;
  public Scanner(java.io.FileReader in,ListError lsError) {
    this(in);
    this.lsError = lsError;
  }
  public void defineError(int line, int column, String message){
    lsError.defineError(line, column, message);
  }
  public void defineError(int line, int column){
    lsError.defineError(line, column);
  }
  public void defineError(String message){
    lsError.defineError(message);
  }
  private Symbol createSymbol(int type, Object value){
    return new Symbol(type, yyline, yycolumn, value);
  }
  private Symbol createSymbol(int type){
    return new Symbol(type, yyline, yycolumn);
  }

  private void print(String s){
    System.out.println(s);
  }

%}

digito = [0-9]
letra = [a-zA-Z]
digitos = {digito}+
ident = {letra}({letra}|{digito})*

aspas = \"|\'
str = {aspas} * {aspas}
opRelacional = ">"|"<"|">="|"<="|"=="|"!="
opLogico = "&&"|"||"|"!"| "and" | "or" | "not"

fimdeLinha = \r|\n|\r\n
espaco = {fimdeLinha} | [\t\f] | \s | " "

%%

{digitos} {System.out.println("numbewr "+yytext()); return this.createSymbol(sym.NUMBER,yytext()); }

"main" { return this.createSymbol(sym.KW_MAIN);}

"if" {  return this.createSymbol(sym.KW_IF);}
"else" { return this.createSymbol(sym.KW_ELSE);}
"while" { return this.createSymbol(sym.KW_WHILE);}
"do" { return this.createSymbol(sym.KW_DO);}

{opRelacional} { return this.createSymbol(sym.OP_RELACIONAL, yytext());}
{opLogico} { this.print(yytext()); return this.createSymbol(sym.OP_LOGICO, yytext());}

{ident} { return this.createSymbol(sym.IDENT, yytext());}
"=" { return this.createSymbol(sym.EQUAL);}
"+" { return this.createSymbol(sym.MAIS);}
"-" {  System.out.println("MENOS"); return this.createSymbol(sym.MENOS);}
"/" { return this.createSymbol(sym.DIV);}
"*" { return this.createSymbol(sym.MULT);}
"%" { return this.createSymbol(sym.MOD);}
";" { return this.createSymbol(sym.PTVIRG);}
"(" { return this.createSymbol(sym.ABRE_PARENT);}
")" { return this.createSymbol(sym.FECHA_PARENT);}
"[" { return this.createSymbol(sym.ABRE_COLCH);}
"]" { return this.createSymbol(sym.FECHA_COLCH);}
"{" { return this.createSymbol(sym.ABRE_CHAVE);}
"}" { return this.createSymbol(sym.FECHA_CHAVE);}
"." { return this.createSymbol(sym.PTO);}

{espaco} {/* despreza */ }

\n { /* Caractere inválido */   
  return new Symbol(sym.EOF, yyline, yycolumn, yytext());    
}