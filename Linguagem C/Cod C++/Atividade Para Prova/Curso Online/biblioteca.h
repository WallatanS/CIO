#include <stdio.h>
#include <stdlib.h>
#include <iostream>
//#include <stbool.h>
#include <locale.h>

using namespace std;

//Prototipos
typedef struct dataNode{
  int id;
}DataNode;

typedef struct node{
  DataNode data;
  struct node* next;
} Node;

typedef struct list {
  int size;
  Node* head;
} List;

//funções
int inicio();
int opMenu();
List* creatList();
void insere_lista_inicio(List* list, DataNode data);
void printList(List* list);
void remove_lista_inicio(List* list);
bool lista_vazia(List* list);
Node* atPos(List* list, int index);
int indexOF(List* list, Node* node);
void remove_lista(List* list, int index);
void insert(List* lista, DataNode data, int index);
void xchgNode(List* list, Node* nodeA, Node* nodeB);
bool busca_lista_elem(List* list, DataNode data);

//funções
int inicio()
{
  List* lista = creatList();
  DataNode data;
  int op;
  do{
    system("cls");
    op = opMenu();
    system("cls");
    cout<<op;
    switch (op) {
      case 1:
        cout<<"Valor: \n";
        cin>>data.id;
        insere_lista_inicio (lista, data);
        break;
      case 2:
        cout<<"Opcao Invalida";
        break;
      case 3:
        int i=0
        cout<<"Qual dos dados vc deseja apagar";
        cin>>i;
        remove_lista(lista,i);
      case 4:
        remove_lista_inicio(lista);
        cout<<"Apagado\n";
        system("Pause");
      break;
      case 5:
        cout<<"Opcao Invalida";
        break;
      case 6:
        cout<<"Tamanho Da Lista: "<<lista->size;
        system("Pause");
        break;
      case 7:
        if(!lista_vazia(list))
          cout<<"Lista Vazia";
        else
          cout<<"Lista Nao Esta Vazia";
        break;
      case 8:
        if(!busca_lista_elem(lista, data))
          cout<<"Elemento Nao Encontrado";
        else
          cout<<"Elemento encontrado";
      case 9:

      default:
        cout<<"Opcao Invalida";
    }
  }while(op!=9);
  printList(lista);
  cout<<"\n";
  //erase(list, 1);
  printList(lista);
  cout<<"\n";
}

List* creatList(){ //criar lista base
  List* lista = (List*) malloc(sizeof(List));
  lista->size = 0;
  lista->head = NULL;
  return lista;
}

int opMenu(){
  int op = 0;
  cout<<"MENU";
  cout<<"1- Inserir valor no inicio\n";
  cout<<"2- Inserir valor no final\n";
  cout<<"3- Excluir Dado\n";
  cout<<"4- Excluir Dano no Inicio\n";
  cout<<"5- Excluir Dado no Final\n";
  cout<<"6- Tamanho Da Lista";
  cout<<"7- Lista vazia?\n";
  cout<<"8- Buscar\n";
  cout<<"9- Posicao\n";
  cout<<"10- Sair\n";
  cin>>op;
return op;
}

void insere_lista_inicio(List* list, DataNode data){ //inserir no inicio da lista
  Node* node = (Node*) malloc(sizeof(Node));
  node->data = data;
  node->next = list->head;
  list->head = node;
  list->size++;
}

void printList(List* list)
{ //exibir lista
  if (isEmpty(list)){
    cout<<"Lista Vazia\n";
    return;
  }
  Node* pointer = list->head;
  while (pointer != NULL){
    cout<<pointer->data.id;
    pointer = pointer->next;
    //cout<<"\n";
  }
}

bool lista_vazia(List* list)
{ //lista vazia
  return (list->size == 0);
}

void remove_lista_inicio (List* list)
{ //apagar inicio da lista
  if (!lista_vazia(list)){
  Node* pointer = list->head;
  list->head = pointer->next;
  free(pointer);
  list->size--;
  }
}

Node* atPos(List* list, int index)
{ //busca com base no indece que retorna um ponteiro
  if (index > -1 && index < list->size){
    Node* node = list->head;
    int i;
    for (i=0; i < index; i++){
      node = node->next;
      return node;
    }
  }
  cout<<"Indice Invalido\n";
  return NULL;
}

int indexOF(List* list, Node* node)
{ //Busca com base no nó e deovolve um indice
  if(node!=NULL){
    Node* pointer = list -> head;
    int index = 0;
    while (pointer != node && pointer != NULL){
      pointer = pointer->next;
      index++;
    }
    if (pointer!=NULL)
      return index;
  }
  cout<<"No não pertence a lista\n";
  return -1;
}

void remove_lista(List* list, int index)
{//apagar uma posição qualquer da lista
  if (index == 0)
    remove_lista_inicio(list);
  else {
    Node* current = atPos(list, index);
    if (current != NULL){
        Node* previous = atPos(list, index-1);
        previous->next = current->next;
        free(current);
        list->size--;
    }
  }
}

void insert(List* lista, DataNode data, int index)
{//inserir em qualquer posição da lista
  if (index == 0)
    insere_lista_inicio(lista, data);
  else{
    Node* current = atPos(lista, index);
    if (current != NULL){
      Node* previous = atPos(lista, index-1);
      Node* newNode = (Node*) malloc (sizeof(Node));
      newNode->data = data;
      previous->next = newNode;
      newNode->next = current;
    }
  }
}

void xchgNode(List* list, Node* nodeA, Node* nodeB)
{//Trocar posições de nós da lista
  if (nodeA == nodeB)
    return;
  int indexA = indexOF(list, nodeA);
  int indexB = indexOF(list, nodeB);
  if (indexA==-1 || indexB==-1)
    return;
  if (indexA > indexB)
  {
    nodeA = nodeB;
    nodeB = atPos(list, indexA);
    indexA = indexB;
    indexB = indexOF(list, nodeB);
  }
  Node* pb = atPos(list, indexB-1);
  if (nodeA == list->head)
    list-> head=nodeB;
  else
  {
    Node* pa=atPos(list, indexA-1);
    pa->next = nodeB;
  }
  Node* pointer= nodeA->next;
  nodeA->next = nodeB->next;
  nodeB->next = pointer;
}

bool busca_lista_elem(List* list, DataNode data){

}

int busca_lista_pos(Lista lista, <tipo_dado> nomedado){

}
