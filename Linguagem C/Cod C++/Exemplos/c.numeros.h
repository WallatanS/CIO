#include <stdlib.h>
#include <conio.h>
#include <stdio.h>
#include <string.h>
#define tam 3

void leia_vetor(char *v[]){
    
    int i,j;
    printf("Digite as palavras\n");
    for(i=0;i<tam;i++){
        scanf("%s",&v[i]);
    	printf("teste %s",v[i]);
    }
    
}

void ordenar_bubble(int *v){
    
    int i,j,aux;
    for(i=0;i<tam-1;i++){
    	for(j=i+1;j<tam;j++){
    		if(v[i]>v[j]){
    			aux=v[i];
    			v[i]=v[j];
    			v[j]=aux;
			}
		}
    }
}

void imprime_vetor(char *v[]){
	
	int i;
	for(i=0;i<tam;i++){
		printf("%d \t",v[i]);
	}
}

void ordenar_selecao(int *v){
	
	int i,j,menor,troca;
	for(i=0;i<tam-1;i++){
		menor=i;
		for(j=i+1;j<tam;j++){
			if (v[j] < v[menor])
				menor=j;
		}
	
		if(i!=menor){
			troca=v[i];
			v[i]=v[menor];
			v[menor]=troca;
		}
	}
}

void ordenar_insercao(int *v){
	
	int i,j,atual;
	for(i=1;i<tam;i++){
		atual=v[i];
		for(j=i;(j>0)&&(atual<v[j-1]);j--)
			v[j]=v[j-1];
		v[j]=atual;
	}
}
