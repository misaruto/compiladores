import java.io.FileReader;
import error.*;

class Main {
    public static void main(String[] args)   
    throws Exception {
        ListError lsError = new ListError();
        FileReader in = new FileReader("teste.txt");
        Scanner scanner = new Scanner(in,lsError);
        parser parser = new parser(scanner);

        parser.parse();
        if(lsError.hasError()){
            lsError.dump();
            System.out.println("Arquivo com erros de sintaxe!");
            return;
        }
        System.out.println("Arquivo sem erros de sintaxe!");
    }
}
