//import java.io.IOException;
import java.util.Scanner;

//Máquina de Turing C inicio, D Fim.

public class Turing {
     
    public static void main(String[] args){
        Scanner imput = new Scanner(System.in);
        System.out.println("Programa de Turing");
        Turing.insert(imput);
    }

    static void insert (Scanner imput){
        String dados = "c";
        System.out.println("Informes valores de a e b");
        dados = dados + imput.next();
        dados = dados + "d";
        Turing.valida(dados);
        Turing.logic(dados);
    }

    static void logic(String dados){
        //lógica de estados

        if ( dados == "c" ){
            
        }
    }

    static void valida (String dados){

    }
}