import java_cup.runtime.Symbol;

%%

%class Scanner
%unicode
%cup
%line
%column

%{  //código para ler direto do teclado
    public Scanner(java.io.InputStream in) {
      this(new java.io.InputStreamReader(in, java.nio.charset.Charset.forName("UTF-8")));
    }
%}

digito = [0-9]
letra = [a-zA-Z]
digitos = [0-9]+
ident = {letra}({letra}|{digito})*

fimdeLinha = \r|\n|\r\n
espaco = {fimdeLinha} | [ \t\f]

%%

{digitos} { 
  System.out.println("numbewr "+yytext());
  double aux = Double.parseDouble(yytext());
  return new Symbol(sym.NUMBER, new Double(aux)); 
}

"if" { return new Symbol(sym.KW_IF);}

{ident} { return new Symbol(sym.IDENT, yytext());}

"=" { return new Symbol(sym.EQUAL);}
"+" { return new Symbol(sym.MAIS);}
"-" { System.out.println("MENOS"); return new Symbol(sym.MENOS);}
"/" { return new Symbol(sym.DIV);}
"*" { return new Symbol(sym.MULT);}
"%" { return new Symbol(sym.MOD);}
";" { return new Symbol(sym.PTVIRG);}
"(" { return new Symbol(sym.ABRE_PARENT);}
")" { return new Symbol(sym.FECHA_PARENT);}
"[" { return new Symbol(sym.ABRE_COLCH);}
"]" { return new Symbol(sym.FECHA_COLCH);}
"." { return new Symbol(sym.PTO);}

{espaco} { /* despreza */ }

\n { /* Caractere inválido */     
  return new Symbol(sym.EOF, yyline, yycolumn, yytext());    
}