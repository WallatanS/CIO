package Léxico;
import java.io.IOException;
import java.util.Scanner;

public class lexica {
    public static void Analize_Lexica() throws InterruptedException, IOException{
        Scanner imput = new Scanner(System.in);
        String cod, buff = " ";
        int pont = 0/*, line = 0, coluna = 0*/;
        System.out.println(" Código Para Análize Léxica ");
        System.out.println(" inserir código ");
        cod = imput.nextLine();
        imput.close();
        cod = cod + " ";
        int tam = cod.length();
        operandos.verifica(cod, pont, tam, buff);
        char Character = cod.charAt(pont);
        operandos.chamada(cod, pont, tam, Character, buff);
    }
}
