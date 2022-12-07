#include <stdio.h>
#include <stdlib.h>
#include <iostream>
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
} *Lista;

//funções
int inicio();
int opMenu();
Lista creatList();
void printList(Lista lista);
Node* pos(Lista lista, int index);
Lista insere_lista_inicio(Lista lista, DataNode data);
Lista insere_lista_final(Lista lista, DataNode data);
Lista remove_lista_inicio(Lista lista);
Lista remove_lista_final(Lista lista);
Lista remove_lista(Lista lista, int index);
int tamanho_lista(Lista lista);
bool lista_vazia(Lista lista);
bool busca_lista_elem(Lista lista, DataNode data);
int busca_lista_pos(Lista lista, DataNode data);

//funções
int inicio()
{
  Lista lista = creatList();
  DataNode data;
  int op;
  do{
    system("cls");
    op = opMenu();
    system("cls");
    switch (op) {
      case 1:
        cout<<"\nValor: ";
        cin>>data.id;
        lista = insere_lista_inicio (lista, data);
        break;
      case 2:
        cout<<"\nValor: ";
        cin>>data.id;
        lista = insere_lista_final(lista, data);
      break;
      case 3:
        if (!lista_vazia(lista)){
          int index;
          cout<<"Qual a posicao do dado que vc deseja apagar\n";
          cin>>index;
          if (index > lista->size || index < 0){
            cout<<"Dado nao consta na lista\n";
            system("pause");
          }
          else
            lista = remove_lista(lista, index-1);
        }else{
          cout<<"Lista Vazia\n";
          system("pause");
        }
        break;
      case 4:
        if (!lista_vazia(lista)){
          lista = remove_lista_inicio(lista);
        } else{
          cout<<"Lista Vazia\n";
          system("pause");
        }
        break;
      case 5:
        if(!lista_vazia(lista))
          lista = remove_lista_final(lista);
        else{
          cout<<"Lista Vazia\n";
          system("pause");
        }
        break;
      case 6:
        int val;
        val = tamanho_lista(lista);
        cout<<"\nTamanho Da Lista: "<<val<<"\n";
        system("pause");
        break;
      case 7:
        if(lista_vazia(lista))
          cout<<"\nLista Vazia\n";
        else
          cout<<"\nLista contem dados\n";
        system("pause");
        break;
      case 8:
        cout<<"\nDigite o elemento: ";
        cin>>data.id;
        if(!lista_vazia(lista))
        {
          if(!busca_lista_elem(lista, data))
            cout<<"\nElemento Nao Encontrado\n";
          else
            cout<<"\nElemento encontrado\n";
        }else
          cout<<"Lista Vazia\n";
        system("pause");
        break;
      case 9:
        if(!lista_vazia(lista)){
          cout<<"Digete o elemento: ";
          cin>>data.id;
          int resp= busca_lista_pos(lista, data);
          if (resp!=-1)
            cout<<"\nElemento na posicao: "<<resp<<"\n";
          else
            cout<<"\nElemento nao encontrado\n";
        }else
          cout<<"Lista Vazia\n";
        system("pause");
        break;
      case 0:
        printList(lista);
        system("pause");
        break;
      case 10:
        cout<<"Ate Logo\n";
        break;
      default:
        cout<<"Opcao Invalida\n";
        system("pause");
    }
  }while(op!=10);
}

Lista creatList()
{ //criar lista base
  Lista lista = (Lista) malloc(sizeof(Lista));
  lista->size = 0;
  lista->head = NULL;
  return lista;
}

int opMenu()
{
  int op = 0;
  cout<<"MENU\n\n";
  cout<<"1- Inserir valor no inicio\n";
  cout<<"2- Inserir valor no final\n";
  cout<<"3- Excluir Dado\n";
  cout<<"4- Excluir Dano no Inicio\n";
  cout<<"5- Excluir Dado no Final\n";
  cout<<"6- Tamanho Da Lista\n";
  cout<<"7- Lista vazia?\n";
  cout<<"8- Elemento Existe Na Lista?\n";
  cout<<"9- Busca de Posicao de um valor\n";
  cout<<"10- Sair\n";
  cout<<"\n\nOpcao: ";
  cin>>op;
return op;
}

void printList(Lista lista)
{ //exibir lista
  if (lista_vazia(lista)){
    cout<<"\nLista Vazia\n";
    return;
  }
  int i=0;
  Node* pointer = lista->head;
  while (pointer != NULL){
    i=i+1;
    cout<<"Valor No "<<i<<": "<<pointer->data.id<<"\n";
    pointer = pointer->next;
  }
}

bool lista_vazia(Lista lista)
{ //lista vazia
  return (lista->size == 0);
}

Lista insere_lista_inicio(Lista lista, DataNode data)
{ //inserir no inicio da lista
  Node* node = (Node*) malloc(sizeof(Node));
  node->data = data;
  node->next = lista->head;
  lista->head = node;
  lista->size++;
  return lista;
}

Lista insere_lista_final(Lista lista, DataNode data)
{//Insere um valor no final da lista
  int size = lista->size;
  if (size == 0){
    insere_lista_inicio(lista, data);
    return lista;
  }
  size = size-1;
  Node* current = pos(lista, size);
  //Node* previous = pos(lista, size-1);
  Node* newNode = (Node*) malloc (sizeof(Node));
  newNode->data = data;
  newNode->next = NULL;
  current->next = newNode;
  lista->size++;
  return lista;
}

Lista remove_lista_inicio (Lista lista)
{ //apagar inicio da lista
  if (!lista_vazia(lista)){
    Node* pointer = lista->head;
    lista->head = pointer->next;
    free(pointer);
    lista->size--;
  }
  return lista;
}

Lista remove_lista(Lista lista, int index)
{//apagar uma posição qualquer da lista
  if (index == 0){
    lista = remove_lista_inicio(lista);
    return lista;
	}
  Node* current = pos(lista, index);
  if (current != NULL){
    Node* previous = pos(lista, index-1);
    previous->next = current->next;
    free(current);
    lista->size--;
    return lista;
  }
}

Lista remove_lista_final(Lista lista)
{//apaga a ultima posição da lista
  int size = lista->size;
  size = size-1;
  lista = remove_lista(lista, size);
  return lista;
}

int tamanho_lista(Lista lista)
{
  return lista->size;
}

bool busca_lista_elem(Lista lista, DataNode data)
{//Informo se um elemento existe na lista
  int i=0;
  int par = lista->size;
  Node* newNode = lista->head;
  while (i < lista->size){
    if(data.id == newNode->data.id)
      return true;
    newNode = newNode->next;
    //newNode = pos(lista, i+1);
    i++;
  }
  return false;
}

int busca_lista_pos(Lista lista, DataNode data)
{//busco a posição de um elemento na lista
  int i=0;
  Node* newNode = lista->head;
  while (i < lista->size){
    if(data.id == newNode->data.id)
      return i+1;
    newNode = newNode->next;
    //newNode = pos(lista, i+1);
    i++;
  }
  return -1;
}

Node* pos(Lista lista, int index)
{ //busca com base no indece que retorna um ponteiro
  if (index >= 0 && index < lista->size){
    Node* node = lista->head;
    int i;
    for (i=0; i < index; i++){
      node = node->next;
    }
    return node;
  }
  cout<<"Indice Invalido\n";
  return NULL;
}
