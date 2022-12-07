#include <stdio.h>
#include <stdlib.h>
#include <string.h>
//aula 12/02
int ler_tam(){
	int n;
	printf ("Digite o tamanho do vetor:\n");
	scanf ("%d", &n);
	system ("cls");
	return n;
}
void ler_vetor_int(int *v, int n){
	int i;
	for(i=0;i<n;i++){
		printf ("Digite o %d numero a ser armazenado no vetor:\n", i+1);
		scanf ("%d", &v[i]);
	}
	system ("cls");
}
void imprimir_vet(int *vetor, int n){
	int i;
	for(i=0;i<n;i++){
		printf ("o %d numero e %d\n\n", i+1, vetor[i]);
	}
}
void ordenar(int *vetor, int tam){
	int i, j, aux;
	printf ("o vetor antes de ser ordenado:\n");
	for(i=0;i<tam;i++){
		printf ("%d\t", vetor[i]);
	}
	printf ("\n\n");
	for(i=0;i<tam-1;i++){
		for(j=i+1;j<tam;j++){
			if(vetor[i]>vetor[j]){
				aux=vetor[i];
				vetor[i]=vetor[j];
				vetor[j]=aux;
			}
		}
	}
	printf ("O vetor ordenado:\n");
	for(i=0;i<tam;i++){
		printf ("%d\t", vetor[i]);
	}
}
//aula 19/02
void insertion(int *v, int n){
	int i, j, atual;
	for(i=1;i<n;i++){
		atual=v[i];
		for(j=i;(j>0)&&(atual<v[j-1]);j--)
			v[j]=v[j-1];
		v[j]=atual;
	}
}
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
int ler_mat(){
	int n;
	printf ("Digite a quantidade de linha da matriz:\n");
	scanf ("%d", &n);
	return n;
}
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
void teste(){
	char a[10], b[10];
	int c;
	scanf ("%s%s", a, b);
	c=strcmp(a,b);
	printf ("%d",c);
}
