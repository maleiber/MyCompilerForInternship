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
{singlespace}	{++yylloc.last_column;}
Else	{++yylloc.last_column;return (ELSE);}
Case	{++yylloc.last_column;return (CASE);}
if		{++yylloc.last_column;return (IF);}
while	{++yylloc.last_column;return (WHILE);}
do		{++yylloc.last_column;return (DO);}
for		{++yylloc.last_column;return (FOR);}
switch	{++yylloc.last_column;return (SWITCH);}
continue	{++yylloc.last_column;return (CONTINUE);}
break		{++yylloc.last_column;return (BREAK);}
struct		{++yylloc.last_column;return (STRUCT);}
true		{++yylloc.last_column;return (TRUE);}
false		{++yylloc.last_column;return (FALSE);}
int			{++yylloc.last_column;return	(INT);}
float		{++yylloc.last_column;return (FLOAT);}
char		{++yylloc.last_column;return	(CHAR);}
string		{++yylloc.last_column;return (STRING);}
def			{++yylloc.last_column;return (DEF);}
define		{++yylloc.last_column;return	(DEFINE);}
void		{++yylloc.last_column;return	(VOID);}
return		{++yylloc.last_column;return	(RETURN);}
{digit}	{install_decnum();++yylloc.last_column;return (DEC);}
{letter} {install_id();++yylloc.last_column;return (ID);}
{id}	{install_id();++yylloc.last_column;return (ID);}
{decnum}	{install_decnum();++yylloc.last_column;return (DEC);}

{hexnum}	{install_hexnum();++yylloc.last_column;return (HEX);}

{octnum}	{install_octnum();++yylloc.last_column;return (OCT);}

{decfloat}	{install_decfloat();++yylloc.last_column;return (DEFLOAT);}

{hexfloat}	{install_hexfloat();++yylloc.last_column;return (HEFLOAT);}

{octfloat}	{install_octfloat();++yylloc.last_column;return (OCFLOAT);}
{constchar}	{install_constchar();++yylloc.last_column;return (CONSTCHAR);}
{conststring}	{install_conststring();++yylloc.last_column;return (CONSTSTRING);}
";"		{++yylloc.last_column;return (SEMIC);}
"+"		{++yylloc.last_column;return (PLUS);}
"-"		{++yylloc.last_column;return (MINUS);}
"*"		{++yylloc.last_column;return (MULTI);}
"/"		{++yylloc.last_column;return (RDIV);}
","		{++yylloc.last_column;return (COMMA);}
"."		{++yylloc.last_column;return (DOT);}
":"		{++yylloc.last_column;return (COLON);}
"="		{++yylloc.last_column;return (ASSIGNMENT);}
"=="	{++yylloc.last_column;strcpy(lex_buff,"EQ");yylval.stringtype=strdup(lex_buff);lex_buff_size=2;return (EQ);}
"<"		{++yylloc.last_column;strcpy(lex_buff,"LT");yylval.stringtype=strdup(lex_buff);lex_buff_size=2;return (LT);}
">"		{++yylloc.last_column;strcpy(lex_buff,"GT");yylval.stringtype=strdup(lex_buff);lex_buff_size=2;return (GT);}
"<="	{++yylloc.last_column;strcpy(lex_buff,"LE");yylval.stringtype=strdup(lex_buff);lex_buff_size=2;return (LE);}
">="	{++yylloc.last_column;strcpy(lex_buff,"GE");yylval.stringtype=strdup(lex_buff);lex_buff_size=2;return (GE);}
"!="	{++yylloc.last_column;strcpy(lex_buff,"NE");yylval.stringtype=strdup(lex_buff);lex_buff_size=2;return (NE);}
"||"	{++yylloc.last_column;strcpy(lex_buff,"OR");yylval.stringtype=strdup(lex_buff);lex_buff_size=2;return (OR);}
"&&"	{++yylloc.last_column;strcpy(lex_buff,"AND");yylval.stringtype=strdup(lex_buff);lex_buff_size=3;return (AND);}
"!"		{++yylloc.last_column;strcpy(lex_buff,"NOT");yylval.stringtype=strdup(lex_buff);lex_buff_size=3;return (NOT);}
"("		{++yylloc.last_column;strcpy(lex_buff,"L");yylval.stringtype=strdup(lex_buff);lex_buff_size=1;return (LPARENTHESE);}
")"		{++yylloc.last_column;strcpy(lex_buff,"R");yylval.stringtype=strdup(lex_buff);lex_buff_size=1;return (RPARENTHESE);}
"["		{++yylloc.last_column;strcpy(lex_buff,"L");yylval.stringtype=strdup(lex_buff);lex_buff_size=1;return (LBRACKET);}
"]"		{++yylloc.last_column;strcpy(lex_buff,"R");yylval.stringtype=strdup(lex_buff);lex_buff_size=1;return (RBRACKET);}
"{"		{++yylloc.last_column;strcpy(lex_buff,"L");yylval.stringtype=strdup(lex_buff);lex_buff_size=1;return (LBRACE);}
"}"		{++yylloc.last_column;strcpy(lex_buff,"R");yylval.stringtype=strdup(lex_buff);lex_buff_size=1;return (RBRACE);}
"&"		{++yylloc.last_column;return	(ADDR);}
\"		{++yylloc.last_column;return (DOUBLEQUOMARKS);}
\n	{++yylloc.last_line;yylloc.first_line = yylloc.last_line;

yylloc.first_column = yylloc.last_column=0;line_no++;}

.	{printf("err: '%c'(0%o):illegeal character at:%d.\n",yytext[0],yytext[0],line_no);}
%%
void install_id()
{
	//printf("idn %s\n",yytext);
	sprintf(lex_buff,"%s",yytext);
	
	yylval.stringtype=strdup(lex_buff);
	lex_buff_size=yyleng;
}
void install_decnum()
{
	//printf("dec %s\n",yytext);
	sprintf(lex_buff,"%s",yytext);
	yylval.stringtype=strdup(lex_buff);
	lex_buff_size=yyleng;
}
void install_hexnum()
{
	//printf("hex %s\n",yytext);
	sprintf(lex_buff,"%s",yytext);
	yylval.stringtype=strdup(lex_buff);
	lex_buff_size=yyleng;
}
void install_octnum()
{
	//printf("oct %s\n",yytext);
	sprintf(lex_buff,"%s",yytext);
	yylval.stringtype=strdup(lex_buff);
	lex_buff_size=yyleng;
}
void install_decfloat()
{
	//printf("dec float %s\n",yytext);
	sprintf(lex_buff,"%s",yytext);
	yylval.stringtype=strdup(lex_buff);
	lex_buff_size=yyleng;
}

void install_hexfloat()
{
	//printf("hex float %s\n",yytext);
	sprintf(lex_buff,"%s",yytext);
	yylval.stringtype=strdup(lex_buff);
	lex_buff_size=yyleng;
}

void install_octfloat()
{
	//printf("oct float %s\n",yytext);
	sprintf(lex_buff,"%s",yytext);
	yylval.stringtype=strdup(lex_buff);
	lex_buff_size=yyleng;
}

void install_constchar()
{
	sprintf(lex_buff,"%s",yytext);
	yylval.stringtype=strdup(lex_buff);
	lex_buff_size=1;
}

void install_conststring()
{
	sprintf(lex_buff,"%s",yytext);
	yylval.stringtype=strdup(lex_buff);
	lex_buff_size=yyleng;
}

int yywrap(void)
{
	
	return 1;
}