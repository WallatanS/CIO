#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>

typedef char Itp;

typedef struct pilha {
  int max;              //tamanho maximo da pilha
  int up;               //posição do topo
  Itp *item;       // intens na pilha
}*Pilha;

//Prototipos
void pilhas();
Pilha creatpi (int siz);
void insertpi (Pilha pi, Itp x);
int isempty (Pilha pi);
int itfull (Pilha pi);
void destroip (Pilha *q);
Itp toremove(Pilha p);


//funções

int main(){
  printf("Atividade de Pilha\n");
  printf("Discente: Wallatan F P Souza\n");
  //cout<<"Atividade de Pilha";
  //cout<<"Discente: Wallatan F P Souza";
  system ("pause");
  system ("cls");
  pilhas();
}

void pilhas(){
  int siz, i;
  Itp va='a';
  printf("Informe o Tamanho da Pilha: ");
  scanf("%d",&siz);
  Pilha pi = creatpi(siz); //incia a pilha
  printf("Insira %d elementos na pilha\n", siz);
  system ("cls");
  for(i=1; i<=siz; i++){
    printf("Elemento %i: ", i);
    gets(va);
    insertpi (pi, va);
    system ("pause");
    system ("cls");
  }
  int op;
  printf("Deseja desenpilhar, 1 para sim, 2 para nao\n");\
  scanf("%i\n",&op);
  if (op==1){
    for(i=siz; i>=1; i--){
      system ("cls");
      toremove (pi);
      printf("Elemento %i: %c", i, pi->item[pi->up]);
      system ("pause");
    }
  }
  printf("Deseja apagar a pilha, 1 para sim, 2 para nao\n");
  scanf("%i\n",&op);
  if (op==1){
    destroip(&pi);
    printf("Pilha Apagada\n");
  }
  printf("Reinicar Programa, 1 para sim, 2 para não\n");
  scanf("%i\n",&op);
  if (op==1){
    main();
  }
  exit(1);
}

Pilha creatpi (int siz){
  Pilha panasonic = malloc(sizeof (struct pilha));
  panasonic->max= siz;
  panasonic->up= -1;
  panasonic->item = malloc(siz*sizeof(Itp));
  return panasonic;
}

void insertpi (Pilha pi, Itp x){
	if (itfull(pi)){
	  puts("Pilha Cheia!");
    abort();
  }
  pi->up++;
  pi->item[pi->up] = x;
}

Itp toremove(Pilha p){
  if (isempty(p)){
    puts("Pilha Vazia!");
    abort();
  }
  Itp x = p->item[p->up];
  p->up--;
  return x;
}

Itp up(Pilha p) {
  if( isempty(p)){
    puts("\nPilha Vazia!");
    abort();
  }
  return p->item[p->up];
}

void destroip (Pilha *q) {
  free((*q)->item);
  free(*q);
  *q = NULL;
}

int isempty (Pilha pi){
    if (pi->up==-1)
        return 1;
    else
        return 0;
}

int itfull (Pilha pi){
    if (pi->up== pi->max-1)
        return 1;
    else
        return 0;
}
