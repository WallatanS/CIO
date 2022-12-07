#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define n 10




void bubble_string(char v[][30], int n){
	int i, j;
	char aux[30];
	for(i=0;i<n-1;i++){
		for(j=i+1;j<n;j++){
			if(strcmp(v[i], v[j])>0){
				strcpy(aux, v[i]);
				strcpy(v[i], v[j]);
				strcpy(v[j], aux);
			}
		}
	}
}
/*int ler_mat(){
	int n;
	printf ("Digite a quantidade de linha da matriz:\n");
	scanf ("%d", &n);
	return n;
}*/
void ler_matriz_car(char v[][30], int n){
	int i;
	for(i=0;i<n;i++){
		printf ("Digite a %d string:\n", i+1);
		scanf ("%s", v[i]);
	}
}
void imprimir_vet_car(char v[][30], int n){
	int i;
	for(i=0;i<n;i++){
		printf ("A %d string :%s\n", i+1, v[i]);
	}
}
