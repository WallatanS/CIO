#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#include <conio.h>
#include <math.h>
#include <iostream>

using namespace std;

//função
void mododetrabalho();
void modogame();
void modolazer();
void funcao();
void sistemadesom();


int main(){
	cout<< "Sistema de Ambientacao \n";
	int par = 0;
	cout<< "\nMENU\n" << "\n1: Modo De Trabalho\n" << "2: Modo Game \n" << "3: Modo Lazer \n" << "4: Funcao\n" << "5_ Sair" << "\nEscolha o Estilo ou Funcao: ";
    cin>> par;
	//system ("start cmd.exe");
    //system("start winword.exe");
    //system ("msg wall Modo trabalho");
    switch (par){
    	case 1:
    		mododetrabalho();
    		main();
    		break;
    	case 2:
			modogame();
			main();
			break;
		case 3:
			modolazer();
			main();
			break;
		case 4:
			funcao();
			main();
			break;
		case 5:
			exit;
			break;
		default:
			cout<<"Opecao invalida";
			system ("pause");
			system ("cls");
			main();
			break;
	}
	int i=0;


	system ("cls");
	cout<<"Finalizando Programa" << endl;
}

void mododetrabalho(){
	int i= 0;
	printf("Abrindo Links");
	system("start msedge.exe https://www.iconfinder.com/");
	system("start msedge.exe https://translate.google.com.br/?ui=tob&sl=pt&tl=en&text=ANEXO&op=translate");
	system("start msedge.exe https://www.rtsgo.com.br/upg");
	system("start https://music.youtube.com/");
	system("start Chrome.exe https://www.google.com.br");
	cout<< "Abrindo Programas...\n";
	//system("c:");
	//system("cd C:/Users/walla/Pasta Pessoal/Trabalho/Site UPG");
	//system("start Icones.ai");
	//system("start Illustrator.exe \n");
	system("start C:/Atalhos/Icones");
	system("start C:/Atalhos/Figma");
	cout<< "Abrir Softwares de Audio?: 1:S 2:N";
	cin>>i;
	if (i==1)
		sistemadesom();
}

void sistemadesom(){
	system("start C:/Atalhos/NVIDIABroadcast");
}

void modogame(){}
void modolazer(){}

void funcao(){
	system("cls");
	int par=0, i=0;
	cout << "Menu \n" << "\n1_ Status De Rede\n" << "2_ Procurar Por Erros\n" << "3_ Listar Portas De Rede\n" << "4_ Procurar Por Drives Auxentes\n" << "5_ Informacao De Sistema \n" << "6_ Star Wars\n" << "7_ Voltar\n" << "\nOp: ";
	cin >> par;
	switch (par){
    	case 1:
			system ("cls");
    		system ("ping www.google.com.br -n 30");
			system ("pause");
    		funcao();
    		break;
    	case 2:
    		system ("cls");
			system ("sfc / scannow");
			system ("pause");
			funcao();
			break;
		case 3:
			system ("cls");
			system ("netstat -an");
			system ("pause");
			funcao();
			break;
		case 4:
			system ("cls");
			system ("Driverquery");
			system ("pause");
			funcao();
			break;
		case 5: 
			system ("cls");
			system ("systeminfo");
			system ("pause");
			funcao();
			break;
		case 6: 
			system ("cls");
			system ("telnet towel.blinkenlights.nl");
			system ("pause");
			funcao();
			break;
		case 7:
			exit;
			main();
			break;
		default:
			cout<<"Opecao invalida";
			funcao();
			break;
	}
}
