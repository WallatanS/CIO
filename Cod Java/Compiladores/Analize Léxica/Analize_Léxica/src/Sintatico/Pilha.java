package Sintatico;
public class Pilha {
    
    public String[] Pilha;
    public int posPilha;
    
    public Pilha(){
        this.posPilha = -1;//inicia pilha com pos = -1, indicando que esta vazia
        this.Pilha = new String[50];//Cria a pilha com 200 espaços
    }

    public String topo(){
        return this.Pilha[(this.posPilha)];
    }
    
    public boolean pilhaVazia(){
        if(posPilha==-1){
            return true;//se posPilha=-1, retorna verdadeiro
        }
        return false;//se nao retorna false
    }
    
    public int tamanho(){
        if (this.pilhaVazia()){
            return 0;// se pilhaVazia retorna true, retorna 0
        }
        return posPilha + 1;// se nao retorna a qauntidade de itens na pilha
    }
    
    public void empilhar(String valor){
        if(this.posPilha < (this.Pilha.length -1)){
            this.posPilha++;//incrementa 1 ao topo da pilha
            this.Pilha[posPilha] = valor;//adiciona o item no topo
        }
    }
    
    public String desempilhar(){
        if(pilhaVazia()){
            return null;//checa se vazia, se sim, encerra o metodo
        }
        System.out.println(this.topo());
        this.posPilha--;
        return this.Pilha[(this.posPilha+1)];
    }
    
    public void iniciar(){
        this.empilhar("$");
        this.empilhar("<COD>");
    }
}
