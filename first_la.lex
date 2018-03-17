letter [a-zA-Z]
digit [0-9]
any [a-zA-z0-9~`!@#$%\\^&*()-{}[\]=|/?.>,<'":;]

%%

[ \t\n]+						{}

"%"									printf("Modulo: %s\n", yytext);
"^"									printf("Power: %s\n", yytext);

"'"{any}?"'"								printf("Character: %s\n", yytext);
"\""({any})*"\""							printf("String: %s\n", yytext);
{digit}+								printf("Integer Value: %d\n", atoi(yytext));
{digit}+(\.{digit}+)							printf("Float Value: %lf\n", atof(yytext));

^("+"|"-")*[0-9]+							printf("Signed Integer: %s\n", yytext);	

"+"|"-"|"*"|"/"								printf("Arithmetic Operator: %s\n", yytext);
"="									printf("Assign Operator: %s\n", yytext);
"!"									printf("Unirary Operator Not: %s\n",yytext);
">="|"<="|">"|"<"|"=="|"!="						printf("Relational Operator: %s\n", yytext);

"/*"({any})*"*/"							printf("Comment: %s\n", yytext);

"{"|"("|"["								printf("Opening Parenthesis: %s\n", yytext);
"}"|")"|"]"								printf("Closing Parenthesis: %s\n", yytext);
";"									printf("Semicolon: %s\n", yytext);
"scan"|"print"|"repeat"|"if"|"else"|"else if"				printf("Keywords: %s\n", yytext);
"int"|"char"|"float"|"string"|"long"					printf("Data Types: %s\n", yytext);

{letter}({letter}|{digit}|_)*						printf("Variable: %s\n", yytext);
.									printf("Error: Undefined token - %s\n", yytext);

%%

int main(){
	yylex();
	return 0;
}
