%{
	#include "stdio.h"
	#include "stdlib.h"
	#include "syntax.h"
	#define YYLMAX 65536
	#include "bisonsyntax.tab.h"
	extern char lex_buff[BUFF_SIZE];
	extern int lex_buff_size;
	int line_no=1;
	
%}
minglespace [singlespace]+
singlespace	[ \s\t]
id		{letter}({letter}|{digit})*
letter	[A-Za-z]
decnum	[1-9]{digit}*
hexnum	[0]([x][0-9a-f]+|[X][0-9A-F]+)
octnum	[0][0-7]+
octfloat	[0][0-7]+[.][0-7]+
decfloat	([0]|[1-9][0-9]*)[.]{digit}+
hexfloat	[0]([x][0-9a-f]+[.][0-9a-f]+|[X][0-9A-F]+[.][0-9A-F]+)
digit	[0-9]
constchar	'[^'\n]'
conststring	\"[^\"\n]*\"
%%
{minglespace}	;
{singlespace}	;
Else	{return (ELSE);}
Case	{return (CASE);}
if		{return (IF);}
while	{return (WHILE);}
do		{return (DO);}
for		{return (FOR);}
switch	{return (SWITCH);}
continue	{return (CONTINUE);}
break		{return (BREAK);}
struct		{return (STRUCT);}
true		{return (TRUE);}
false		{return (FALSE);}
int			{return	(INT);}
float		{return (FLOAT);}
char		{return	(CHAR);}
string		{return (STRING);}
def			{return (DEF);}
define		{return	(DEFINE);}
void		{return	(VOID);}
return		{return	(RETURN);}
{digit}	{install_decnum();return (DEC);}
{letter} {install_id();return (ID);}
{id}	{install_id();return (ID);}
{decnum}	{install_decnum();return (DEC);}

{hexnum}	{install_hexnum();return (HEX);}

{octnum}	{install_octnum();return (OCT);}

{decfloat}	{install_decfloat();return (DEFLOAT);}

{hexfloat}	{install_hexfloat();return (HEFLOAT);}

{octfloat}	{install_octfloat();return (OCFLOAT);}
{constchar}	{install_constchar();return (CONSTCHAR);}
{conststring}	{install_conststring();return (CONSTSTRING);}
";"		{return (SEMIC);}
"+"		{return (PLUS);}
"-"		{return (MINUS);}
"*"		{return (MULTI);}
"/"		{return (RDIV);}
","		{return (COMMA);}
"."		{return (DOT);}
":"		{return (COLON);}
"="		{return (ASSIGNMENT);}
"=="	{strcpy(lex_buff,"EQ");yylval=strdup(lex_buff);lex_buff_size=2;return (EQ);}
"<"		{strcpy(lex_buff,"LT");yylval=strdup(lex_buff);lex_buff_size=2;return (LT);}
">"		{strcpy(lex_buff,"GT");yylval=strdup(lex_buff);lex_buff_size=2;return (GT);}
"<="	{strcpy(lex_buff,"LE");yylval=strdup(lex_buff);lex_buff_size=2;return (LE);}
">="	{strcpy(lex_buff,"GE");yylval=strdup(lex_buff);lex_buff_size=2;return (GE);}
"!="	{strcpy(lex_buff,"NE");yylval=strdup(lex_buff);lex_buff_size=2;return (NE);}
"||"	{strcpy(lex_buff,"OR");yylval=strdup(lex_buff);lex_buff_size=2;return (OR);}
"&&"	{strcpy(lex_buff,"AND");yylval=strdup(lex_buff);lex_buff_size=3;return (AND);}
"!"		{strcpy(lex_buff,"NOT");yylval=strdup(lex_buff);lex_buff_size=3;return (NOT);}
"("		{strcpy(lex_buff,"L");yylval=strdup(lex_buff);lex_buff_size=1;return (LPARENTHESE);}
")"		{strcpy(lex_buff,"R");yylval=strdup(lex_buff);lex_buff_size=1;return (RPARENTHESE);}
"["		{strcpy(lex_buff,"L");yylval=strdup(lex_buff);lex_buff_size=1;return (LBRACKET);}
"]"		{strcpy(lex_buff,"R");yylval=strdup(lex_buff);lex_buff_size=1;return (RBRACKET);}
"{"		{strcpy(lex_buff,"L");yylval=strdup(lex_buff);lex_buff_size=1;return (LBRACE);}
"}"		{strcpy(lex_buff,"R");yylval=strdup(lex_buff);lex_buff_size=1;return (RBRACE);}
"&"		{return	(ADDR);}
\"		{return (DOUBLEQUOMARKS);}
\n	{line_no++;}

.	{printf("err: '%c'(0%o):illegeal character at:%d.\n",yytext[0],yytext[0],line_no);}
%%
void install_id()
{
	//printf("idn %s\n",yytext);
	sprintf(lex_buff,"%s",yytext);
	yylval=strdup(lex_buff);
	lex_buff_size=yyleng;
}
void install_decnum()
{
	//printf("dec %s\n",yytext);
	sprintf(lex_buff,"%s",yytext);
	yylval=strdup(lex_buff);
	lex_buff_size=yyleng;
}
void install_hexnum()
{
	//printf("hex %s\n",yytext);
	sprintf(lex_buff,"%s",yytext);
	yylval=strdup(lex_buff);
	lex_buff_size=yyleng;
}
void install_octnum()
{
	//printf("oct %s\n",yytext);
	sprintf(lex_buff,"%s",yytext);
	yylval=strdup(lex_buff);
	lex_buff_size=yyleng;
}
void install_decfloat()
{
	//printf("dec float %s\n",yytext);
	sprintf(lex_buff,"%s",yytext);
	yylval=strdup(lex_buff);
	lex_buff_size=yyleng;
}

void install_hexfloat()
{
	//printf("hex float %s\n",yytext);
	sprintf(lex_buff,"%s",yytext);
	yylval=strdup(lex_buff);
	lex_buff_size=yyleng;
}

void install_octfloat()
{
	//printf("oct float %s\n",yytext);
	sprintf(lex_buff,"%s",yytext);
	yylval=strdup(lex_buff);
	lex_buff_size=yyleng;
}

void install_constchar()
{
	sprintf(lex_buff,"%s",yytext);
	yylval=strdup(lex_buff);
	lex_buff_size=1;
}

void install_conststring()
{
	sprintf(lex_buff,"%s",yytext);
	yylval=strdup(lex_buff);
	lex_buff_size=yyleng;
}

int yywrap(void)
{
	
	return 1;
}