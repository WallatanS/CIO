package Léxico;
import java.io.IOException;

import Sintatico.Lista;

public class operandos{

    static void verifica(String cod, int pont, int tam, String buff) throws InterruptedException, IOException {
        int ponte=0, n=0;
        char Character = cod.charAt(pont);
        for (ponte=0; ponte <tam; ponte++) {
            Character = cod.charAt(pont);
            if ((Character >= 'a' && Character <= 'z' || Character >= '0' && Character <= '9') ||(Character == '<' || Character == '>' || Character == '(' || Character == ')' || Character == '-' || Character == '+' || Character == '/' || Character == '*' || Character == '{' || Character == '}' || Character == ';' || Character == '=') || (Character == ' ')) {
                n++;
                System.out.println(n);
            } 
            else {
                System.out.println("Carcetere Inválido na posição: "+n);
                System.exit(1);
            }
            new ProcessBuilder("cmd", "/c", "cls").inheritIO().start().waitFor();
        }

    }

    static void chamada(String cod, int pont, int tam, char Character, String buff){
        int start;
        System.out.println("|Pavras Reservadas   |Posição    |Lexema     |Linha     |Coluna"); 
        do{
            start = pont;
            pont = busca(cod, pont, tam, Character, buff, start);
        } while (tam > 0 && pont<tam);
        System.exit(1);
    }

    static int busca(String cod, int pont, int tam, char Character, String buff, int start) { 
        buff = buff + cod.charAt(pont);
        Character = cod.charAt(pont);
        if (Character == '<' || Character == '>' || Character == '(' || Character == ')' || Character == '-' || Character == '+' || Character == '/' || Character == '*' || Character == '{' || Character == '}' || Character == ';' || Character == '='){
            return Characterespecial(cod, pont, buff, start);
        }
        
        if (Character == 'i' || Character == 'e' || Character == 'b' || Character == 't' || Character == 'w' || Character == 'd' || Character == 'f' || Character == 'r'){
            if (Character == 'i' ){
                return automato.q1(cod, pont, buff, start);                
            }
            if (Character == 'e' ){
                return automato.q2(cod, pont, buff, start);                
            }
            if (Character == 'b' ){
                return automato.q3(cod, pont, buff, start);                
            }
            if (Character == 't' ){
                return automato.q4(cod, pont, buff, start);                
            }
            if (Character == 'w' ){
                return automato.q5(cod, pont, buff, start);                
            }
            if (Character == 'd' ){
                return automato.q6(cod, pont, buff, start);                
            }
            if (Character == 'f' ){
                return automato.q7(cod, pont, buff, start);                
            }
            if (Character == 'r' ){
                return automato.q8(cod, pont, buff, start);                
            }
        }
        
        if (Character == ' ' ){
            pont++;
            return pont;
        }
        
        if (Character >= 'a' && Character <= 'z' || Character >= '0' && Character <= '9') {
            return id(start, pont, cod);
        }   
        return pont;      
    }

    static int valida (String cod, int pont, String buff, int start, int cont, int vari){
        char Character = cod.charAt(pont);
        if (Character >= 'a' && Character <= 'z' || Character >= '0' && Character <= '9') {
            return id(start, pont, cod); 
        } 
        
        if ((Character == '<' || Character == '>' || Character == '(' || Character == ')' || Character == '-' || Character == '+' || Character == '/' || Character == '*' || Character == '{' || Character == '}' || Character == ';' || Character == '=') && (vari==1)){
            //pont = id(start, pont-1, cod);
            print(cod, pont, start, cont);
            pont = Characterespecial(cod, pont, buff, start);        
            return pont;
        }
        
        if (Character == '<' || Character == '>' || Character == '(' || Character == ')' || Character == '-' || Character == '+' || Character == '/' || Character == '*' || Character == '{' || Character == '}' || Character == ';' || Character == '='){
            pont = id(start, pont-1, cod);
            //print(cod, pont, start, cont);
            pont = Characterespecial(cod, pont, buff, start);        
            return pont;
        }

        if (Character == ' '){
            pont = id(start, pont-1, cod);
            return pont;
        }
        
        return Character;
    }

    static int Characterespecial(String cod, int pont, String buff, int start) {
        char character = cod.charAt(pont);
        pont++; 
        if (character == '('){
            String asString = Character.toString(character);
            print_operando(asString, start);
            return pont;
        }
        
        if (character == ')'){
            String asString = Character.toString(character);
            print_operando(asString, start);
            return pont;
        }

        if (character == '<'){
            String asString = Character.toString(character);
            print_operando(asString, start);
            return pont;
        }

        if (character == '>'){
            String asString = Character.toString(character);
            print_operando(asString, start);
            return pont;
        }

        if (character == '='){
            String asString = Character.toString(character);
            print_operando(asString, start);
            return pont;
        }
        if (character == '-'){
            String asString = Character.toString(character);
            print_operando(asString, start);
            return pont;
        }

        if (character == '+'){
            String asString = Character.toString(character);
            print_operando(asString, start);
            return pont;
        }

        if (character == '/'){
            String asString = Character.toString(character);
            print_operando(asString, start);
            return pont;
        }

        if (character == '*'){
            String asString = Character.toString(character);
            print_operando(asString, start);
            return pont;
        }

        if (character == '{'){
            String asString = Character.toString(character);
            print_operando(asString, start);
            return pont;
        }

        if (character == '}'){
            String asString = Character.toString(character);
            print_operando(asString, start);
            return pont;
        }

        if (character == ';'){
            String asString = Character.toString(character);
            print_operando(asString, start);
            return pont;
        } else{
            return pont;
        }
    }

    static int id (int start, int pont, String cod) {
        char Character = cod.charAt(pont);
        String buff = " ";
        int cont;
        
        if (Character == '<' || Character == '>' || Character == '(' || Character == ')' || Character == '-' || Character == '+' || Character == '/' || Character == '*' || Character == '{' || Character == '}' || Character == ';' || Character == '='){
            for(cont = start; cont <= pont; cont++){
                Character = cod.charAt(cont);
                buff += Character;
                Character = cod.charAt(pont+1);

                if (Character != ' ' && pont <= cont){
                    if (Character == '<' || Character == '>' || Character == '(' || Character == ')' || Character == '-' || Character == '+' || Character == '/' || Character == '*' || Character == '{' || Character == '}' || Character == ';'){
                        System.out.println("| id | "+(start)+" | "+buff);
                        String texto = "id";
                        Lista.add(texto);
                        return Characterespecial(cod, pont, buff, start);        
                    }else{
                        pont++;
                    }  
                }
            } 
            return Characterespecial(cod, pont, buff, start);          
        }

        if (Character != ' '){
            for(cont = start; cont <= pont; cont++){
                Character = cod.charAt(cont);
                buff += Character;
                Character = cod.charAt(pont+1);

                if (Character != ' ' && pont <= cont){
                    if (Character == '<' || Character == '>' || Character == '(' || Character == ')' || Character == '-' || Character == '+' || Character == '/' || Character == '*' || Character == '{' || Character == '}' || Character == ';' || Character == '='){
                        System.out.println("| id | "+(start)+" | "+buff);
                        String texto = "id";
                        Lista.add(texto);
                        return Characterespecial(cod, pont, buff, start);        
                    }else{
                        pont++;
                    }  
                }
            }
            System.out.println("| id | "+(start)+" | "+buff);
            String texto = "id";
            Lista.add(texto); 
            return Characterespecial(cod, pont, buff, start);
        }

        pont++;
        return pont;
    }

    static void print_operando (String Character, int pont){
        System.out.println("| "+ Character+" | "+ (pont));
        Lista.add(Character);
    }

    static void print (String cod, int pont, int start, int cont){
        String asString = Character.toString(cod.charAt(start));
        String texto = "";

        for (int i = start; i < pont; i++){
            asString = Character.toString(cod.charAt(i));
            texto = texto + asString; 
        }
        System.out.println("| " + texto + " | " + (pont-cont));
        Lista.add(texto);
    }

}