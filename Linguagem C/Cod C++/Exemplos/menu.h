#include <stdio.h>

int menu(){

  int op;
  do{
    printf("MENU");
    printf("\n1- Cadastro");
    printf("\n2- Listar ordenado por nome");
    printf("\n3- Listar ordenado por matricula");
    printf("\n4- Listar por idade descresente");
    printf("\n5- Listar IMC acima de 30");
    prinft("\n6- Sair");
    scanf("%d",op);
  }while(op=!6);
  return op;
}
