%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <stddef.h>
	#include <string.h>
	#include "syntax.h"

	extern char lex_buff[256];
	extern int lex_buff_size;
	extern int line_no;
%}
%union{
	char* stringtype;
	int itype;
	float ftype;
}
%token <stringtype>ID 
%token <stringtype>DEC 
%token <stringtype>HEX 
%token <stringtype>OCT 
%token <stringtype>DEFLOAT 
%token <stringtype>HEFLOAT 
%token <stringtype>OCFLOAT 
%token VOID
%token INT
%token FLOAT
%token CHAR
%token STRING
%token CONSTCHAR
%token CONSTSTRING
%token DEF
%token DEFINE
%token RETURN
%token ADDR
%token PLUS 
%token MINUS 
%token MULTI 
%token RDIV 
%token COMMA 
%token DOT 
%token RELOP 
%token EQ 
%token LT 
%token GT 
%token LE 
%token GE 
%token NE
%token COLON 
%token LOGIC 
%token OR
%token AND 
%token NOT 
%token LPARENTHESE
%token RPARENTHESE
%token LBRACKET 
%token RBRACKET 
%token LBRACE
%token RBRACE
%token DOUBLEQUOMARKS 
%token IF 
%token ELSE 
%token WHILE 
%token DO 
%token FOR 
%token SWITCH 
%token CASE 
%token CONTINUE 
%token BREAK 
%token STRUCT 
%token SEMIC 
%token ASSIGNMENT
%token TRUE
%token FALSE
%left AND OR NOT
%left PLUS MINUS
%left MULTI RDIV
%left GT LT EQ NE LE GE
%left ASSIGNMENT BREAK CONTINUE
%left ELSE 
%left COMMA
%right UMINUS

%%
	P	:	L	P	{printf("P->LP\n");}
		|	L		{printf("P->L\n");}
		|			{printf("P->null\n");}
		;
	L	:	S	{printf("L->S\n");}
		;
	S	:	expr SEMIC	{printf("S->expr;\n");}
		|	CTRLexpr	{printf("S->Cexpr \n");}
		|	LBRACE	P	RBRACE 	{printf("S->{P}\n");}
		|	RETURN	E	SEMIC	{printf("S->RETURN LVALUE;\n");}
		|	RETURN	SEMIC			{printf("S->RETURN;\n");}
		|	{printf("S->null\n");}
		;
	expr:	DECLARE		{printf("expr->DECLARE\n");}
		|	C			{printf("expr->C\n");}
		|	E			{printf("expr->E\n");}
		|	LVALUE		{printf("expr->LVALUE\n");}
		|				{printf("expr->null\n");}
		;
	DECLARE	:	TYPE	LVALUE	{printf("DECLARE->TYPE LVALUE\n");}
			|	TYPE	LVALUE	COMMA	DECLARE	{printf("DECLARE->TYPE LVALUE,DECLARE\n");}
			|	ARRAYDECLARE	{printf("DECLARE->ARRAYDECLARE\n");}
			|	ARRAYDECLARE	COMMA	DECLARE	{printf("DECLARE->ARRAYDECLARE,DECLARE\n");}
			;
	ARRAYDECLARE	:	TYPE	LBRACKET	ARRSIZE	RBRACKET	DEFINITE_ARRAYSIZE	LVALUE	{
						printf("DECLARE->TYPE[ARRSIZE]DEFINITE_ARRAYSIZE LVALUE\n");
						}	
					|	TYPE	LBRACKET	RBRACKET	DEFINITE_ARRAYSIZE	ID	{
						printf("DECLARE->TYPE[]DEFINITE_ARRAYSIZE ID\n");
						}
					|	TYPE	LBRACKET	RBRACKET	DEFINITE_ARRAYSIZE	ID	ASSIGNMENT	RARRAY	{
						printf("DECLARE->TYPE[]DEFINITE_ARRAYSIZE ID={RARRAY}\n");
						}
					;
	DEFINITE_ARRAYSIZE	:	LBRACKET	ARRSIZE	RBRACKET	DEFINITE_ARRAYSIZE	{
								printf("DEFINITE_ARRAYSIZE->[ARRSIZE]	DEFINITE_ARRAYSIZE\n");
								}
						|		{printf("DEFINITE_ARRAYSIZE->null\n");}
						;
	LVALUE	:	ID			{printf("LVALUE->ID:%s\n",$1);}	
			|	ADDR	ID	{printf("LVALUE->&ID\n");}
			|	ID	LBRACKET	ARRSIZE	RBRACKET	{printf("LVALUE->ID[ARRSIZE]\n");}
			|	ID	LPARENTHESE	expr	RPARENTHESE	{printf("LVALUE->ID(expr)\n");}
			|	ID	LPARENTHESE	expr	RPARENTHESE	LBRACE	P	RBRACE	{printf("LVALUE->ID(expr){P}\n");}
			|	LVALUE	ASSIGNMENT	LVALUE			{printf("LVALUE->LVALUE=LVALUE\n");}		
			|	LVALUE	ASSIGNMENT	E				{printf("LVALUE->LVALUE=E\n");}	
			|	LVALUE	COMMA	LVALUE				{printf("LVALUE->LVALUE,LVALUE\n");}
			;
	TYPE	:	VOID	{printf("TYPE->VOID\n");}
			|	INT		{printf("TYPE->INT\n");}
			|	FLOAT	{printf("TYPE->FLOAT\n");}
			|	CHAR	{printf("TYPE->CHAR\n");}
			|	STRING	{printf("TYPE->STRING\n");}
			;
	ARRSIZE	:	ID		{printf("ARRSIZE->ID\n");}
			|	INTNUM	{printf("ARRSIZE->INTNUM\n");}
			;
	RARRAY	:	LBRACE	E	RBRACE	COMMA	RARRAY			{printf("RARRAY->{E},RARRAY\n");}
			|	LBRACE	RARRAY	RBRACE	COMMA	RARRAY		{printf("RARRAY->{RARRAY},RARRAY\n");}
			|	LBRACE	E	RBRACE							{printf("RARRAY->{E}\n");}
			|	LBRACE	RARRAY	RBRACE						{printf("RARRAY->{RARRAY}\n");}
			;
	CTRLexpr:	IF	C	S	ELSE	S	{printf("Cexpr->if C then S else S\n");}
			|	IF	C	S			{printf("Cexpr->if C then S\n");}
			|	WHILE	C DO S		{printf("Cexpr->while C do S\n");}
			|	FOR	LPARENTHESE	expr	SEMIC	expr	SEMIC	expr	RPARENTHESE	S	{
				printf("Cexpr->for(expr;expr;expr)S\n");
				}
			|	DO	S	WHILE	LPARENTHESE	IC	RPARENTHESE	SEMIC	{
					printf("Cexpr->DO S WHILE (IC)\n");
				}
			|	SWITCH	expr	LBRACE	SWITCH_CASE	RBRACE	{
					printf("Cexpr->SWITCH	expr {SWITCH_CASE}\n");
				}
			|	BREAK	SEMIC	{printf("Cexpr->BREAK;\n");}
			|	CONTINUE	SEMIC	{printf("Cexpr->CONTINUE;\n");}
			;
	SWITCH_CASE	:	CASE	expr	COLON	S	SWITCH_CASE	{
					printf("SWITCH_CASE->CASE expr:S BREAK;SWITCH_CASE\n");
				}
				|	{printf("SWITCH_CASE->null\n");}
				;
			
			
	C	:	LPARENTHESE IC RPARENTHESE	{printf("C->(IC)\n");}
		|	IC							{printf("C->IC\n");}
		;
	IC	:	E	EQ	E	{printf("IC->E == E\n");}
		|	E	LT	E	{printf("IC->E < E\n");}
		|	E	GT	E	{printf("IC->E > E\n");}
		|	E	NE	E	{printf("IC->E != E\n");}
		|	E	LE	E	{printf("IC->E <= E\n");}
		|	E	GE	E	{printf("IC->E >= E\n");}
		|	TRUE	{printf("IC->TRUE\n");}
		|	FALSE	{printf("IC->FALSE\n");}
		;
	E	:	E	PLUS	E	{printf("E->E+E\n");}
		|	E	MINUS	E	{printf("E->E-E\n");}
		|	E	MULTI	E	{printf("E->E*E\n");}
		|	E	RDIV	E	{printf("E->E/E\n");}
		|	MINUS	E %prec UMINUS	{printf("E->-E\n");}
		|	LPARENTHESE	E	RPARENTHESE	{printf("E->(E)\n");}
		|	F	{printf("E->F\n");}
		;
	
	F	:	LVALUE	{printf("F->LVALUE\n");}
		|	INTNUM	{printf("F->INTNUM\n");}
		|	FLOATNUM	{printf("F->FLOATNUM\n");}
		|	CONSTCHAR	{printf("F->CONSTCHAR\n");}
		|	CONSTSTRING	{printf("F->CONSTSTRING\n");}
		;
	INTNUM	:	DEC	{
					printf("INTNUM->DEC:%s",$1);
					char* stoppos;
					long decnum;
					decnum=strtol($1,&stoppos,10);
					printf("(%ld)\n", decnum);
					}
		|	HEX	{
					printf("INTNUM->HEX:%s",$1);
					char* stoppos;
					long decnum;
					decnum=strtol(strlwr($1),&stoppos,16);
					printf("(%ld)\n", decnum);
				}
		|	OCT	{
					printf("INTNUM->OCT:%s",$1);
					char* stoppos;
					long decnum;
					decnum=strtol($1,&stoppos,8);
					printf("(%ld)\n", decnum);
				}
		|	LPARENTHESE	INT RPARENTHESE E	{
					printf("INTNUM->(int)E\n");
				}
		|	INT	LPARENTHESE	E	RPARENTHESE	{
					printf("INTNUM->int(E)\n");
				}
		;
	FLOATNUM:	DEFLOAT	{
					printf("FLOATNUM->DEFLOAT:%s",$1);
					char* stoppos;
					char buffer[64];
					long decfloatnum;
					long decintnum;
					double decnum;
					decintnum=strtol($1,&stoppos,10);
					printf("(%ld)",decintnum);
					decfloatnum=strtol(stoppos+sizeof(char),NULL,10);
					printf("+(%ld)", decfloatnum);
					sprintf(buffer,"%ld.%ld",decintnum,decfloatnum);
					decnum=strtod(buffer,NULL);
					printf("=%f\n",decnum);
					}
		|	OCFLOAT	{
					printf("FLOATNUM->OCFLOAT:%s",$1);
					char* stoppos;
					char buffer[64];
					double decfloatnum=0.0;
					long decintnum;
					double decnum;
					double	jie=1.0/8;
					decintnum=strtol($1,&stoppos,8);
					printf("(%ld)",decintnum);
					stoppos=stoppos+sizeof(char);
					int j=strlen(stoppos);
					for(int i=0;i<j;i++)
					{
						decfloatnum+=jie*(*stoppos - '0');
						stoppos=stoppos+sizeof(char);
						jie/=8;
					}
					printf("+(%f)", decfloatnum);
					decnum=decintnum+decfloatnum;
					printf("=%f\n",decnum);
					}
		|	HEFLOAT	{
					printf("FLOATNUM->HEFLOAT:%s",$1);
					char* stoppos;
					char buffer[64];
					double decfloatnum=0.0;
					long decintnum;
					double decnum;
					double	jie=1.0/16;
					$1=strlwr($1);
					decintnum=strtol($1,&stoppos,16);
					printf("(%ld)",decintnum);
					stoppos=stoppos+sizeof(char);
					int j=strlen(stoppos);
					for(int i=0;i<j;i++)
					{
						if(*stoppos>'9')*stoppos-=39;
						decfloatnum+=jie*(*stoppos - '0');
						stoppos=stoppos+sizeof(char);
						jie/=16;
					}
					printf("+(%f)", decfloatnum);
					decnum=decintnum+decfloatnum;
					printf("=%f\n",decnum);
					
					}
		|	LPARENTHESE	FLOAT RPARENTHESE E	{
					printf("FLOATNUM->(float)E\n");
					}
		|	FLOAT	LPARENTHESE	E	RPARENTHESE	{
					printf("FLOATNUM->float(E)\n");
					}	
		;
	
%%
void yyerror (char const *s) {
   fprintf (stderr, "%s\n", s);
 }