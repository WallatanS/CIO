using namespace std;
//////////////////////////////////////////////////////////////////////////////
typedef char Itemp;

typedef struct pilha{
	int max;
	int topo;
	Itemp *item;
} *Pilha;
///////////////////////////////////////////////////////////////////////////////
Pilha pilha(int m);
bool vaziap(Pilha P);
bool cheiap(Pilha P);
void empilha(Itemp x, Pilha P);
Itemp desempilha(Pilha P);
Itemp topo(Pilha P);
void destroip(Pilha *Q);

///////////////////////////////////////////////////////////////////////////////
Pilha pilha(int m){
	Pilha p = (Pilha) malloc(sizeof(Pilha));
	p->max = m;
	p->topo = -1;
	p->item = (char*) malloc(m * sizeof(char));
	return p;
}
//////////////////////////////////////////////////////////////////////////////
bool vaziap(Pilha p){
	if (p->topo == -1)
		return true;
	else
		return false;
}
//////////////////////////////////////////////////////////////////////////////
bool cheiap(Pilha p){
	if(p->topo == p->max-1)
		return true;
	else
		return false;
}
//////////////////////////////////////////////////////////////////////////////
void empilha(Itemp x, Pilha p){
	if(cheiap(p)==1)
	{
		cout<<"\nPilha cheia";
	}
	else{
	p->topo++;
	p->item[ p->topo ] = x;
	}
}
//////////////////////////////////////////////////////////////////////////////
Itemp topo(Pilha p){
	if(vaziap(p) == 1){
		cout<<"\nPilha Vazia\n";
	}
	else{
		int num = p->topo;
		return p->item[num];
	}
}
//////////////////////////////////////////////////////////////////////////////
char desempilha(Pilha p){
	char n;
	if(vaziap(p) == 1){
		cout<<"Pilha vazia";
	}
	else{
		n=topo(p);//testar
		p->topo--;
		return n;
	}
}
//////////////////////////////////////////////////////////////////////////////
void destroip(Pilha *q){
	free((*q)->item);
	free(*q);
	*q=NULL;
}
