/*
*	ASPECTOS ESTRUTURAIS  INDENTAÇAO
*	ESTRUTURA DE DADOS(REGISTROS)  STRUCT
*	ALOCAÇAO DINAMICA
*	PERSISTENCIA EM ARQUIVOS
*	CONTER AS SEGUINTES FUNCIONALIDADES
*	----CADASTRAR,EXCLUIR,ALTERAR,LOCALIZAR
*	----RELATORIOS
*	MANTER RELACIONAMENTO ENTRE AS INFORMAÇOES
*/

// Sistema de Prontuario médico////////////////////////////////////////////////////////////////////////////////////////
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#include <conio.h>
#include <math.h>
#include <locale.h>

// Registros////////////////////////////////////////////////////////////////////////////////////////
typedef struct Paciente {   char nome[60];   long long cpf;   long rg;   long long contemer;   int mod;
}paci;

typedef struct Medico {
  char nome[60];   long long cpf;   long rg;   char crm[30];   long long tel;   int forma;   int mod; }medi;

  typedef struct Hospital{   char nome[60];   char endereco[100];   int numero;   int mod; }hospi;

  typedef struct Prontuario{   char observa[300];   char medico[30];   long long  paciente;   int hospital;   int mod; }prontu;

  typedef struct Formacao{   char nome[80];   int numero;   int mod; }form;

  ///Protótipos/////////////////////////////////////////////////////////////////////////////////// //Login////////////////////////////////////////////////////////////////////////////////////////   void login();

  //Menus////////////////////////////////////////////////////////////////////////////////////////
  void menu();   void paciente();   void prontuario();   void medico();   void hospital();   void formacao();

  //Menus////////////////////////////////////////////////////////////////////////////////////////
  int locaforma();   int locapaci();   int locaprontu();   int locamed();   int locahosp();

  //Consultar////////////////////////////////////////////////////////////////////////////////////////
  int consulforma();   int consulpaci();   int consulprotu();   int consulmed();   int consulhosp();

  //Consulta Pro e Medi/////////////////////////////////////////////////////////////////////////////
  void consulforma2();   int locaforma2();

  //Alterar////////////////////////////////////////////////////////////////////////////////////////
  void alterforma();   void alterpaci();   void alterprotu();   void altermed();   void alterhosp();

  //Cadastro////////////////////////////////////////////////////////////////////////////////////////
  void cadaforma();   void cadapaci();   void cadaprotu();   void cadamed();   void cadahosp();

  //Excluir////////////////////////////////////////////////////////////////////////////////////////
  void excluforma();   void exclupaci();   void excluprotu();   void exclumed();   void excluhosp();

  //Relatorio////////////////////////////////////////////////////////////////////////////////////////
  void relaforma();   void relapaci();   void relaprontu();   void relamedico();   void relahospita();


  //outros////////////////////////////////////////////////////////////////////////////////////////
  void sobre();
  //FILE AbrirArquivo();
  //void FechaArquvo();


  //Vars Globais////////////////////////////////////////////////////////////////////////////////////////
  FILE *ARQUIVO;
  FILE *ARQUIVOFUNC;   FILE *ARQUIVO2;
  char func[80];   int parame;

  //Main////////////////////////////////////////////////////////////////////////////////////////
  int main ()
  {
    printf("PROGRAMA DE PRONTUARIO\n");
    printf("--------------------------\n");
    menu();
    //login();   menu();
  }

  //Login////////////////////////////////////////////////////////////////////////////////////////
  /*void login () {     char usu[40], usuario[40];     long long  sen, senha;     strcpy(usuario, "wallatan");     senha == 123;     printf("LOGIN\n");     printf("Usuario:\n");     setbuf(stdin,NULL);     scanf("%[^\n]s", &usu);     if (strcmp (usu, usuario) == 0)
  {       printf("Senha:\n");       printf("%[^\n]s", &sen);       if (sen == senha)
  {
  printf("BEM VINDO %s\n", &usuario);
  menu();       }else
  {
  printf("Usuario Invalido\n");         login();         system("cls");
}
}else
{
printf("Usuario Invalido\n");       login();       system("cls");
}
}*/

//Menu////////////////////////////////////////////////////////////////////////////////////////
void menu() {   int op=0;   system ("cls");   printf("MENU PRINCIPAL\n\n");   printf("<1>. PACIENTE\n");   printf("<2>. PRONTUARIO\n");   printf("<3>. MEDICO\n");   printf("<4>. HOSPITAL\n");   printf("<5>. SOBRE\n");   printf("<6>. SAIR\n");   scanf("%i", &op);   switch (op) {     case 1:
  paciente();       menu();     case 2:       prontuario();       menu();     case 3:       medico();       menu();     case 4:       hospital();       menu();     case 5:       sobre();       menu();     case 6:
  printf("Finalizando programa\n");       printf("Bye\n");       exit(1);       break;     default:
  printf("Opcao inexistente\n");       printf("Escolha a opcao correta\n");       system("pause");       menu();   }
}

void paciente() {   int op;   system ("cls");
printf("MENU PACIENTE\n");   printf("--------------------------\n");
printf("ESCOLHA A OPCAO DESESEJADA\n\n");   printf("<1>. CONSULTAR\n");   printf("<2>. ALTERAR\n");   printf("<3>. CADASTRAR\n");   printf("<4>. EXCLUIR\n");   printf("<5>. RELATORIO\n");   printf("<6>. VOLTAR\n");   scanf("%i", &op);   switch (op) {     case 1:       consulpaci();       paciente();     case 2:       alterpaci();       paciente();     case 3:       cadapaci();       paciente();     case 4:       exclupaci();       paciente();     case 5:       system("cls");       relapaci();       paciente();     case 6:       menu();     default:
printf("Opcao inexistente\n");       printf("Escolha a opcao correta\n");       system("pause");
paciente();
}
}

void prontuario() {   int op;   system ("cls");
printf("MENU DE PRONTUARIO\n");
printf("--------------------------\n");
printf("ESCOLHA A OPCAO DESESEJADA\n\n");   printf("<1>. CONSULTAR\n");   printf("<2>. ALTERAR\n");   printf("<3>. CADASTRAR\n");   printf("<4>. CONSULTAR\n");   printf("<5>. RELATORIO\n");   printf("<6>. VOLTAR\n");   scanf("%i", &op);   switch (op) {     case 1:       consulprotu();       prontuario();     case 2:       alterprotu();       prontuario();     case 3:       cadaprotu();       prontuario();     case 4:       consulprotu();       prontuario();     case 5:
  system("cls");       relaprontu();       prontuario();     case 6:       menu();     default:
  printf("Opcao inexistente\n");       printf("Escolha a opcao correta\n");       system("pause");       prontuario();
}
}

void medico() {   int op;   system ("cls");
printf("MENU DE MEDICO\n");
printf("--------------------------\n");
printf("ESCOLHA A OPCAO DESESEJADA\n\n");
printf("<1>. Consultar\n");   printf("<2>. Alterar\n");   printf("<3>. Cadastrar\n");   printf("<4>. Excluir\n");   printf("<5>. Relatorio\n");   printf("<6>. Menu Formacao\n");   printf("<7>. Voltar ao menu principal\n");   scanf("%i", &op);   switch (op) {     case 1:       consulmed();       medico();
  case 2:       altermed();       medico();     case 3:       cadamed();       medico();     case 4:       exclumed();       medico();     case 5:       system("cls");       relamedico();       medico();     case 6:       formacao();       medico();     case 7:       menu();     default:
  printf("Opcao inexistente\n");       printf("Escolha a opcao correta\n");       system("pause");       medico();
}
}

void formacao() { int op; system ("cls");
printf("MENU DE FORMACAO MEDICA\n"); printf("ESCOLHA A OPCAO DESESEJADA\n\n"); printf("<1>. Consultar\n"); printf("<2>. Alterar\n"); printf("<3>. Cadastrar\n"); printf("<4>. Excluirt\n"); printf("<5>. Relatorio\n"); printf("<6>. Voltar ao menu principal\n"); scanf("%i", &op); switch (op) {     case 1:       consulforma();       formacao();     case 2:       alterforma();       formacao();     case 3:       cadaforma();       formacao();     case 4:       excluforma();       formacao();     case 5:       system("cls");       relaforma();       formacao();     case 6:       menu();     default:
printf("Opcao inexistente\n");       printf("Escolha a opcao correta\n");       system("pause");       formacao();
}
}

void hospital() {   int op;   system ("cls");
printf("MENU DE HOSPITAL\n");
printf("--------------------------\n");
printf("ESCOLHA A OPCAO DESESEJADA\n\n");
printf("<1>. Consultar\n");   printf("<2>. Alterar\n");   printf("<3>. Cadastrar\n");   printf("<4>. Consultar\n");   printf("<5>. Relatorio\n");   printf("<6>. Voltar ao menu principal\n");   scanf("%i", &op);   switch (op) {     case 1:       consulhosp();       hospital();     case 2:       alterhosp();       hospital();     case 3:       cadahosp();       hospital();     case 4:       consulhosp();       hospital();     case 5: system("cls"); relahospita();
hospital();     case 6:       menu();     default:
printf("Opcao inexistente\n");       printf("Escolha a opcao correta\n");       system("pause");       hospital();
}
}

//Cadastro////////////////////////////////////////////////////////////////////////////////////////
void cadapaci() {   system ("cls");
printf("CADASTRO DE PACIENTE\n");
printf("--------------------------\n");   paci pacie;   int mod=1, cont, numreg;   paci *prmt;
ARQUIVO = fopen("Paciente.dat","rb");   if(ARQUIVO == NULL)
{
  mod=0;
}   else
{
  mod=1;
}
fclose(ARQUIVO);   if(mod==1)
{
  printf("CADASTROS EXISTENTES\n\n");     printf("NUMERO DE PACIENTES A SEREM CADASTRADOS:\n");
  scanf("%d",&numreg);     prmt = (paci*) realloc(prmt, numreg * sizeof(paci));     ARQUIVO = fopen("Paciente.dat", "ab+");     for (cont = 0; cont < numreg; cont++){       setbuf(stdin,NULL);       printf("Nome:\n");       scanf("%[^\n]s",&pacie.nome);       printf("CPF\n");       scanf("%lld",&pacie.cpf);       printf("RG:\n");       scanf("%ld", &pacie.rg);       printf("Contato de Emergencia:\n");       scanf("%lld", &pacie.contemer);       pacie.mod = 1;       fwrite(&pacie, sizeof(struct Paciente), 1, ARQUIVO);
}
fclose(ARQUIVO);
}   else
{
  printf("PRIMEIRO CADASTRO!!!\n\n");     printf("NUMERO DE PACIENTES A SEREM CADASTRADOS:\n");
  scanf("%d", &numreg);     prmt = (paci*) malloc(numreg * sizeof(paci));     ARQUIVO= fopen("Paciente.dat", "ab+");     for (cont = 0; cont < numreg; cont++)
  {
    setbuf(stdin,NULL); printf("Nome:\n"); scanf("%[^\n]s",&pacie.nome); printf("CPF\n");       scanf("%lld",&pacie.cpf);       printf("RG:\n");       scanf("%ld", &pacie.rg);       printf("Contato de Emergencia:\n");       scanf("%lld", &pacie.contemer);       pacie.mod = 1;       fwrite(&pacie, sizeof(struct Paciente), 1, ARQUIVO);
  }
  fclose(ARQUIVO);
}   if (numreg > 1)
{
  printf("PACIENTES CADASTRADO\n");
}
if (numreg == 1)
{
  printf("PACIENTE CADASTRADO\n");
}
system("pause");
}

void cadaprotu() {   system ("cls");
printf("CADASTRO DE PRONTUARIO\n");
printf("--------------------------\n");   prontu reg;   int mod, cont, numreg;   prontu *prmt;
ARQUIVO = fopen("Prontuario.dat","rt"); if(ARQUIVO == NULL)
{
  mod=0;
}   else
{
  mod=1;
}
fclose(ARQUIVO);   if(mod==1)
{
  printf("CADASTROS EXISTENTES\n\n");     printf("NUMERO DE PRONTUARIOS A SEREM CADASTRADOS:\n");
  scanf("%d", &numreg);     prmt = (prontu*) realloc(prmt, numreg * sizeof(prontu));     ARQUIVO= fopen("Prontuario.dat", "ab+");     printf("CADASTRO DE PRONTUARIO\n");
  for (cont = 0; cont < numreg; cont++)
  {       relahospita();       setbuf(stdin,NULL);       printf("--------------------------\n");       printf("\nID Do Hospital:\n");       scanf("%i",&reg.hospital);       relamedico();       setbuf(stdin,NULL);       printf("--------------------------\n");       printf("\nCRM Do Medico: \n");       scanf("%[^\n]s",&reg.medico);
  relapaci();       fflush(stdin); printf("--------------------------\n"); printf("\nCPF Do Pacinte: \n"); scanf("%lld", &reg.paciente);       setbuf(stdin,NULL);       printf("--------------------------\n");       printf("\nObservacao e Receitas Medicas:\n");       scanf("%[^\n]s",&reg.observa);       reg.mod = 1;       fwrite(&reg, sizeof(struct Prontuario), 1, ARQUIVO);
}
fclose(ARQUIVO);
} else
{
  printf("PRIMEIRO CADASTRO\n\n");     printf("NUMERO DE PRONTUARIOS A SEREM CADASTRADOS:\n");
  scanf("%d", &numreg);     prmt = (prontu*) malloc(numreg * sizeof(prontu));     ARQUIVO= fopen("Prontuario.dat", "ab+");     for (cont = 0; cont < numreg; cont++)
  {       relahospita();       setbuf(stdin,NULL);       printf("--------------------------\n");       printf("\nID Do Hospital:\n");       scanf("%i",&reg.hospital);       relamedico();       setbuf(stdin,NULL);       printf("--------------------------\n");       printf("\nCRM Do Medico: \n");       scanf("%[^\n]s",&reg.medico);
  relapaci();       fflush(stdin);       printf("--------------------------\n");       printf("\nCPF Do Pacinte: \n");       scanf("%lld", &reg.paciente);       setbuf(stdin,NULL);       printf("--------------------------\n");       printf("\nObservacao e Receitas Medicas:\n");       scanf("%[^\n]s",&reg.observa);       reg.mod = 1;       fwrite(&reg, sizeof(struct Prontuario), 1, ARQUIVO);
}
fclose(ARQUIVO);
}   if (numreg > 1)
{
  printf("PRONTUARIOS CADASTRADOS\n");
}
if (numreg == 1)
{
  printf("PRONTUARIO CADASTRADO\n");
}
system("pause");
}

void cadamed() {   system ("cls");
printf("CADASTRO MEDICO\n");
printf("--------------------------\n");   medi reg;   int mod, cont, numreg;   medi *prmt;
ARQUIVO = fopen("Medico.dat","rb");   if(ARQUIVO == NULL)
{
  mod=0;
}   else
{
  mod=1;
}
fclose(ARQUIVO);   if(mod==1)
{
  printf("CADASTROS EXISTENTES\n\n");     printf("NUMERO DE MEDICOS A SEREM CADASTRADOS:\n");
  scanf("%d",&numreg);     prmt = (medi*) realloc(prmt, numreg * sizeof(medi));     ARQUIVO = fopen("Medico.dat", "ab+");     for (cont = 0; cont < numreg; cont++){       setbuf(stdin,NULL);       printf("Nome:\n");       scanf("%[^\n]s",&reg.nome);       printf("CPF: \n");       scanf("%lld", &reg.cpf);       printf("RG:\n");       scanf("%ld",&reg.rg);       setbuf(stdin,NULL);       printf("CRM:\n");       scanf("%[^\n]s",&reg.crm);       printf("TELEFONE:\n");       scanf("%lld", &reg.tel);       relaforma();       printf("Formacao: \n");       scanf("%i", &reg.forma);       reg.mod = 1;       fwrite(&reg, sizeof(struct Medico), 1, ARQUIVO);     }
  fclose(ARQUIVO);
}   else
{
  printf("PRIMEIRO CADASTRO!!! \n\n");     printf("NUMERO DE MEDICOS A SEREM CADASTRADOS:\n");
  scanf("%d", &numreg);     prmt = (medi*) malloc(numreg * sizeof(medi));     ARQUIVO= fopen("Medico.dat", "ab+");     for (cont = 0; cont < numreg; cont++)
  {
    setbuf(stdin,NULL);       printf("Nome:\n");       scanf("%[^\n]s",&reg.nome);       printf("CPF: \n");       scanf("%lld", &reg.cpf);       printf("RG:\n");       scanf("%ld",&reg.rg);       setbuf(stdin,NULL);       printf("CRM:\n");       scanf("%[^\n]s",&reg.crm);       printf("TELEFONE:\n");       scanf("%lld",&reg.tel);       relaforma();       printf("Formacao:\n");       scanf("%i",&reg.forma);       reg.mod = 1;       fwrite(&reg, sizeof(struct Medico), 1, ARQUIVO);
  }
  fclose(ARQUIVO);
}
if (numreg > 1)
{
  printf("MEDICOS CADASTRADOS\n");
}
if (numreg == 1)
{
  printf("MEDICO CADASTRADO\n");
}
system("pause");   medico(); }

void cadahosp() {   system ("cls");
printf("CADASTRO DE HOSPITAL\n");
printf("--------------------------\n");   hospi reg;   int mod, cont, numreg;   hospi *prmt;   ARQUIVO = fopen("Hospital.dat","rb");   if(ARQUIVO == NULL)
{
  mod=0;
}   else
{
  mod=1;
}
fclose(ARQUIVO); if(mod==1)
{
  printf("CADASTROS EXISTENTES\n\n");     printf("NUMERO DE HOSPITAIS A SEREM CADASTRADOS:\n");
  scanf("%d",&numreg);     prmt = (hospi*) realloc(prmt, numreg * sizeof(hospi));     ARQUIVO = fopen("Hospital.dat", "ab+");     for (cont = 0; cont < numreg; cont++){       fflush(stdin);       printf("Nome:\n");       scanf("%[^\n]s",&reg.nome);       fflush(stdin);       printf("Endereco:\n");       scanf("%[^\n]s",&reg.endereco);       fflush(stdin);       printf("ID: \n");       scanf("%f", &reg.numero);       reg.mod = 1;       fwrite(&reg, sizeof(struct Hospital), 1, ARQUIVO);
}
fclose(ARQUIVO);
}   else
{
  printf("PRIMEIRO CADASTRO!!! \n\n");     printf("NUMERO DE HOSPITAIS A SEREM CADASTRADOS:\n");
  scanf("%d", &numreg);     prmt = (hospi*) malloc(numreg * sizeof(hospi));     ARQUIVO= fopen("Hospital.dat", "ab+");     for (cont = 0; cont < numreg; cont++)
  {       fflush(stdin);       printf("Nome:\n");       scanf("%[^\n]s",&reg.nome);       fflush(stdin);       printf("Endereco:\n");       scanf("%[^\n]s",&reg.endereco);       fflush(stdin);       printf("ID: \n");       scanf("%i", &reg.numero);       reg.mod = 1;       fwrite(&reg, sizeof(struct Hospital), 1, ARQUIVO);
}
fclose(ARQUIVO);
}   if (numreg > 1)
{
  printf("HOSPITAIS CADASTRADOS\n");
}
if (numreg == 1)
{
  printf("HOSPITAL CADASTRADO\n");
}
system("pause");
}

void cadaforma() {   system ("cls");
printf("CADASTRO DE FORMACAO MEDICA\n");
printf("--------------------------\n");   form reg; int mod, cont, numreg; form *prmt;
ARQUIVO = fopen("Formacao.dat","rb"); if(ARQUIVO == NULL)
{
  mod=0;
}   else
{
  mod=1;
}
fclose(ARQUIVO);   if(mod==1)
{
  printf("CADASTROS EXISTENTES\n\n");     printf("NUMERO DE FORMACOES MEDICAS A SEREM CADASTRADOS: \n");
  scanf("%d",&numreg);     prmt = (form*) realloc(prmt, numreg * sizeof(form));     ARQUIVO = fopen("Formacao.dat", "a");     for (cont = 0; cont < numreg; cont++){       setbuf(stdin,NULL);       printf("Nome:\n");       scanf("%[^\n]s",&reg.nome);       printf("Numero: \n");       scanf("%i", &reg.numero);       reg.mod = 1;       fwrite(&reg, sizeof(struct Formacao), 1, ARQUIVO);
}
fclose(ARQUIVO);
}   else
{
  printf("PRIMEIRO CADASTRO!!! \n\n");     printf("NUMERO DE FORMACOES MEDICAS A SEREM CADASTRADOS:\n");
  scanf("%d", &numreg);     prmt = (form*) malloc(numreg * sizeof(form));     ARQUIVO= fopen("Formacao.dat", "a");     for (cont = 0; cont < numreg; cont++)
  {
    setbuf(stdin,NULL);       printf("Nome:\n");       scanf("%[^\n]s",&reg.nome);       printf("Numero: \n");       scanf("%i", &reg.numero);       reg.mod = 1;       fwrite(&reg, sizeof(struct Formacao), 1, ARQUIVO);
  }
  fclose(ARQUIVO);
}   if (numreg > 1)
{
  printf("FORMACOES MEDICAS CADASTRADAS\n");
}
if (numreg == 1)
{
  printf("FORMACAO MEDICA CADASTRADA\n");
}
system("pause");
}

//Relatorio////////////////////////////////////////////////////////////////////////////////////////
void relapaci()
{
  printf("RELATORIO DE PACIENTE\n\n");
  printf("--------------------------\n"); paci reg; int cont=0;
  ARQUIVOFUNC = fopen("Paciente.dat", "rb");
  if (ARQUIVOFUNC == NULL)
  {
    fclose(ARQUIVOFUNC);     printf("Sem Arquivo Para Relatorio\n");     system("pause");
  }else
  {
    fclose(ARQUIVO);
    ARQUIVOFUNC = fopen("Paciente.dat", "rb");     fseek(ARQUIVOFUNC, 0L, SEEK_SET);     fread(&reg, sizeof(struct Paciente), 1, ARQUIVOFUNC);
    do
    {       if (reg.mod != 0)
      {
        printf("PACIENTE: %i\n", cont+1);         printf("NOME: %s || CPF: %lld || RG: %ld || CRM: %lld\n", reg.nome, reg.cpf, reg.rg, reg.contemer);         cont++;
      }
      fread(&reg, sizeof(struct Paciente), 1, ARQUIVOFUNC);
    }
    while(!feof(ARQUIVOFUNC));     fclose(ARQUIVOFUNC);     printf("N. REGISTROS: %i\n\n", cont);     system("pause");
  }
}

void relaprontu()
{
  printf("RELATORIO DE PRONTUARIO\n\n");
  printf("--------------------------\n");
  prontu reg;   int cont=0;
  ARQUIVOFUNC = fopen("Prontuario.dat", "rb");   if (ARQUIVOFUNC == NULL)
  {
    fclose(ARQUIVOFUNC);     printf("Sem Arquivo Para Relatorio\n");     system("pause");
  }else
  {
    fclose(ARQUIVO);
    ARQUIVOFUNC = fopen("Prontuario.dat", "rb");     fseek(ARQUIVOFUNC, 0L, SEEK_SET);     fread(&reg, sizeof(struct Prontuario), 1, ARQUIVOFUNC);
    do
    {       if (reg.mod != 0)
      {
        printf("PRONTUARIO: %i\n", cont+1);
        printf("HOSPITAL: %i\n || PACIENTE: %i\n || MEDICO: %s\n || OBSERVACAO: %s\n", reg.hospital, reg.paciente, reg.medico, reg.observa);         cont++;
      }
      fread(&reg, sizeof(struct Prontuario), 1, ARQUIVOFUNC);
    }
    while(!feof(ARQUIVOFUNC));     fclose(ARQUIVOFUNC);     printf("N. REGISTROS: %i\n\n", cont);     system("pause");
  }
}

void relamedico()
{
  printf("RELATORIO MEDICO\n\n");
  printf("--------------------------\n");   medi reg;   int cont=0;
  ARQUIVOFUNC = fopen("Medico.dat","rb");   if (ARQUIVOFUNC == NULL)
  {
    fclose(ARQUIVOFUNC);
    printf("\nSem Arquivo Para Relatorio \n\n");     system("pause");
  }else
  {
    fclose(ARQUIVO);
    ARQUIVOFUNC = fopen("Medico.dat", "rb");     fseek(ARQUIVOFUNC, 0L, SEEK_SET);     fread(&reg, sizeof(struct Medico), 1, ARQUIVOFUNC);
    do
    {       if (reg.mod != 0)
      {
        printf("PRONTUARIO: %i\n", cont+1);
        printf("NOME: %s || CPF: %lld|| RG: %ld || CRM: %s || TELEFONE: %lld || ESPECIALIZACAO: %i \n", reg.nome, reg.cpf, reg.rg, reg.crm, reg.tel, reg.forma);         cont++;
      }
      fread(&reg, sizeof(struct Medico), 1, ARQUIVOFUNC);
    }
    while(!feof(ARQUIVOFUNC));     fclose(ARQUIVOFUNC);     printf("N. REGISTROS: %i\n\n", cont);     system("pause");
  }

}

void relahospita()
{
  printf("RELATORIO HOSPITAL\n\n");
  printf("--------------------------\n");   hospi reg;   int cont=0;
  ARQUIVOFUNC = fopen("Hospital.dat", "rb");   if (ARQUIVOFUNC == NULL)
  {
    fclose(ARQUIVOFUNC);     printf("Sem Arquivo Para Relatorio\n");     system("pause");
  }else
  {
    fclose(ARQUIVO);
    ARQUIVOFUNC = fopen("Hospital.dat", "rb");     fseek(ARQUIVO, 0L, SEEK_SET);     fread(&reg, sizeof(struct Hospital), 1, ARQUIVOFUNC);
    do
    {       if (reg.mod != 0)
      {
        printf("HOSPITAL: %i\n", cont+1);         printf("NOME: %s || ENDERECO: %s || ID: %i\n", reg.nome, reg.endereco, reg.numero);
        cont++;
      }
      fread(&reg, sizeof(struct Hospital), 1, ARQUIVOFUNC);
    }
    while(!feof(ARQUIVOFUNC));
    fclose(ARQUIVOFUNC);     printf("N. REGISTROS: %i\n\n", cont);     system("pause");
  }
}

void relaforma()
{
  printf("RELATORIO FORMACAO\n\n");
  printf("--------------------------\n");   form reg;   int cont=0;
  ARQUIVOFUNC = fopen("Formacao.dat", "rb");   if (ARQUIVOFUNC == NULL)
  {
    fclose(ARQUIVOFUNC);     printf("Sem Arquivo Para Relatorio\n");     system("pause");
  }else
  {
    fclose(ARQUIVO);
    ARQUIVOFUNC = fopen("Formacao.dat", "rb");     fseek(ARQUIVOFUNC, 0L, SEEK_SET);     fread(&reg, sizeof(struct Formacao), 1, ARQUIVOFUNC);
    do
    {       if (reg.mod != 0)
      {
        printf("FORMACAO: %i\n", cont+1);         printf("NOME: %s || NUMERO: %i\n", reg.nome, reg.numero);
        cont++;
      }
      fread(&reg, sizeof(struct Formacao), 1, ARQUIVOFUNC);
    }
    while(!feof(ARQUIVOFUNC));     fclose(ARQUIVOFUNC);     printf("N. REGISTROS: %i\n\n", cont);     system("pause");
  }
}

//Localizar////////////////////////////////////////////////////////////////////////////////////////
int locapaci() {   paci reg;   int posi=0, loca=-1;   long long var;
  ARQUIVOFUNC = fopen("Paciente.dat","ab+");   setbuf(stdin,NULL);   printf("CPF DO PACIENTE:\n");   scanf("%lld", &var);   while((!feof(ARQUIVOFUNC))&&(loca==-1))
  {
    fread(&reg, sizeof(struct Paciente), 1, ARQUIVOFUNC);     if (!feof(ARQUIVOFUNC))
    {       if (var == reg.cpf)
      {
        if (reg.mod == 0)
        {           posi=-2;         }         loca=1;
      }
      else       {         posi++;
      }     }     else     {       posi=-1;
      }   }   if (loca==-1)
      {     posi=-1;
      }
      fclose(ARQUIVO);
      return(posi);
    }

    int locaprontu() {   prontu reg;   int posi=0, loca=-1;   long long var;
      ARQUIVOFUNC = fopen("Prontuario.dat","ab+");   setbuf(stdin,NULL);   printf("INFORME O CPF DO PACIENTE:\n");
      scanf("%lld", &var);   while((!feof(ARQUIVOFUNC))&&(loca==-1))
      {
        fread(&reg, sizeof(struct Prontuario), 1, ARQUIVOFUNC);     if (!feof(ARQUIVOFUNC))
        {
          if (var == reg.paciente)
          {
            if (reg.mod == 0)
            {           posi=-2;         }         loca=1;       }       else       {         posi++;
            }     }     else     {       posi=-1;
            }   }   if (loca==-1)
            {     posi=-1;
            }
            fclose(ARQUIVO);
            return(posi);
          }

          int locamed() {   medi reg;   int posi=0, loca=-1;   char var[30];
            ARQUIVOFUNC = fopen("Medico.dat","ab+");   setbuf(stdin,NULL);   printf("INFORME O CRM DO MEDICO:\n");
            scanf("%s", &var);   while((!feof(ARQUIVOFUNC))&&(loca==-1))
            {
              fread(&reg, sizeof(struct Medico), 1, ARQUIVOFUNC);     if (!feof(ARQUIVOFUNC))
              {
                if (strncmp (var, reg.crm, 30)== 0)
                {
                  if (reg.mod == 0)
                  {           posi=-2;         }         loca=1;       }       else       {         posi++;
                  }     }     else     {       posi=-1;
                  }   }   if (loca==-1)
                  {     posi=-1;
                  }
                  fclose(ARQUIVO);
                  return(posi);
                }

                int locaforma() {   form reg;   int posi=0, loca=-1;   long long var;
                  ARQUIVOFUNC = fopen("Formacao.dat","ab+");   setbuf(stdin,NULL);
                  printf("INFORME O NUMERO DA FORMACAO:\n");
                  scanf("%lld", &var);   while((!feof(ARQUIVOFUNC))&&(loca==-1))
                  {
                    fread(&reg, sizeof(struct Formacao), 1, ARQUIVOFUNC);     if (!feof(ARQUIVOFUNC))
                    {
                      if (var == reg.numero)
                      {
                        if (reg.mod == 0)
                        {           posi=-2;         }         loca=1;       }       else       {         posi++;
                        }     }     else     {       posi=-1; }   }   if (loca==-1)
                        {     posi=-1;
                        }
                        fclose(ARQUIVO);
                        return(posi);
                      }

                      int locahosp() {   hospi reg;   int posi=0, loca=-1;   long long var;
                        ARQUIVOFUNC = fopen("Hospital.dat","ab+");   setbuf(stdin,NULL);   printf("INFORME O NUMERO DO HOSPITAL:\n");
                        scanf("%lld", &var);   while((!feof(ARQUIVOFUNC))&&(loca==-1))
                        {
                          fread(&reg, sizeof(struct Hospital), 1, ARQUIVOFUNC);     if (!feof(ARQUIVOFUNC))
                          {
                            if (var == reg.numero)
                            {
                              if (reg.mod == 0)
                              {           posi=-2;         }         loca=1;
                            }
                            else       {         posi++;
                            }     }     else     {       posi=-1;
                            }   }   if (loca==-1)
                            {     posi=-1;
                            }
                            fclose(ARQUIVO);
                            return(posi);
                          }

                          //Consulta////////////////////////////////////////////////////////////////////////////////////////
                          int consulpaci()
                          {
                            printf("CONSULTA DE PACIENTE\n");
                            printf("--------------------------\n");   paci reg;   int posi;   posi = locapaci();   if(posi==-1)
                            {
                              printf("\nPACIENTE NAO ENCONTRADO!!!\n");
                            }   else if(posi==-2)
                            {
                              printf("\n PACIENTE FOI REMOVIDO!!!\n");
                            }   else
                            {
                              ARQUIVOFUNC = fopen("Paciente.dat","rb+");     fseek(ARQUIVOFUNC,posi*sizeof(struct Paciente),SEEK_SET);     fread(&reg , sizeof(struct Paciente) , 1 , ARQUIVOFUNC);     printf("\nNOME: %s || CPF: %lld || RG: %ld || CONTATO DE EMERGENCIA: %lld\n",reg.nome, reg.cpf, reg.rg, reg.contemer);

                            }
                            fclose(ARQUIVOFUNC);
                            system("pause");
                          }

                          int consulprotu()
                          {
                            printf("CONSULTA DE PRONTUAIRO\n");
                            printf("--------------------------\n");   prontu reg;   int posi;   posi = locaprontu();   if(posi==-1)
                            {
                              printf("\nPRONTUARIO NAO ENCONTRADO!!!\n");
                              system("pause");
                            }   else if(posi==-2)
                            {
                              printf("\nPRONTUARIO FOI EXCLUIDO!\n");
                            }   else   { ARQUIVOFUNC = fopen("Prontuario.dat","rb+");     fseek(ARQUIVOFUNC,posi*sizeof(struct Prontuario),SEEK_SET);     fread(&reg , sizeof(struct Prontuario) , 1 , ARQUIVOFUNC);
                            printf("\nHOSPITAL: %i || PACIENTE: %lld || MEDICO: %s || OBSERVACAO: %s\n",reg.hospital, reg.paciente, reg.medico, reg.observa);

                          }
                          fclose(ARQUIVOFUNC);
                          system("pause");
                        }

                        int consulmed()
                        {
                          printf("CONSULTA DE MEDICO\n");
                          printf("--------------------------\n");   medi reg;   char formacao[80];   int posi;   posi = locamed();   if(posi==-1)
                          {
                            printf("\nMEDICO NAO ENCONTRADO!!!\n");
                          }   else if(posi==-2)
                          {
                            printf("\nMEDICO FOI EXCLUIDO!\n");     system("pause");
                          }   else
                          {
                            ARQUIVOFUNC = fopen("Medico.dat","rb+");     fseek(ARQUIVOFUNC,posi*sizeof(struct Medico),SEEK_SET);     fread(&reg , sizeof(struct Medico) , 1 , ARQUIVOFUNC); parame == reg.forma;
                            printf("\nNOME: %s || CPF: %lld || RG: %ld || CRM: %S || TELEFONE: %lld || FORMACAO: %s\n",reg.nome, reg.cpf, reg.rg, reg.crm, reg.tel, func);
                          }
                          fclose(ARQUIVOFUNC);
                          system("pause");
                        }

                        int consulhosp()
                        {
                          printf("CONSULTA DE HOSPITAL\n");
                          printf("--------------------------\n");   hospi reg;   int posi;   posi = locahosp();   if(posi==-1)
                          {
                            printf("\nHOSPITAL NAO ENCONTRADO!!!\n");
                          }   else if(posi==-2)
                          {
                            printf("\nHOSPITAL FOI EXCLUIDO!\n");     system("pause");
                          }   else
                          {
                            ARQUIVOFUNC = fopen("Hospital.dat","rb+");     fseek(ARQUIVOFUNC,posi*sizeof(struct Hospital),SEEK_SET);     fread(&reg , sizeof(struct Hospital) , 1 , ARQUIVOFUNC);     printf("\nNOME: %s || ENDERECO: %s || NUMERO: %i\n",reg.nome, reg.endereco, reg.numero);

                          }
                          fclose(ARQUIVOFUNC);
                          system("pause");
                        }

                        int consulforma()
                        {
                          printf("CONSULTA DE FORMACAO MEDICA\n");
                          printf("--------------------------\n");   form reg;   int posi;   posi = locaforma();   if(posi==-1)
                          {
                            printf("\nFORMACAO NAO ENCONTRADA!!!\n");
                          }   else if(posi==-2)
                          {
                            printf("\nFORMACAO FOI EXCLUIDA!\n");
                            system("pause");
                          }   else
                          {
                            ARQUIVOFUNC = fopen("Formacao.dat","rb+");     fseek(ARQUIVOFUNC,posi*sizeof(struct Formacao),SEEK_SET);     fread(&reg , sizeof (struct Formacao), 1 , ARQUIVOFUNC);     printf("\nNOME: %s || NUMERO: %i\n",reg.nome, reg.numero);
                          }
                          fclose(ARQUIVOFUNC);
                          system("pause");
                        }

                        //Consulta Pro e Medi/////////////////////////////////////////////////////////////////////////////
                        void consulforma2()
                        {   int posi;   form reg;   posi = locaforma2(parame);   if(posi== -1)
                          {
                            func == "Referencia Errada";
                          }   else if(posi==-2)
                          {
                            func == "Referencia Errada";
                          }   else
                          {
                            ARQUIVO2 = fopen("Formacao.dat","rb+");     fseek(ARQUIVO2,posi*sizeof(struct Formacao),SEEK_SET);     fread(&reg , sizeof (struct Formacao), 1, ARQUIVO2);     func == reg.nome;
                          }
                          fclose(ARQUIVO2);
                        }

                        int locaforma2(int posicao)
                        {   form reg;   int posi=0, loca=-1;   int var;
                          ARQUIVO2 = fopen("Formacao.dat","ab+");   setbuf(stdin,NULL);   var = posicao;   while((!feof(ARQUIVO2))&&(loca==-1))
                          {
                            fread(&reg, sizeof(struct Formacao), 1, ARQUIVO2);     if (!feof(ARQUIVO2))
                            {
                              if (var == reg.numero)
                              {
                                if (reg.mod == 0)
                                {           posi=-2;         }         loca=1;       }       else       {         posi++;
                                }     }     else     {       posi=-1;
                                }   }   if (loca==-1)
                                {     posi=-1;
                                }
                                fclose(ARQUIVO2);
                                return(posi);
                              }

                              //Alterar////////////////////////////////////////////////////////////////////////////////////////
                              void alterpaci()
                              {
                                paci reg;   int pos;   pos = consulpaci();   if (pos == -1)
                                {     printf("Paciente nao existe no arquivo\n");
                              }   else if (pos == -2)
                              {
                                printf("Paciente nao existe no arquivo ou foi apagado\n");
                              }   else
                              {     fopen("Paciente.dat","rb+");     fseek(ARQUIVO , pos * sizeof(struct Paciente) , SEEK_CUR);     fread(&reg , sizeof(struct Paciente) , 1 , ARQUIVO);     printf("\nALTERAR PACIENTE\n");
                              printf("--------------------------\n");
                              printf("\nNOME: %s || CPF: %lld|| RG: %i || CONTATO DE EMERGENCIA: %lld\n",reg.nome, reg.cpf, reg.rg, reg.contemer);
                              printf("--------------------------\n");     printf("\nDigite as novas informacoes:\n");     setbuf(stdin,NULL);     printf("Nome:\n");     scanf("%[^\n]s",&reg.nome);     printf("CPF\n");     scanf("%lld",&reg.cpf);     printf("RG:\n");     scanf("%ld", &reg.rg);     printf("Contato de Emergencia:\n");     scanf("%lld", &reg.contemer);     reg.mod = 1;     fseek(ARQUIVO , pos * sizeof(struct Paciente) , SEEK_SET); if(fwrite(&reg , sizeof(struct Paciente) , 1 , ARQUIVO) != 1)
                              {
                                printf("\nErro na gravacao\n");
                              }     else
                              {
                                printf("\nEdicao feita com sucesso\n");
                              }
                            }
                            fclose(ARQUIVO);   system("pause");
                          }

                          void alterprotu() {   prontu reg;   int pos;   pos = consulprotu();   if (pos == -1)
                            {     printf("Prontuario nao existe no arquivo\n");
                          }   else if (pos == -2)
                          {
                            printf("Prontuario nao existe no arquivo ou foi apagado\n");
                          }   else
                          {     fopen("Prontuario.dat","rb+");     fseek(ARQUIVO , pos * sizeof(struct Prontuario) , SEEK_CUR);     fread(&reg , sizeof(struct Prontuario) , 1 , ARQUIVO);     printf("\nALTERAR PRONTUAIRO\n"); printf("--------------------------\n");
                          printf("HOSPITAL: %i\n || PACIENTE: %i\n || MEDICO: %s\n || OBSERVACAO: %s\n", reg.hospital, reg.paciente, reg.medico, reg.observa);     printf("--------------------------\n");     printf("\nDigite as novas informacoes:\n");     relahospita();     setbuf(stdin,NULL);     printf("--------------------------\n");     printf("\nID Do Hospital:\n");     scanf("%i",&reg.hospital);     relamedico();     setbuf(stdin,NULL);     printf("--------------------------\n");     printf("\nCRM Do Medico: \n");     scanf("%[^\n]s",&reg.medico);     relapaci();     fflush(stdin);     printf("--------------------------\n");     printf("\nCPF Do Pacinte: \n");     scanf("%lld", &reg.paciente);     setbuf(stdin,NULL);     printf("--------------------------\n");     printf("\nObservacao e Receitas Medicas:\n");     scanf("%[^\n]s",&reg.observa);     reg.mod = 1;     fseek(ARQUIVO , pos * sizeof(struct Prontuario) , SEEK_SET);     if(fwrite(&reg , sizeof(struct Prontuario), 1 , ARQUIVO) != 1)
                          {
                            printf("\nErro na gravacao\n");
                          }     else
                          {
                            printf("\nEdicao feita com sucesso\n");
                          }
                        }
                        fclose(ARQUIVO);   system("pause");
                      }

                      void altermed()
                      {   medi reg;   int pos;   pos = consulmed();   if (pos == -1)
                        {
                          printf("Medico nao existe no arquivo\n");
                        }   else if (pos == -2)
                        {
                          printf("Medico nao existe no arquivo ou foi apagado\n");
                        }   else
                        {
                          fopen("Medico.dat","rb+");     fseek(ARQUIVO , pos * sizeof(struct Medico) , SEEK_CUR);     fread(&reg , sizeof(struct Medico) , 1 , ARQUIVO);     printf("\nALTERAR MEDICO\n");
                          printf("--------------------------\n");
                          printf("NOME: %s || CPF: %lld|| RG: %ld || CRM: %s || TELEFONE: %lld || ESPECIALIZACAO: %i \n", reg.nome, reg.cpf, reg.rg, reg.crm, reg.tel, reg.forma);     printf("--------------------------\n");     printf("\nDigite as novas informacoes:\n");     setbuf(stdin,NULL);     printf("Nome:\n");     scanf("%[^\n]s",&reg.nome);
                          printf("CPF: \n");     scanf("%lld", &reg.cpf);     printf("RG:\n");     scanf("%ld",&reg.rg);     setbuf(stdin,NULL);     printf("CRM:\n");     scanf("%[^\n]s",&reg.crm);     printf("TELEFONE:\n");     scanf("%lld",&reg.tel);     relaforma();     printf("Formacao:\n");     scanf("%i",&reg.forma);     reg.mod = 1;     fseek(ARQUIVO , pos * sizeof(struct Medico) , SEEK_SET);     if(fwrite(&reg , sizeof(struct Medico), 1 , ARQUIVO) != 1)
                          {
                            printf("\nErro na gravacao\n");
                          }     else
                          {
                            printf("\nEdicao feita com sucesso\n");
                          }
                        }
                        fclose(ARQUIVO);   system("pause");
                      }

                      void alterhosp() {   hospi reg;   int pos;   pos = consulhosp();   if (pos == -1)
                        {     printf("Hospital nao existe no arquivo\n");
                      }   else if (pos == -2)
                      {
                        printf("Hospital nao existe no arquivo ou foi apagado\n");
                      }   else
                      {     fopen("Hospital.dat","rb+");     fseek(ARQUIVO , pos * sizeof(struct Hospital) , SEEK_CUR);     fread(&reg , sizeof(struct Hospital) , 1 , ARQUIVO);     printf("\nALTERAR HOSPITAL\n");
                      printf("--------------------------\n");
                      printf("NOME: %s || ENDERECO: %s || ID: %i\n", reg.nome, reg.endereco, reg.numero);
                      printf("--------------------------\n");     printf("\nDigite as novas informacoes:\n");     fflush(stdin);     printf("Nome:\n");     scanf("%[^\n]s",&reg.nome);     fflush(stdin);     printf("Endereco:\n");     scanf("%[^\n]s",&reg.endereco);     fflush(stdin);     printf("ID: \n");     scanf("%f", &reg.numero);     reg.mod = 1;     fseek(ARQUIVO , pos * sizeof(struct Hospital) , SEEK_SET);     if(fwrite(&reg , sizeof(struct Hospital), 1 , ARQUIVO) != 1)
                      {
                        printf("\nErro na gravacao\n");
                      }     else
                      {
                        printf("\nEdicao feita com sucesso\n");
                      }
                    }
                    fclose(ARQUIVO);   system("pause");
                  }

                  void alterforma()
                  {   form reg;   int pos;   pos = consulforma();   if (pos == -1)
                    {     printf("Hospital nao existe no arquivo\n");
                  }   else if (pos == -2)
                  {
                    printf("Hospital nao existe no arquivo ou foi apagado\n");
                  }   else
                  {
                    fopen("Formacao.dat","rb+");     fseek(ARQUIVO , pos * sizeof(struct Formacao) , SEEK_CUR);     fread(&reg , sizeof(struct Formacao) , 1 , ARQUIVO);     printf("\nALTERAR FORMACAO\n");
                    printf("--------------------------\n");
                    printf("NOME: %s || ENDERECO: % || NUMERO: %i\n", reg.nome, reg.numero);
                    printf("--------------------------\n");
                    printf("\nDigite as novas informacoes:\n");     setbuf(stdin,NULL);     printf("Nome:\n");     scanf("%[^\n]s",&reg.nome);     printf("Numero: \n");     scanf("%i", &reg.numero);     reg.mod = 1;     fseek(ARQUIVO , pos * sizeof(struct Formacao) , SEEK_SET);     if(fwrite(&reg , sizeof(struct Formacao), 1 , ARQUIVO) != 1)
                    {
                      printf("\nErro na gravacao\n");
                    }     else
                    {
                      printf("\nEdicao feita com sucesso\n");
                    }
                  }
                  fclose(ARQUIVO);   system("pause");
                }

                //Excluir////////////////////////////////////////////////////////////////////////////////////////
                void exclupaci() {   paci reg;   int pos;   pos = consulpaci();   if (pos == -1)
                  {     printf("\nPaciente inexistente no arquivo\n");
                }   else {     if(pos == -2)
                  {
                    printf("\nPaciente inexistente do arquivo:\n");
                  }     else
                  {
                    fopen("Paciente.dat" , "rb+");       fseek(ARQUIVO , pos * sizeof(struct Paciente) , SEEK_SET);       fread(&reg , sizeof(struct Paciente) , 1 , ARQUIVO);       printf("NOME: %s || CPF: %lld || RG: %ld || CRM: %lld\n", reg.nome, reg.cpf, reg.rg, reg.contemer);       printf("\nREGISTRO N. %d SERA EXCLUIDO\n", (pos+1));
                    reg.mod = '0';       fseek(ARQUIVO , pos * sizeof(struct Paciente) , SEEK_SET);       if(fwrite(&reg , sizeof(struct Paciente) , 1 , ARQUIVO) != 1)
                    {
                      printf("\nErro na exclusao\n");
                    }       else
                    {
                      printf("\nFuncionario excluido com sucesso!\n");
                    }
                  }
                  fclose(ARQUIVO);
                }
                system("pause");
              }

              void excluprotu()
              {   prontu reg;   int pos;
                pos = consulprotu();   if (pos == -1)
                {     printf("\nProntuario inexistente no arquivo\n");
              }   else   {     if(pos == -2)
                {
                  printf("\nProntuario inexistente do arquivo:\n");
                }     else
                {
                  fopen("Prontuario.dat" , "rb+");       fseek(ARQUIVO , pos * sizeof(struct Prontuario) , SEEK_SET);       fread(&reg , sizeof(struct Prontuario) , 1 , ARQUIVO);
                  printf("HOSPITAL: %i\n || PACIENTE: %i\n || MEDICO: %s\n || OBSERVACAO: %s\n", reg.hospital, reg.paciente, reg.medico, reg.observa);       printf("\nREGISTRO N. %d SERA EXCLUIDO\n", (pos+1));
                  system("pause");       reg.mod = '0';       fseek(ARQUIVO , pos * sizeof(struct Prontuario) , SEEK_SET);       if(fwrite(&reg , sizeof(struct Prontuario) , 1 , ARQUIVO) != 1)
                  {
                    printf("\nErro na exclusao\n");
                  }       else
                  {
                    printf("\nExcluido com sucesso!\n");
                  }
                }
                fclose(ARQUIVO);
              }
              system("pause");
            }

            void exclumed()
            {   medi reg;   int pos;   pos = consulmed();   if (pos == -1)
              {
                printf("\nMedico inexistente no arquivo\n");
              }   else   {     if(pos == -2)
                {
                  printf("\nMedico inexistente do arquivo:\n");
                }     else
                {
                  fopen("Medico.dat" , "rb+");       fseek(ARQUIVO , pos * sizeof(struct Medico) , SEEK_SET);       fread(&reg , sizeof(struct Medico) , 1 , ARQUIVO);
                  printf("NOME: %s || CPF: %lld|| RG: %ld || CRM: %s || TELEFONE: %lld || ESPECIALIZACAO: %i \n", reg.nome, reg.cpf, reg.rg, reg.crm, reg.tel, reg.forma);       printf("\nREGISTRO N. %d SERA EXCLUIDO\n", (pos+1));
                  system("pause");       reg.mod = '0';       fseek(ARQUIVO , pos * sizeof(struct Medico) , SEEK_SET);       if(fwrite(&reg , sizeof(struct Medico) , 1 , ARQUIVO) != 1)
                  {
                    printf("\nErro na exclusao\n");
                  }
                  else
                  {
                    printf("\nExcluido com sucesso!\n");
                  }
                }
                fclose(ARQUIVO);
              }
              system("pause");
            }

            void excluhosp()
            {   hospi reg;   int pos;   pos = consulhosp();   if (pos == -1)
              {     printf("\nHospital inexistente no arquivo\n");
            }   else   {     if(pos == -2)
              {
                printf("\nHospital inexistente do arquivo:\n");
              }     else
              {
                fopen("Hospital.dat" , "rb+");       fseek(ARQUIVO , pos * sizeof(struct Hospital), SEEK_SET);       fread(&reg , sizeof(struct Hospital), 1 , ARQUIVO);       printf("NOME: %s || ENDERECO: %s || ID: %i\n", reg.nome, reg.endereco, reg.numero);       printf("\nREGISTRO N. %d SERA EXCLUIDO\n", (pos+1));
                system("pause");       reg.mod = '0';       fseek(ARQUIVO , pos * sizeof(struct Hospital) , SEEK_SET);       if(fwrite(&reg , sizeof(struct Hospital) , 1 , ARQUIVO) != 1)
                {
                  printf("\nErro na exclusao\n");
                }       else
                {
                  printf("\nExcluido com sucesso!\n");
                }
              }
              fclose(ARQUIVO);
            }
            system("pause");
          }

          void excluforma() {   form reg;   int pos;   pos = consulforma();   if (pos == -1)
            {
              printf("\nFormaco inexistente no arquivo\n");
            }   else   {     if(pos == -2)
              {
                printf("\nFormacao inexistente no arquivo:\n");
              }
              else
              {
                fopen("Formacao.dat" , "rb+");       fseek(ARQUIVO , pos * sizeof(struct Formacao) , SEEK_SET);       fread(&reg , sizeof(struct Formacao) , 1 , ARQUIVO);       printf("NOME: %s || ENDERECO: % || NUMERO: %i\n", reg.nome, reg.numero);       printf("\nREGISTRO N. %d SERA EXCLUIDO\n", (pos+1));
                system("pause");       reg.mod = '0';       fseek(ARQUIVO , pos * sizeof(struct Formacao) , SEEK_SET);       if(fwrite(&reg , sizeof(struct Formacao) , 1 , ARQUIVO) != 1)
                {
                  printf("\nErro na exclusao\n");
                }       else
                {
                  printf("\nExcluido com sucesso!\n");
                }
              }
              fclose(ARQUIVO);
            }
            fclose(ARQUIVO);   system("pause");
          }

          //Outros////////////////////////////////////////////////////////////////////////////////////////
          void sobre() {     system ("cls");     printf("Software de Gerenciamento de Prontuario Medico\n");     printf("Autor: Wallatan F P Souza \n");     printf("Versao 3.0\n\n\n");
          system ("pause");
        }

        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /* FILE *AbrirArquivo(char modo,char caminho[30])
        {
        FILE *REMEDIO;
        switch(modo)
        {       case 'g':
        REMEDIO = fopen(caminho, "wt");
        break;       case 'l':
        REMEDIO = fopen(caminho, "rt");
        break;       case 'a':
        REMEDIO = fopen(caminho, "a");
        break;
      }
      if (REMEDIO == NULL)
      {
      printf("Nao foi possivel abrir o arquivo");       exit(0);
    }
    return REMEDIO;
  }

  void FechaArquivo(FILE *REMEDIO)
  {   fclose(REMEDIO);
} */
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
