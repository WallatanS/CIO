//by. Discentes: Lucio Lisboa; Wallatan França.
//Atividade de Pilha

//Bibliotecas
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h> //função isdigit()
#include <string.h>//função strchr()
#include <iostream>
#include <stdbool.h>// Usar True ou False
#include "Pilha.h"//Fuções em pilha (empilha, desempilha, destroip, topo, vaziap, pilha)

/* Funções em Pilha
Pilha pilha(int m);
bool vaziap(Pilha P);
bool cheiap(Pilha P);
void empilha(Itemp x, Pilha P);
Itemp desempilha(Pilha P);
Itemp topo(Pilha P);
void destroip(Pilha *Q);
*/

//Funções
char *posfixa(char *e); //Função Posfixa
float valor(char *e);   //Função para calculo de valor
int prio(char o);       //Função de prioridade
bool trial(char *e);    //Função que verifica balanceamento da função infixa

int main(void) // Main princippal
{
    char e[256]; //cria um char de 256 que recebe a função infixa
    char s[256];
    printf("Infixa: ");
    gets(e); //recebe a função infixa
    if (trial(e)){ //verifica se a função está balanceada
        strcpy(e, posfixa(e)); //copia o valor de do retorno da poxfixa para o vetor char e
        float b = (float) valor(e); //chama a função valor que calcula na forma posfixa
        int i;
        system("cls");
        printf("posfixa: %s\n", e);
        printf("Resultado do calculo: %.2f\n", b);} else{// se a função não for balanceada ela reinicia
        cout<<"O Progama sera reiniciado";
        main();
    }
    int bas;
    cout<<"Deseja repitir o processo, 1 -> SIM, 2 -> NAO: "; //pergunta se o o usuaria deseja fazer o processo novamente
    cin>>bas;
    if(bas==1){
        cout<<"O Progama sera reiniciado";
        system("cls");
        setbuf(stdin,NULL); //limpa os buf de memória do código
        main(); // chama a função main novamente para iniciar o processo novamente
    }
    return 0;
}

char *posfixa(char *e) // função que organiza de infixa para pósfixa
{
  static char s[256]; // cria um char static com 256 de espaço
  Pilha P = pilha(256); //chama a função pilha e o tamanho do vertor char
  int j=0;
  int i;
  for(i=0; e[i]; i++)//percorre o vetor char e até que ele seja null
    if( e[i]=='(')
		empilha('(', P);
    else if( isdigit(e[i]) || e[i]=='.') //verifica se o dado é um digito ou um .
		s[j++] = e[i]; //atribui o dado de e[i] na posição j++ de s
    else if( strchr("+-/*", e[i])){ //compara se o dado de e[i] é um dos operadores apresentado
        while( !vaziap(P) && prio(topo(P)) >= prio(e[i])) //condiciona que a pilha não pode estar vazia e que o elemento contido em p tem de ser maior ou igual que o de i
            s[j++] = desempilha(P); //desempilha o ultimo valor de p e passa para s na possição j++
        empilha(e[i], P);
    }
    else if(e[i] == ')'){
        while( topo(P) != '(')
            s[j++] = desempilha(P);
      desempilha(P);
    }
    while ( !vaziap(P))
      s[j++] = desempilha(P);
    s[j] = '\0'; //define o final de uma string
    destroip(&P); // destroi a pilha P
    return s;
}

float valor(char *e) //função para calcular o valor da função posfixa
{
    int i, b=0;
    Pilha P = pilha(256);
    float vet=0;
    for(i=0; e[i]; i++)
        if(isdigit(e[i]))//verifica se o dado é um digito
            empilha(e[i]-'0', P); //convert o dado para interio
        else{
            if (b==0){ //roda na primeira vez que encontrar um operador
                float y = desempilha(P);
                float x = desempilha(P);
                switch( e[i] ){
                    case '+':
                        vet = x+y;
                        b=1;
                        break;
                    case '-':
                        vet = x-y;
                        b=1;
                        break;
                    case '*':
                        vet = x*y;
                        b=1;
                        break;
                    case '/':
                        vet = x/y;
                        b=1;
                        break;
                }
            }
            else if (b==1) { //roda nas demais veses que em econtrar um operador
                int y = desempilha(P);
                switch( e[i] ){
                    case '+':
                        vet = vet+y;
                        break;
                    case '-':
                        vet = vet-y;
                        break;
                    case '*':
                        vet = vet*y;
                        break;
                    case '/':
                        vet = vet/y;
                        break;
                }
            }
        }
    destroip(&P);
    return vet;
}

bool trial(char *e) //verifica se a pilha está balanceada
{
    Pilha open;	           // pilha respons�vel pelo abre parenteses
	Pilha close;	       // pilha respons�vel pelo fecha parenteses
	open = pilha(256);     // inicia pilha open
	close = pilha(256);	   // inicia pilha close
	for(int i=0; e[i]; i++)
	{
		if(e[i] == '(')
		{
			empilha( e[i], open);
		}
		else if(e[i] == ')')
		{
			empilha( e[i], close);
		}
	}
	do
	{
		if( ( topo(open) == '(' ) && ( topo(close) == ')' ) )
    	{
            desempilha(open);
			desempilha(close);
		}
	} while( !vaziap(open) && !vaziap(close));
	if(vaziap(open) == true && vaziap(close)== true)
	{
        destroip(&open);
        destroip(&close);
        return true;
	}
	else
	{
		cout<<"\nPilha Com Dados\n";
		cout<<"Expressao nao balanceada\n";
        destroip(&open);
        destroip(&close);
        return false;
	}
}

int prio(char o) //verifica a prioridade dos operadores
{
    switch( o ){
        case '(': return 0;
        case '+':
        case '-': return 1;
        case '*':
        case '/': return 2;
    }
    return -1;
}
