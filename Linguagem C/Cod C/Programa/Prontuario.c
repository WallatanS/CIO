/*
*  ASPECTOS ESTRUTURAIS  INDENTAÇAO
*  ESTRUTURA DE DADOS(REGISTROS)  STRUCT
*  ALOCAÇAO DINAMICA
*  PERSISTENCIA EM ARQUIVOS
*  CONTER AS SEGUINTES FUNCIONALIDADES
*   ----CADASTRAR,EXCLUIR,ALTERAR,LOCALIZAR
*   ----RELATORIOS
*  MANTER RELACIONAMENTO ENTRE AS INFORMAÇOES
*/

// Sistema de Prontuario médico
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#include <conio.h>
#include <math.h>


//Registros
typedef struct Paciente {
  char nome[60];
  long long cpf;
  long rg;
  long long contemer;
}paci;

typedef struct Medico {
  char nome[60];
  long long cpf;
  long rg;
  char crm[30];
  long long tel;
  int forma;
}medi;

typedef struct Hospital{
  char nome[60];
  char endereco[100];
  int numero;
}hospi;

typedef struct Remedio{
  char nome[60];
  int cod;
  char obser[300];
}reme;

typedef struct Prontuario{
  char observa[300];
  char medico[30];
  long long  paciente;
  int hospital;
  char reme[50]; //pegar valores separados e depois pesquisar no sistema
}prontu;

typedef struct Formacao{
  char nome[80];
  int numero;
}form;

//Protótipos
//Menus
  void menu ();
  void paciente();
  void prontuario();
  void medico();
  void hospital();
  void remedios();
  void formacao();

//Consultar
  void consulforma();
  void consulpaci();
  void consulprotu();
  void consulmed();
  void consulhosp();
  void consulreme();
//Alterar
  void alterforma();
  void alterpaci();
  void alterprotu();
  void altermed();
  void alterhosp();
  void alterreme();
//Cadastro
  void cadaforma();
  void cadapaci();
  void cadaprotu();
  void cadamed();
  void cadahosp();
  void cadareme();
//Excluir
  void excluforma();
  void exclupaci();
  void excluprotu();
  void exclumed();
  void excluhosp();
  void exclureme();
//Relatorio
  void relaforma();
  void relapaci();
  void relaprontu();
  void relamedico();
  void relahospita();
  void relaremedi();
//outros
  void sobre();
  //FILE AbrirArquivo();
  //void FechaArquvo();


//Vars Globais

//Main
int main () {
  printf("PROGRAMA DE PRONTUARIO\n");
  printf("--------------------------\n");
  system("pause");
  menu();
}

//Menu
void menu()
{
  int op=0;
  system ("cls");
  printf("MENU PRINCIPAL\n\n");
  printf("<1>. PACIENTE\n");
  printf("<2>. PRONTUARIO\n");
  printf("<3>. MEDICO\n");
  printf("<4>. HOSPITAL\n");
  printf("<5>. REMEDIOS\n");
  printf("<6>. SOBRE\n");
  printf("<7>. SAIR\n");
  scanf("%i", &op);
  switch (op) {
    case 1:
      paciente();
      menu();
    case 2:
      prontuario();
      menu();
    case 3:
      medico();
      menu();
    case 4:
      hospital();
      menu();
    case 5:
      remedios();
      menu();
    case 6:
      sobre();
      menu();
    case 7:
      printf("Finalizando programa\n");
      printf("Bye\n");
      exit(1);
      break;
    default:
      printf("Opcao inexistente\n");
      printf("Escolha a opcao correta\n");
      system("pause");
      menu();
  }
}

void paciente()
{
  int op;
  system ("cls");
  printf("MENU PACIENTE\n");
  printf("--------------------------\n");
  printf("ESCOLHA A OPCAO DESESEJADA\n\n");
  printf("<1>. CONSULTAR\n");
  printf("<2>. ALTERAR\n");
  printf("<3>. CADASTRAR\n");
  printf("<4>. CONSULTAR\n");
  printf("<5>. RELATORIO\n");
  printf("<6>. VOLTAR\n");
  scanf("%i", &op);
  switch (op) {
    case 1:
      consulpaci();
    case 2:
      alterpaci();
    case 3:
      cadapaci();
    case 4:
      consulpaci();
    case 5:
      relapaci();
    case 6:
      system ("cls");
      menu();
    default:
      printf("Opcao inexistente\n");
      printf("Escolha a opcao correta\n");
      system("pause");
      paciente();
  }
}

void prontuario()
{
  int op;
  system ("cls");
  printf("MENU DE PRONTUARIO\n");
  printf("--------------------------\n");
  printf("ESCOLHA A OPCAO DESESEJADA\n\n");
  printf("<1>. CONSULTAR\n");
  printf("<2>. ALTERAR\n");
  printf("<3>. CADASTRAR\n");
  printf("<4>. CONSULTAR\n");
  printf("<5>. RELATORIO\n");
  printf("<6>. VOLTAR\n");
  scanf("%i", &op);
  switch (op) {
    case 1:
      consulprotu();
    case 2:
      alterprotu();
    case 3:
      cadaprotu();
    case 4:
      consulprotu();
    case 5:
      relaprontu();
    case 6:
      system ("cls");
      menu();
    default:
      printf("Opcao inexistente\n");
      printf("Escolha a opcao correta\n");
      system("pause");
      prontuario();
  }
}

void medico()
{
  int op;
  system ("cls");
  printf("MENU DE MEDICO\n");
  printf("--------------------------\n");
  printf("ESCOLHA A OPCAO DESESEJADA\n\n");
  printf("<1>. Consultar\n");
  printf("<2>. Alterar\n");
  printf("<3>. Cadastrar\n");
  printf("<4>. Excluir\n");
  printf("<5>. Relatorio\n");
  printf("<6>. Cadastro e Consulta de Formacao\n");
  printf("<7>. Voltar ao menu principal\n");
  scanf("%i", &op);
  switch (op) {
    case 1:
      consulmed();
    case 2:
      altermed();
    case 3:
      cadamed();
    case 4:
      exclumed();
    case 5:
      relamedico();
    case 6:
      formacao();
    case 7:
      menu();
      system ("cls");
    default:
      printf("Opcao inexistente\n");
      printf("Escolha a opcao correta\n");
      system("pause");
      medico();
  }
}

void formacao()
{
int op;
system ("cls");
printf("MENU DE FORMACAO MEDICA\n");
printf("ESCOLHA A OPCAO DESESEJADA\n\n");
printf("<1>. Consultar\n");
printf("<2>. Alterar\n");
printf("<3>. Cadastrar\n");
printf("<4>. Excluirt\n");
printf("<5>. Relatorio\n");
printf("<6>. Voltar ao menu principal\n");
scanf("%i", &op);
switch (op) {
  case 1:
    consulforma();
    case 2:
      alterforma();
    case 3:
      cadaforma();
    case 4:
      excluforma();
    case 5:
      relaforma();
    case 6:
      medico();
      system ("cls");
    default:
      printf("Opcao inexistente\n");
      printf("Escolha a opcao correta\n");
      system("pause");
      formacao();
  }
}

void hospital()
{
  int op;
  system ("cls");
  printf("MENU DE HOSPITAL\n");
  printf("--------------------------\n");
  printf("ESCOLHA A OPCAO DESESEJADA\n\n");
  printf("<1>. Consultar\n");
  printf("<2>. Alterar\n");
  printf("<3>. Cadastrar\n");
  printf("<4>. Consultar\n");
  printf("<5>. Relatorio\n");
  printf("<6>. Voltar ao menu principal\n");
  scanf("%i", &op);
  switch (op) {
    case 1:
      consulhosp();
    case 2:
      alterhosp();
    case 3:
      cadahosp();
    case 4:
      consulhosp();
    case 5:
      relahospita();
    case 6:
      menu();
      system ("cls");
    default:
      printf("Opcao inexistente\n");
      printf("Escolha a opcao correta\n");
      system("pause");
      hospital();
  }
}

void remedios()
{
  system ("cls");
  int op;
  printf("MENU DE REMEDIOS\n");
  printf("--------------------------\n");
  printf("ESCOLHA A OPCAO DESESEJADA\n\n");
  printf("<1>. CONSULTAR\n");
  printf("<2>. ALTERAR\n");
  printf("<3>. CADASTRAR\n");
  printf("<4>. CONSULTAR\n");
  printf("<5>. RELATORIO\n");
  printf("<6>. VOLTAR\n");
  scanf("%i", &op);
  switch (op) {
    case 1:
      consulreme();
    case 2:
      alterreme();
    case 3:
      cadareme();
    case 4:
      consulreme();
    case 5:
      relaremedi ();
    case 6:
      menu();
      system ("cls");
    default:
      printf("OPCAO INVALIDA\n");
      printf("ESCOLHA NOVAMENTE\n");
      system("pause");
      remedios();
  }
}

//Consulta
void consulpaci()
{

}

void consulprotu()
{

}

void consulmed()
{

}

void consulhosp()
{

}

void consulreme()
{

}

void consulforma()
{

}

//Alterar
void alterpaci()
{

}

void alterprotu()
{

}

void altermed()
{

}

void alterhosp()
{

}

void alterreme()
{

}

void alterforma()
{

}

//Cadastro
void cadapaci()
{
  system ("cls");
  printf("CADASTRO DE PACIENTE\n");
  printf("--------------------------\n");
  paci pacie;
  int mod, cont, numreg;
  FILE *PACIENTE;
  paci *prmt;
  PACIENTE = fopen("C:\\Users\\walla\\Desktop\\Programa\\Dados\\Paciente.txt","rt");
  if(PACIENTE == NULL)
  {
    mod=0;
  }
  else
  {
    mod=1;
  }
  fclose(PACIENTE);
  if(mod==1)
  {
    printf("CADASTROS EXISTENTES\n\n");
    printf("NUMERO DE PACIENTES A SEREM CADASTRADOS:\n");
    scanf("%d",&numreg);
    prmt = (paci*) malloc(numreg * sizeof(paci));
    PACIENTE = fopen("C:\\Users\\walla\\Desktop\\Programa\\Dados\\Paciente.txt", "a");
    for (cont = 0; cont < numreg; cont++){
      setbuf(stdin,NULL);
      printf("Nome:\n");
      scanf("%[^\n]s",&pacie.nome);
      printf("CPF\n");
      scanf("%lld",&pacie.cpf);
      printf("RG:\n");
      scanf("%ld", &pacie.rg);
      printf("Contato de Emergencia:\n");
      scanf("%lld", &pacie.contemer);
      fprintf(PACIENTE, "NOME: %s || CPF: %lld || RG: %ld || Cont. Emergencia: %lld\n",pacie.nome, pacie.cpf, pacie.rg, pacie.contemer);
    }
    fclose(PACIENTE);
    if (numreg > 1)
    {
        printf("PACIENTES CADASTRADO\n");
    }
    if (numreg == 1)
    {
        printf("PACIENTE CADASTRADO\n");
    }
    system("pause");
    paciente();
  }
  else
  {
    printf("PRIMEIRO CADASTRO!!! \n\n");
    printf("NUMERO DE PACIENTES A SEREM CADASTRADOS:\n");
    scanf("%d", &numreg);
    prmt = (paci*) malloc(numreg * sizeof(paci));
    PACIENTE= fopen("C:\\Users\\walla\\Desktop\\Programa\\Dados\\Paciente.txt", "a");
    for (cont = 0; cont < numreg; cont++)
    {
      setbuf(stdin,NULL);
      printf("Nome:\n");
      scanf("%[^\n]s",&pacie.nome);
      printf("CPF\n");
      scanf("%lld",&pacie.cpf);
      printf("RG:\n");
      scanf("%ld", &pacie.rg);
      printf("Contato de Emergencia:\n");
      scanf("%lld", &pacie.contemer);
      fprintf(PACIENTE, "NOME: %s || CPF: %lld || RG: %ld || Cont. Emergencia: %lld\n",pacie.nome, pacie.cpf, pacie.rg, pacie.contemer);
    }
    fclose(PACIENTE);
    if (numreg > 1)
    {
        printf("PACIENTES CADASTRADO\n");
    }
    if (numreg == 1)
    {
        printf("PACIENTE CADASTRADO\n");
    }
    system("pause");
    remedios();
  }
}

void cadaprotu()
{
  system ("cls");
  printf("CADASTRO DE PRONTUARIO\n");
  printf("--------------------------\n");
  prontu reg;
  int mod, cont, numreg;
  FILE *ARQUIVO;
  prontu *prmt;
  ARQUIVO = fopen("C:\\Users\\walla\\Desktop\\Programa\\Dados\\Prontuario.txt","rt");
  if(ARQUIVO == NULL)
  {
    mod=0;
  }
  else
  {
    mod=1;
  }
  fclose(ARQUIVO);
  if(mod==1)
  {
    printf("CADASTROS EXISTENTES\n\n");
  }else
  {
    printf("PRIMEIRO CADASTRO!!! \n\n");
  }
  printf("NUMERO DE PRONTUARIOS A SEREM CADASTRADOS:\n");
  scanf("%d", &numreg);
  prmt = (medi*) malloc(numreg * sizeof(medi));
  ARQUIVO= fopen("C:\\Users\\walla\\Desktop\\Programa\\Dados\\Prontuario.txt", "a");
  for (cont = 0; cont < numreg; cont++)
  {
    setbuf(stdin,NULL);
    //relapaci();
    printf("CPF Do Pacinte:\n");
    scanf("%lld", &reg.paciente);
    //system("cls");
    //relamedico();
    printf("CRM Do Medico: \n");
    scanf("%[^\n]s",&reg.medico);
    //system("cls");
    //relahospita();
    printf("ID Do Hospital:\n");
    scanf("%i",&reg.hospital);
    //system("cls");
    //relaremedi();
    printf("Medicamento:\n");
    scanf("%[^\n]s",&reg.reme);
    //system("cls");
    printf("Observacao:\n");
    scanf("%[^\n]s",&reg.observa);
    fprintf(ARQUIVO, "CPF do Paciente: %lld || CRM Do MEDICO: %s || ID Do Hospital: %i || Medicamento: %s || Observacao: %s\n", reg.paciente, reg., reg.medico, reg.hospital, reg.tel, reg.reme, reg.observa);
  }
  fclose(ARQUIVO);
  if (numreg > 1)
  {
    printf("PRONTUARIOS CADASTRADOS\n");
  }
    if (numreg == 1)
  {
    printf("PRONTUARIO CADASTRADO\n");
  }
    system("pause");
    medico();
  }
}

void cadamed()
{
  system ("cls");
  printf("CADASTRO MEDICO\n");
  printf("--------------------------\n");
  medi reg;
  int mod, cont, numreg;
  FILE *ARQUIVO;
  medi *prmt;
  ARQUIVO = fopen("C:\\Users\\walla\\Desktop\\Programa\\Dados\\Medico.txt","rt");
  if(ARQUIVO == NULL)
  {
    mod=0;
  }
  else
  {
    mod=1;
  }
  fclose(ARQUIVO);
  if(mod==1)
  {
    printf("CADASTROS EXISTENTES\n\n");
    printf("NUMERO DE MEDICOS A SEREM CADASTRADOS:\n");
    scanf("%d",&numreg);
    prmt = (medi*) malloc(numreg * sizeof(medi));
    ARQUIVO = fopen("C:\\Users\\walla\\Desktop\\Programa\\Dados\\Medico.txt", "a");
    for (cont = 0; cont < numreg; cont++){
      setbuf(stdin,NULL);
      printf("Nome:\n");
      scanf("%[^\n]s",&reg.nome);
      printf("CPF: \n");
      scanf("%lld", &reg.cpf);
      printf("RG:\n");
      scanf("%ld",&reg.rg);
      setbuf(stdin,NULL);
      printf("CRM:\n");
      scanf("%[^\n]s",&reg.crm);
      printf("TELEFONE:\n");
      scanf("%lld", &reg.tel);
      //relaforma();
      printf("Formacao: \n");
      scanf("%i", &reg.forma);
      fprintf(ARQUIVO, "NOME: %s || CPF: %lld || RG: %ld || CRM: %s || TEL: %lld || FORMACAO: %i\n", reg.nome, reg.cpf, reg.rg, reg.crm, reg.tel, reg.tel, reg.forma);
    }
    fclose(ARQUIVO);
    if (numreg > 1)
    {
        printf("MEDICOS CADASTRADOS\n");
    }
    if (numreg == 1)
    {
        printf("MEDICO CADASTRADO\n");
    }
    system("pause");
    medico();
  }
  else
  {
    printf("PRIMEIRO CADASTRO!!! \n\n");
    printf("NUMERO DE MEDICOS A SEREM CADASTRADOS:\n");
    scanf("%d", &numreg);
    prmt = (medi*) malloc(numreg * sizeof(medi));
    ARQUIVO= fopen("C:\\Users\\walla\\Desktop\\Programa\\Dados\\Medico.txt", "a");
    for (cont = 0; cont < numreg; cont++)
    {
      setbuf(stdin,NULL);
      printf("Nome:\n");
      scanf("%[^\n]s",&reg.nome);
      printf("CPF: \n");
      scanf("%lld", &reg.cpf);
      printf("RG:\n");
      scanf("%ld",&reg.rg);
      setbuf(stdin,NULL);
      printf("CRM:\n");
      scanf("%[^\n]s",&reg.crm);
      printf("TELEFONE:\n");
      scanf("%lld",&reg.tel);
      //relaforma();
      printf("Formacao:\n");
      scanf("%i",&reg.forma);
      fprintf(ARQUIVO, "NOME: %s || CPF: %lld || RG: %ld || CRM: %s || TEL: %lld || FORMACAO: %i\n", reg.nome, reg.cpf, reg.rg, reg.crm, reg.tel, reg.tel, reg.forma);
    }
    fclose(ARQUIVO);
    if (numreg > 1)
    {
        printf("MEDICOS CADASTRADOS\n");
    }
    if (numreg == 1)
    {
        printf("MEDICO CADASTRADO\n");
    }
    system("pause");
    medico();
  }
}

void cadahosp()
{
  system ("cls");
  printf("CADASTRO DE HOSPITAL\n");
  printf("--------------------------\n");
  hospi reg;
  int mod, cont, numreg;
  FILE *ARQUIVO;
  hospi *prmt;
  ARQUIVO = fopen("C:\\Users\\walla\\Desktop\\Programa\\Dados\\Hospital.txt","rt");
  if(ARQUIVO == NULL)
  {
    mod=0;
  }
  else
  {
    mod=1;
  }
  fclose(ARQUIVO);
  if(mod==1)
  {
    printf("CADASTROS EXISTENTES\n\n");
    printf("NUMERO DE PACIENTES A SEREM CADASTRADOS:\n");
    scanf("%d",&numreg);
    prmt = (hospi*) malloc(numreg * sizeof(hospi));
    ARQUIVO = fopen("C:\\Users\\walla\\Desktop\\Programa\\Dados\\Hospital.txt", "a");
    for (cont = 0; cont < numreg; cont++){
      setbuf(stdin,NULL);
      printf("Nome:\n");
      scanf("%[^\n]s",&reg.nome);
      printf("ID: \n");
      scanf("%i", &reg.numero);
      setbuf(stdin,NULL);
      printf("Endereco:\n");
      scanf("%[^\n]s",&reg.endereco);
      fprintf(ARQUIVO, "NOME: %s || ENDERECO: %s || ID: %i \n",reg.nome, reg.endereco, reg.numero);
    }
    fclose(ARQUIVO);
    if (numreg > 1)
    {
        printf("HOSPITAIS CADASTRADOS\n");
    }
    if (numreg == 1)
    {
        printf("HOSPITAL CADASTRADO\n");
    }
    system("pause");
    hospital();
  }
  else
  {
    printf("PRIMEIRO CADASTRO!!! \n\n");
    printf("NUMERO DE PACIENTES A SEREM CADASTRADOS:\n");
    scanf("%d", &numreg);
    prmt = (hospi*) malloc(numreg * sizeof(hospi));
    ARQUIVO= fopen("C:\\Users\\walla\\Desktop\\Programa\\Dados\\Hospital.txt", "a");
    for (cont = 0; cont < numreg; cont++)
    {
      setbuf(stdin,NULL);
      printf("Nome:\n");
      scanf("%[^\n]s",&reg.nome);
      printf("ID: \n");
      scanf("%i", &reg.numero);
      setbuf(stdin,NULL);
      printf("Endereco:\n");
      scanf("%[^\n]s",&reg.endereco);
      fprintf(ARQUIVO, "NOME: %s || ENDERECO: %s || ID: %i \n",reg.nome, reg.endereco, reg.numero);
    }
    fclose(ARQUIVO);
    if (numreg > 1)
    {
        printf("HOSPITAIS CADASTRADOS\n");
    }
    if (numreg == 1)
    {
        printf("HOSPITAL CADASTRADO\n");
    }
    system("pause");
    hospital();
  }
}

void cadareme()
{
  system ("cls");
  printf("CADASTRO DE MEDICAMNETO\n");
  reme regis;
  int mod, cont, numreg;
  FILE *REMEDIO;
  reme *prmt;
  REMEDIO = fopen("C:\\Users\\walla\\Desktop\\Programa\\Dados\\Remedio.txt","rt");
  if(REMEDIO == NULL)
  {
    mod=0;
  }
  else
  {
    mod=1;
  }
  fclose(REMEDIO);
  if(mod==1)
  {
    printf("CADASTROS EXISTENTES\n");
    printf("NUMERO DE MEDICAMENTOS A SEREM CADASTRADOS:\n");
    scanf("%d",&numreg);
    prmt = (reme*) malloc(numreg * sizeof(reme));
    printf("Bug\n");
    REMEDIO = fopen("C:\\Users\\walla\\Desktop\\Programa\\Dados\\Remedio.txt", "a");
    for (cont = 0; cont < numreg; cont++){
      setbuf(stdin,NULL);
      printf("Nome:\n");
      scanf("%[^\n]s",&regis.nome );
      printf("Codigo\n");
      scanf("%i",&regis.cod );
      printf("Observacao:\n");
      setbuf(stdin,NULL);
      scanf("%[^\n]s",&regis.obser );
      fprintf(REMEDIO, "NOME: %s || Codigo: %i || OBS: %s\n",regis.nome, regis.cod, regis.obser);
    }
    fclose(REMEDIO);
    if (numreg > 1)
    {
        printf("MEDICAMENTOS CADASTRADO\n");
    }
    if (numreg == 1)
    {
        printf("MEDICAMENTO CADASTRADO\n");
    }
    system("pause");
    remedios();
  }
  else
  {
    printf("PRIMEIRO CADASTRO!!! \n\n");
    printf("NUMERO DE MEDICAMENTOS A SEREM CADASTRADOS:\n");
    scanf("%d", &numreg);
    prmt = (reme*) malloc(numreg * sizeof(reme));
    REMEDIO = fopen("C:\\Users\\walla\\Desktop\\Programa\\Dados\\Remedio.txt", "a");
    for (cont = 0; cont < numreg; cont++)
    {
      setbuf(stdin,NULL);
      printf("Nome:\n");
      scanf("%[^\n]s",&regis.nome );
      printf("Codigo\n");
      scanf("%i",&regis.cod );
      printf("Observacao:\n");
      setbuf(stdin,NULL);
      scanf("%[^\n]s",&regis.obser );
      fprintf(REMEDIO, "NOME: %s || Codigo: %i || OBS: %s",regis.nome, regis.cod, regis.obser);
    }
    fclose(REMEDIO);
    if (numreg > 1)
    {
        printf("MEDICAMENTOS CADASTRADO\n");
    }
    if (numreg == 1)
    {
        printf("MEDICAMENTO CADASTRADO\n");
    }
    system("pause");
    remedios();
  }
}

void cadaforma()
{
  system ("cls");
  printf("CADASTRO DE FORMACAO MEDICA\n");
  printf("--------------------------\n");
  form reg;
  int mod, cont, numreg;
  FILE *ARQUIVO;
  form *prmt;
  ARQUIVO = fopen("C:\\Users\\walla\\Desktop\\Programa\\Dados\\Formacao.txt","rt");
  if(ARQUIVO == NULL)
  {
    mod=0;
  }
  else
  {
    mod=1;
  }
  fclose(ARQUIVO);
  if(mod==1)
  {
    printf("CADASTROS EXISTENTES\n\n");
    printf("NUMERO DE FORMACOES MEDICAS A SEREM CADASTRADOS: \n");
    scanf("%d",&numreg);
    prmt = (form*) malloc(numreg * sizeof(form));
    ARQUIVO = fopen("C:\\Users\\walla\\Desktop\\Programa\\Dados\\Formacao.txt", "a");
    for (cont = 0; cont < numreg; cont++){
      setbuf(stdin,NULL);
      printf("Nome:\n");
      scanf("%[^\n]s",&reg.nome);
      printf("Numero: \n");
      scanf("%i", &reg.numero);
      fprintf(ARQUIVO, "NOME: %s || NUMERO: %i \n",reg.nome, reg.numero);
    }
    fclose(ARQUIVO);
    if (numreg > 1)
    {
        printf("FORMACOES MEDICAS CADASTRADAS\n");
    }
    if (numreg == 1)
    {
        printf("FORMACAO MEDICA CADASTRADA\n");
    }
    system("pause");
    medico();
  }
  else
  {
    printf("PRIMEIRO CADASTRO!!! \n\n");
    printf("NUMERO DE FORMACOES MEDICAS A SEREM CADASTRADOS:\n");
    scanf("%d", &numreg);
    prmt = (form*) malloc(numreg * sizeof(form));
    ARQUIVO= fopen("C:\\Users\\walla\\Desktop\\Programa\\Dados\\Formacao.txt", "a");
    for (cont = 0; cont < numreg; cont++)
    {
      setbuf(stdin,NULL);
      printf("Nome:\n");
      scanf("%[^\n]s",&reg.nome);
      printf("Numero: \n");
      scanf("%i", &reg.numero);
      fprintf(ARQUIVO, "NOME: %s || NUMERO: %i \n",reg.nome, reg.numero);
    }
    fclose(ARQUIVO);
    if (numreg > 1)
    {
        printf("FORMACOES MEDICAS CADASTRADAS\n");
    }
    if (numreg == 1)
    {
        printf("FORMACAO MEDICA CADASTRADA\n");
    }
    system("pause");
    medico();
  }
}
//Excluir
void exclupaci()
{

}

void excluprotu()
{

}

void exclumed()
{

}

void excluhosp()
{

}

void exclureme()
{

}

void excluforma()
{

}

//Relatorio
void relapaci()
{

}

void relaprontu()
{

}

void relamedico()
{

}

void relahospita()
{

}

void relaremedi()
{

}

void relaforma()
{

}

//Outros
void sobre()
{
    system ("cls");
    printf("Software de Gerenciamento de Prontuario Medico\n");
    printf("Autor: Wallatan F P Souza \n");
    printf("Versao 1.0\n\n\n");
    system ("pause");
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/* FILE *AbrirArquivo(char modo,char caminho[30])
{
  FILE *REMEDIO;
    switch(modo)
    {
      case 'g':
      REMEDIO = fopen(caminho, "wt");
      break;
      case 'l':
      REMEDIO = fopen(caminho, "rt");
      break;
      case 'a':
      REMEDIO = fopen(caminho, "a");
      break;
    }
    if (REMEDIO == NULL)
    {
      printf("Nao foi possivel abrir o arquivo");
      exit(0);
    }
    return REMEDIO;
}

void FechaArquivo(FILE *REMEDIO)
{
  fclose(REMEDIO);
} */
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
