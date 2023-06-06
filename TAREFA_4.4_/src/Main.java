import java.io.*;

class Main {
    public static void main(String[] args)   
    throws Exception {
        //## Para ler a entrada do teclado
        // Scanner scanner = new Scanner(System.in);
        
        //Para ler a entrada do arquivo  
        FileReader in = new FileReader("teste.txt");
        Scanner scanner = new Scanner(in);
        
        parser parser = new parser(scanner);
        parser.parse();
        parser.imprimeRelatorio();
        System.out.println("Arquivo sem erros de sintaxe!");

    }
}
