#include <stdio.h>
#include <math.h>
#include <iostream>

using namespace std;
typedef struct registro{
  int matricula;
  char nome[70];
  int idade;
  float peso;
  float altura;
  float imc;
}reg;

void cadastro (reg *);
void imprime(reg *);
void calculoIMC(reg *);

void cadastro(reg *r){

  int i;
  for(i=0;i<2;i++){
    cout<<"\n Digite o numero da matricula:";
    cin>>r[i].matricula;
    cout<<"\n Digite o nome:";
    cin>>r[i].nome;
    cout<<"\n Digite a idade:";
    cin>>r[i].idade;
    cout<<"\n Digite o peso:";
    cin>>r[i].peso;
    cout<<"\n Digite a altura:";
    cin>>r[i].altura;
    calculoIMC(r);
    system("cls");
  }
}
void calculoIMC(reg *r){
  for(int i=0;i<2;i++)
    r[i].imc=r[i].peso/pow(r[i].altura,2);
}

void imprime(reg *r){
  int i;
  for(i=0;i<2;i++){
    cout<<"\n\n Matricula:"<<r[i].matricula;
    cout<<"\t Nome:"<<r[i].nome;
    cout<<"\t Idade:"<<r[i].idade;
    cout<<"\t Peso:"<<r[i].peso;
    cout<<"\t Altura:"<<r[i].altura;
    cout<<"\t IMC:"<<r[i].imc;
  }
}
