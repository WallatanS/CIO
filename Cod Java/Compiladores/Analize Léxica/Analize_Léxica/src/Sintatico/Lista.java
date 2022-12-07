package Sintatico;
import java.util.ArrayList;

public class Lista {
    static ArrayList<String> lista;
    static int pont;

    public void iniciar(){
        this.lista = new ArrayList<>();
        this.pont = -1;
    }
    
    public static void add (String texto) {
        lista.add(texto);
        pont++;
    }

    public static void modelo1(){
        lista.add("int");
        lista.add("id");
        lista.add("if");
        lista.add("(");
        lista.add("id");
        lista.add("<");
        lista.add("num");
        lista.add(")");
        lista.add("then");
        lista.add("{");
        lista.add("id");
        lista.add("=");
        lista.add("num");
        lista.add("}");
    }

    public static void modelo2 (){
        lista.add("int");
        lista.add("id");
        lista.add("if");
        lista.add("(");
        lista.add("id");
        lista.add("=");
        lista.add("num");
        lista.add(")");
        lista.add("then");
        lista.add("{");
        lista.add("id");
        lista.add("=");
        lista.add("num");
        lista.add("}");
    }
    
    public void modelo3 (){
        lista.add("int");
        lista.add("id");
        lista.add("for");
        lista.add("(");
        lista.add("id");
        lista.add("=");
        lista.add("num");
        lista.add(";");
        lista.add("id");
        lista.add("<");
        lista.add("num");
        lista.add(";");
        lista.add("id");
        lista.add("+");
        lista.add(")");
        lista.add("then");
        lista.add("{");
        lista.add("id");
        lista.add("=");
        lista.add("num");
        lista.add("}");
    }

    public void modelo4 (){
        lista.add("int");
        lista.add("id");
        lista.add("for");
        lista.add("(");
        lista.add("id");
        lista.add("=");
        lista.add("num");
        lista.add(";");
        lista.add("id");
        lista.add("<");
        lista.add("num");
        lista.add(";");
        lista.add("id");
        lista.add("+");
        lista.add(")");
        lista.add("then");
        lista.add("{");
        lista.add("id");
        lista.add("=");
        lista.add("num");
        lista.add("}");
    }




}
