#include<stdio.h>
int main()
	{
		system("flex first_la.lex");
		system("gcc lex.yy.c -lfl");
		system("./a.out");
	}
