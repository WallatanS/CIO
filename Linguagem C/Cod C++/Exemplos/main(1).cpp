#include "cabecalho.h"

int main(){
    char *vetor[];
    leia_vetor(vetor);
    printf("Vetor sem ordem:\n");
    imprime_vetor(vetor);
    ordenar_bubble(vetor);
    printf("\nVetor com ordem por bolha:\n");
    imprime_vetor(vetor);
    ordenar_selecao(vetor);
    printf("\nVetor com ordem por selecao:\n");
    imprime_vetor(vetor);
    ordenar_insercao(vetor);
    printf("\nVetor com ordem por insercao:\n");
    imprime_vetor(vetor);
    return 0;
}
