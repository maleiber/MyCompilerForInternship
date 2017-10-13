%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <stddef.h>
	#include <string.h>
	#include "syntax.h"
	#include "node.h"
	#include "mylib.h"
	extern char lex_buff[256];
	extern int lex_buff_size;
	extern int line_no;
	
%}
%union{
	char* stringtype;
	char chartype;
	int itype;
	float ftype;
	value* thisval;
}
%token <stringtype>ID 
%token <stringtype>DEC 
%token <stringtype>HEX 
%token <stringtype>OCT 
%token <stringtype>DEFLOAT 
%token <stringtype>HEFLOAT 
%token <stringtype>OCFLOAT 
%type	<ftype>FLOATNUM
%type	<itype>INTNUM
%type	<thisval>F
%type	<thisval>LVALUE
%type	<itype>ARRSIZE
%token VOID
%token INT
%token FLOAT
%token CHAR
%token STRING
%token <stringtype>CONSTCHAR
%token <stringtype>CONSTSTRING
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
	LVALUE	:	ID			{
					printf("LVALUE->ID:%s\n",$1);
					value *tmp=_new_value();
					tmp->isvariable=1;
					$$=tmp;
					}	
			|	ADDR	ID	{
					printf("LVALUE->&ID\n");
					value *tmp=_new_value();
					tmp->isaddr=1;
					$$=tmp;
					}
			|	ID	LBRACKET	ARRSIZE	RBRACKET	{
					printf("LVALUE->ID[ARRSIZE]\n");
					}
			|	ID	LPARENTHESE	expr	RPARENTHESE	{
					printf("LVALUE->ID(expr)\n");
					}
			|	ID	LPARENTHESE	expr	RPARENTHESE	LBRACE	P	RBRACE	{
					printf("LVALUE->ID(expr){P}\n");
					}
			|	LVALUE	ASSIGNMENT	LVALUE			{
					printf("LVALUE->LVALUE=LVALUE\n");
					}		
			|	LVALUE	ASSIGNMENT	E				{
					printf("LVALUE->LVALUE=E\n");
					}	
			|	LVALUE	COMMA	LVALUE				{
					printf("LVALUE->LVALUE,LVALUE\n");
					}
			;
	TYPE	:	VOID	{printf("TYPE->VOID\n");}
			|	INT		{printf("TYPE->INT\n");}
			|	FLOAT	{printf("TYPE->FLOAT\n");}
			|	CHAR	{printf("TYPE->CHAR\n");}
			|	STRING	{printf("TYPE->STRING\n");}
			;
	ARRSIZE	:	ID		{
						printf("ARRSIZE->ID\n");
						int expect_type[1]={0};
						value ret_val=_find_id_from_block(_get_block_pos(),$1,expect_type);
						//printf("	idval:%ld\n",ret_val.idval);
						if(ret_val.idval<0){
						//error deal
							fprintf (stderr,
							   "expected '%s' but argument is of type '%s', l%d,c%d-l%d,c%d",
							   typemap[0],typemap[ret_val.idval+20],
							   @1.first_line, @1.first_column,
							   @1.last_line, @1.last_column);
							}
						
						}
			|	INTNUM	{
						printf("ARRSIZE->INTNUM\n");
						}
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
		|	F	{
					printf("E->F\n");
					show_value(*$1);
				}
		;
	
	F	:	LVALUE	{printf("F->LVALUE\n");}
		|	INTNUM	{
				printf("F->INTNUM:%d\n",$1);
				value* tempval=_new_value();
				tempval->isint=1;
				tempval->itype=$1;
				$$=tempval;
				}
		|	FLOATNUM	{
				printf("F->FLOATNUM:%f\n",$1);
				value* tempval=_new_value();
				tempval->isfloat=1;
				tempval->ftype=$1;
				$$=tempval;
				}
		|	CONSTCHAR	{
				printf("F->CONSTCHAR\n");
				value* tempval=_new_value();
				tempval->ischar=1;
				tempval->chartype=$1[1];
				$$=tempval;
				}
		|	CONSTSTRING	{
				printf("F->CONSTSTRING\n");
				value* tempval=_new_value();
				tempval->isstring=1;
				int j=strlen($1);
				char *tempstr=strdup($1);
				if(j>2)
				{
					for(int i=1;i<j-1;i++)
						tempstr[i-1]=tempstr[i];
					tempstr[j-2]=0;
				}else{
					tempval->stringtype=0;
				}
				tempval->stringtype=tempstr;
				$$=tempval;
				}
		;
	INTNUM	:	DEC	{
					$$=_my_atoi($1,10);
					}
		|	HEX	{
					$$=_my_atoi($1,16);
				}
		|	OCT	{
					$$=_my_atoi($1,8);
				}
		|	LPARENTHESE	INT RPARENTHESE E	{
					printf("INTNUM->(int)E\n");
				}
		|	INT	LPARENTHESE	E	RPARENTHESE	{
					printf("INTNUM->int(E)\n");
				}
		;
	FLOATNUM:	DEFLOAT	{
					$$=_my_atof($1,10);
					}
		|	OCFLOAT	{
					$$=_my_atof($1,8);
					}
		|	HEFLOAT	{
					$$=_my_atof($1,16);
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