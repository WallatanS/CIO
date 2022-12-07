package Sintatico;
public class Sintático {
    public void ini(){
        Pilha pilha = new Pilha();
        pilha.iniciar();

        Lista lista = new Lista();
        lista.iniciar();
        lista.modelo1();
        //lista.modelo2();
        //lista.modelo3();
        //lista.modelo4();
        boolean state = true, fim = false;

        int tamanho = Lista.lista.size();
        int posLista = 0;
        
        String valor = "";
        operando(pilha, lista, tamanho, valor, posLista, state, fim);
    }

    public void operando(Pilha pilha, Lista lista, int tamanho, String valor, int posLista, boolean state, boolean fim){       
        do{ 
            valor = pilha.topo();  
                switch (valor){
                    case "$": 
                        System.out.println("$");
                        fim = true;
                        break;

                    case "<COD>":
                        pilha.desempilhar();
                        state=cod(pilha, lista, posLista);
                        break;

                    case "<C>":
                        pilha.desempilhar();
                        state=c(pilha, lista, posLista);
                        break;

                    case "<C_LIST>":
                        break;

                    case "<IF>":
                        pilha.desempilhar();
                        state=if_(pilha, lista, posLista);
                        break;

                    case "<ELSE>":
                        pilha.desempilhar();
                        state=else_(pilha, lista, posLista);
                        break;

                    case "<WHILE>":
                        pilha.desempilhar();
                        state=while_(pilha, lista, posLista);
                        break;

                    case "<WRITE>":
                        pilha.desempilhar();
                        state=write_(pilha, lista, posLista);
                        break;

                    case "<E>":
                        pilha.desempilhar();
                        state=e_(pilha, lista, posLista);
                        break;

                    case "<TYPE>":
                        pilha.desempilhar();
                        state=type_(pilha, lista, posLista);
                        break;

                    case "<VAR>":
                        pilha.desempilhar();
                        state=var_(pilha, lista, posLista);
                        break;

                    case "<COND>":
                        pilha.desempilhar();
                        state=cond_(pilha, lista, posLista);
                        break;

                    case "<COMPARADOR>":
                        break;

                    case "<EQUALS>":
                        pilha.desempilhar();
                        state=equals(pilha, lista, posLista);
                        break;

                    case "<FOR>":
                        pilha.desempilhar();
                        state=for_(pilha, lista, posLista);
                        break;

                    case "<ATRI>":
                        pilha.desempilhar();
                        state=atri_(pilha, lista, posLista);
                        break;

                    case "<EXP>":
                        pilha.desempilhar();
                        state=exp_(pilha, lista, posLista);
                        break;

                    case "<TERMO>":
                        pilha.desempilhar();
                        state=termo_(pilha, lista, posLista);
                        break;

                    case "<FATOR>":
                        pilha.desempilhar();
                        state=fator_(pilha, lista, posLista);
                        break;

                    case "<FATORTAIL>":                
                        pilha.desempilhar();
                        state=fatortail_(pilha, lista, posLista);
                        break;

                    case "<ITEM>":
                        pilha.desempilhar();
                        state=item_(pilha, lista, posLista);
                        break;

                    case "<SOMA>":
                        pilha.desempilhar();
                        state=soma_(pilha, lista, posLista);
                        break;
                    
                    case "<MULT>":
                        pilha.desempilhar();
                        state=mult_(pilha, lista, posLista);
                        break;
                        
                    case "<CADATRI>":
                        pilha.desempilhar();
                        state=cadatri_(pilha, lista, posLista);
                        break;

                    case "<READ>":
                        pilha.desempilhar();
                        state=read_(pilha, lista, posLista);
                        break;  
                    default: 
                        state = valida(valor, lista, posLista);
                        break;      
            }   
            if(pilha.topo().equals(lista.lista.get(posLista))){
                if(pilha.topo().equals("$"))
                    fim=true;
                else{
                    pilha.desempilhar();
                    if (posLista < tamanho-1)
                        posLista++;   
                }
            }
        }while(posLista <= tamanho && !fim && state);
        
        if(fim==true){
            System.out.println(" Analise sintática concluida");
        }
        
        else{
            System.out.println(" Erro Sintático");
            System.out.println(" | " + lista.lista.get(posLista) + " | não esperado");
        }
    }


    public boolean cod (Pilha pilha, Lista lista, int posLista){
        if(lista.lista.get(posLista).equals("$") || lista.lista.get(posLista).equals("}")){
            return true;
        }

        else if(lista.lista.get(posLista).equals("id") || lista.lista.get(posLista).equals("int") ||
        lista.lista.get(posLista).equals("if") || lista.lista.get(posLista).equals("while") ||
        lista.lista.get(posLista).equals("write") || lista.lista.get(posLista).equals("for")){
        
            pilha.empilhar("<COD>");
            pilha.empilhar("<C>");
            return true;
        }
        return false;
    }

    public boolean c (Pilha pilha, Lista lista, int posLista){
        if(lista.lista.get(posLista).equals("id")){
            pilha.empilhar("<ATRI>");
            return true;
        }

        else if(lista.lista.get(posLista).equals("int")){
            pilha.empilhar("<VAR>");
            return true;
        }

        else if(lista.lista.get(posLista).equals("if")){
            pilha.empilhar("<IF>");
            return true;
        }

        else if(lista.lista.get(posLista).equals("while")){
            pilha.empilhar("<WHILE>");
            return true;
        }

        else if(lista.lista.get(posLista).equals("write")){
            pilha.empilhar("<WRITE>");
            return true;
        }

        else if(lista.lista.get(posLista).equals("for")){
            pilha.empilhar("<FOR>");
            return true;
        }
        return false;
    }

    public boolean if_ (Pilha pilha, Lista lista, int posLista){
        if(lista.lista.get(posLista).equals("if")){
            pilha.empilhar("<ELSE>");
            pilha.empilhar("}");
            pilha.empilhar("<COD>");
            pilha.empilhar("{");
            pilha.empilhar("then");
            pilha.empilhar(")");
            pilha.empilhar("<COND>");
            pilha.empilhar("(");
            pilha.empilhar("if");           
            return true;
        }
        return false;
    }

    public boolean else_ (Pilha pilha, Lista lista, int posLista){
        if(lista.lista.get(posLista).equals("}") || lista.lista.get(posLista).equals("id") || lista.lista.get(posLista).equals("int") || lista.lista.get(posLista).equals("if") || lista.lista.get(posLista).equals("while") || lista.lista.get(posLista).equals("write") || lista.lista.get(posLista).equals("for")){
           return true;
        }
        
        if(lista.lista.get(posLista).equals("else")){
            pilha.empilhar("}");
            pilha.empilhar("<COD>");
            pilha.empilhar("{");
            pilha.empilhar("then");
            pilha.empilhar(")");
            pilha.empilhar("<COND>");
            pilha.empilhar("(");
            pilha.empilhar("else");
            return true;
        }
        return false;
    }

    public boolean while_ (Pilha pilha, Lista lista, int posLista){
        if(lista.lista.get(posLista).equals("while")){
            pilha.empilhar("<COD>");
            pilha.empilhar("{");
            pilha.empilhar("then");
            pilha.empilhar(")");
            pilha.empilhar("<COND>");
            pilha.empilhar("(");
            pilha.empilhar("while");
            return true;
        }
        return false;
    }

    public boolean write_ (Pilha pilha, Lista lista, int posLista){
        if(lista.lista.get(posLista).equals("write")){
            pilha.empilhar(")");
            pilha.empilhar("<E>");
            pilha.empilhar("(");
            pilha.empilhar("write");
            return true;
        }
        return false;
    }

    public boolean e_ (Pilha pilha, Lista lista, int posLista){
        if(lista.lista.get(posLista).equals("id")){
            pilha.empilhar("id");
            return true;
        }
        if(lista.lista.get(posLista).equals("num")){
            pilha.empilhar("num");
            return true;
        }
        return false;
    }

    public boolean type_ (Pilha pilha, Lista lista, int posLista){
        if(lista.lista.get(posLista).equals("int")){
            pilha.empilhar("int");
            return true;
        }
        return false;
    }

    public boolean var_ (Pilha pilha, Lista lista, int posLista){
        if(lista.lista.get(posLista).equals("int")){
            pilha.empilhar("id");
            pilha.empilhar("<TYPE>");
            return true;
        }
        return false;
    }

    public boolean cond_ (Pilha pilha, Lista lista, int posLista){
        if(lista.lista.get(posLista).equals("(") || lista.lista.get(posLista).equals("id") || lista.lista.get(posLista).equals("num")){
            pilha.empilhar("<COND>");
            pilha.empilhar("<EXP>");
            return true;
        }

        if(lista.lista.get(posLista).equals(";") || lista.lista.get(posLista).equals(")")){
            return true;
        }

        if(lista.lista.get(posLista).equals("<") || lista.lista.get(posLista).equals(">") || lista.lista.get(posLista).equals("=")){
            pilha.empilhar("<COND>");
            pilha.empilhar("<EQUALS>");
            return true;
        }
        return false;
    }

    public boolean equals (Pilha pilha, Lista lista, int posLista){
        if(lista.lista.get(posLista).equals(">")){
            pilha.empilhar(">");
            return true;
        }

        if(lista.lista.get(posLista).equals("<")){
            pilha.empilhar("<");
            return true;
        }

        if(lista.lista.get(posLista).equals("=")){
            pilha.empilhar("=");
            return true;
        }
        return false;
    }

    public boolean for_ (Pilha pilha, Lista lista, int posLista){
        if(lista.lista.get(posLista).equals("for")){
            pilha.empilhar("}");
            pilha.empilhar("<COD>");
            pilha.empilhar("{");
            pilha.empilhar("then");
            pilha.empilhar(")");
            pilha.empilhar("<SOMA>");
            pilha.empilhar("id");
            pilha.empilhar(";");
            pilha.empilhar("<COND>");
            pilha.empilhar(";");
            pilha.empilhar("num");
            pilha.empilhar("=");
            pilha.empilhar("id");
            pilha.empilhar("(");
            pilha.empilhar("for");
            return true;
        }
        return false;
    }

    public boolean atri_ (Pilha pilha, Lista lista, int posLista){
        if(lista.lista.get(posLista).equals("id")){
            pilha.empilhar("<CADATRI>");
            pilha.empilhar("=");
            pilha.empilhar("id");
            return true;
        } 
        return false;   
    }

    public boolean exp_ (Pilha pilha, Lista lista, int posLista){
        if(lista.lista.get(posLista).equals("id") || lista.lista.get(posLista).equals("(") ||
        lista.lista.get(posLista).equals("num")){
            
            pilha.empilhar("<TERMO>");
            pilha.empilhar("<FATOR>");
            return true;
        }    
        return false;
    }

    public boolean termo_ (Pilha pilha, Lista lista, int posLista){
        if(lista.lista.get(posLista).equals("$") || lista.lista.get(posLista).equals("(") ||
         lista.lista.get(posLista).equals(")") || lista.lista.get(posLista).equals("<") ||
          lista.lista.get(posLista).equals(">") || lista.lista.get(posLista).equals("=") ||
           lista.lista.get(posLista).equals("}") || lista.lista.get(posLista).equals(";") || 
           lista.lista.get(posLista).equals("id") || lista.lista.get(posLista).equals("num") ||
            lista.lista.get(posLista).equals("int") || lista.lista.get(posLista).equals("if") ||
             lista.lista.get(posLista).equals("while") || lista.lista.get(posLista).equals("write") ||
              lista.lista.get(posLista).equals("for")){
            return true;
        }
        if(lista.lista.get(posLista).equals("-") || lista.lista.get(posLista).equals("+")){
            pilha.empilhar("<TERMO>");
            pilha.empilhar("<FATOR>");
            pilha.empilhar("<SOMA>");
            return true;
        } 
        return false;
    }

    public boolean fator_ (Pilha pilha, Lista lista, int posLista){
        if(lista.lista.get(posLista).equals("id") || lista.lista.get(posLista).equals("(") || lista.lista.get(posLista).equals("num")){
            pilha.empilhar("<FATORTAIL>");
            pilha.empilhar("<ITEM>"); 
            return true;
        }
        return false;
    }    

    public boolean fatortail_ (Pilha pilha, Lista lista, int posLista){
        if(lista.lista.get(posLista).equals("$") || lista.lista.get(posLista).equals("(") || lista.lista.get(posLista).equals(")") || lista.lista.get(posLista).equals("<") || lista.lista.get(posLista).equals(">") || lista.lista.get(posLista).equals("=")|| lista.lista.get(posLista).equals("-")|| lista.lista.get(posLista).equals("+") || lista.lista.get(posLista).equals("}") || lista.lista.get(posLista).equals(";") || lista.lista.get(posLista).equals("id") || lista.lista.get(posLista).equals("num") || lista.lista.get(posLista).equals("int") || lista.lista.get(posLista).equals("if") || lista.lista.get(posLista).equals("while") || lista.lista.get(posLista).equals("write") || lista.lista.get(posLista).equals("for")){
            return true;
        }
        if(lista.lista.get(posLista).equals("/") || lista.lista.get(posLista).equals("*")){
            pilha.empilhar("<FATORTAIL>");
            pilha.empilhar("<ITEM>"); 
            pilha.empilhar("<MULT>");
            return true;
        }
        return false;
    }    

    public boolean item_ (Pilha pilha, Lista lista, int posLista){
        if(lista.lista.get(posLista).equals("(")){
            pilha.empilhar(")");
            pilha.empilhar("<EXP>"); 
            pilha.empilhar("(");
            return true;
        }

        if(lista.lista.get(posLista).equals("id")){
            pilha.empilhar("id");
            return true;
        }

        if(lista.lista.get(posLista).equals("num")){
            pilha.empilhar("num");
            return true;
        }

        if(lista.lista.get(posLista).equals("/") || lista.lista.get(posLista).equals("*")){
            pilha.empilhar("<FATORTAIL>");
            pilha.empilhar("<ITEM>"); 
            pilha.empilhar("<MULT>");
            return true;
        }
        return false;
    }

    public boolean cadatri_ (Pilha pilha, Lista lista, int posLista){
        if(lista.lista.get(posLista).equals("(") || lista.lista.get(posLista).equals("id") || lista.lista.get(posLista).equals("num") || lista.lista.get(posLista).equals(";") || lista.lista.get(posLista).equals("read")){
            pilha.empilhar("<EXP>");
            return true;
        }

        if(lista.lista.get(posLista).equals("read")){
            pilha.empilhar("<READ>");
            return true;
        }
        return false;
    }

    public boolean read_ (Pilha pilha, Lista lista, int posLista){
        if(lista.lista.get(posLista).equals("read")){
            pilha.empilhar("read");
            return true;
        }
        return false;
    }

    public boolean soma_ (Pilha pilha, Lista lista, int posLista){
        if(lista.lista.get(posLista).equals("+")){
            pilha.empilhar("+");
            return true;
        }
        if(lista.lista.get(posLista).equals("-")){
            pilha.empilhar("-");
            return true;
        }
        return false;
    }

    boolean mult_ (Pilha pilha, Lista lista, int posLista){
        if(lista.lista.get(posLista).equals("+")){
            pilha.empilhar("*");
            return true;
        }
        if(lista.lista.get(posLista).equals("-")){
            pilha.empilhar("/");
            return true;
        }
        return false;
    }

    public boolean valida (String valor, Lista lista, int posLista){
        if(lista.lista.get(posLista).equals("(")  || lista.lista.get(posLista).equals(")") || lista.lista.get(posLista).equals("=") || lista.lista.get(posLista).equals("-") ||
        lista.lista.get(posLista).equals("+") || lista.lista.get(posLista).equals("*") || lista.lista.get(posLista).equals("/")|| lista.lista.get(posLista).equals("{")||
        lista.lista.get(posLista).equals("}") || lista.lista.get(posLista).equals(";")|| lista.lista.get(posLista).equals("int")|| lista.lista.get(posLista).equals("end")||
        lista.lista.get(posLista).equals("begin")|| lista.lista.get(posLista).equals("if")|| lista.lista.get(posLista).equals("else")|| lista.lista.get(posLista).equals("write")||
        lista.lista.get(posLista).equals("for")|| lista.lista.get(posLista).equals("read")|| lista.lista.get(posLista).equals("id")|| lista.lista.get(posLista).equals("num")||
        lista.lista.get(posLista).equals("then")){
            return true;
        }
        return false;
    }
}
