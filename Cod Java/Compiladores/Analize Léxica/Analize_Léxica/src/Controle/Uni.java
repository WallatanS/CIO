package Controle;

import java.io.IOException;
import java.util.Scanner;
import Sintatico.Sintático;

public class Uni{
   
    public static void start() throws InterruptedException, IOException{
        int cond=0;
        menu(cond);
    }

    public static void menu(int cond) throws InterruptedException, IOException{
        System.out.println("------------");
        System.out.println("Opção:      ");
        System.out.println("Léxico:    1");
        System.out.println("Sintático: 2");
        System.out.println("------------");
        Scanner imput = new Scanner(System.in);
        cond = imput.nextInt();
        if (cond == 1)
            lexico();
        if (cond == 2)
            sintatico();
        else 
            System.out.println("Erro");
    }

    public static void sintatico(){
        Sintático sintatico = new Sintático();
        sintatico.ini();
    }

    public static void lexico() throws InterruptedException, IOException{
        Léxico.lexica.Analize_Lexica();
    }

}
