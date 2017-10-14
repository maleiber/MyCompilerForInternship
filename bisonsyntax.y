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
	vnstruct* Vn;
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
%type	<Vn>F
%type	<Vn>E
%type	<Vn>LVALUE
%type	<Vn>ARRSIZE
%type	<Vn>DECLARE
%type	<itype>TYPE
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
	DECLARE	:	TYPE	LVALUE	{
						printf("DECLARE->TYPE LVALUE\n");
					}
			|	TYPE	LVALUE	COMMA	DECLARE	{
						printf("DECLARE->TYPE LVALUE,DECLARE\n");
					}
			|	ARRAYDECLARE	{
						printf("DECLARE->ARRAYDECLARE\n");
					}
			|	ARRAYDECLARE	COMMA	DECLARE	{
						printf("DECLARE->ARRAYDECLARE,DECLARE\n");
					}
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
					//may use by declare or usage
					$$=formVn(0,1,$1,"",0);
					}	
			|	ADDR	ID	{
					printf("LVALUE->&ID\n");
					//may use by declare or usage
					$$=formVn(0,2,$2,"",0);
					}
			|	ID	LBRACKET	ARRSIZE	RBRACKET	{
					// NOT DECLARE, IT MUST BE USAGE OF ARRAY
					printf("LVALUE->ID[ARRSIZE]\n");
					char* offset;
					char name[100];
					char buff[255];
					int expect_type[5]={2,3,6,7,9};
					$$=useage_of_id($1,expect_type,@1.first_line, @1.first_column,
						@1.last_line, @1.last_column);
					
					if(!$$->addr){return;}
					else{
						
						sprintf(name,"%s",($$->addr)->name);
						$$->addr=newtemp();
						sprintf(buff,"%s:=%s",($$->addr)->name,name);
						printf("gen:	%s\n",buff);
						//gen(buff);
					}
					if($3->addr==0)
					{
						//negative arrsize
						//just new temp
					}else{
						offset=($3->addr)->name;
						//(offset*typesize) caculate in arrsize
						//code+: newtemp=id+offset	
						sprintf(buff,"%s:=%s+%s",$$->addr,$$->addr,offset);
						printf("gen:	%s\n",buff);
						//gen(buff);
					}
					
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
					//newtemp=$3.addr.name; (E)
					//$1.addr.name=newtemp
					//$$.addr.name=$1.addr.name
					}	
			|	LVALUE	COMMA	LVALUE				{
					printf("LVALUE->LVALUE,LVALUE\n");
					//may from normal, or array
					//if(!$1.addr)
					//$1.addr.name=$3.addr.name;
					//$$.addr.name=$1.addr.name
					}
			;
	TYPE	:	VOID	{printf("TYPE->VOID\n");$$=8;}
			|	INT		{printf("TYPE->INT\n");$$=0;}
			|	FLOAT	{printf("TYPE->FLOAT\n");$$=1;}
			|	CHAR	{printf("TYPE->CHAR\n");$$=4;}
			|	STRING	{printf("TYPE->STRING\n");$$=5;}
			;
	ARRSIZE	:	ID		{
							printf("ARRSIZE->ID:%s\n",$1);
							int expect_type[1]={0};
							$$=useage_of_id($1,expect_type,@1.first_line, @1.first_column,
								   @1.last_line, @1.last_column);
							char name[100];
							char buff[255];
							if(!$$->addr)return;
							sprintf(name,"%s",($$->addr)->name);
							$$->addr=newtemp();
							sprintf(buff,"%s:=%s * %d",($$->addr)->name,name,type_size_map[0]);
							printf("gen:	%s\n",buff);
							//gen(buff);
							//arrsize.addr=newtemp;gen(arrsize.addr = name*typesize);	   
							
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
					$$=$1;
					//show_Vn($$);
				}
		|	E	COMMA	E	{printf("E->E,E\n");}
		;
	
	F	:	LVALUE	{
				printf("F->LVALUE\n");
				$$=$1;
				show_Vn($$);
			}
		|	INTNUM	{
				printf("F->INTNUM:%d\n",$1);
				char tmp[100];
				sprintf(tmp,"%d",$1);
				$$=formVn(formIdAddr("",0,0,0,0),1,"",tmp,0);
				show_Vn($$);
			}
		|	FLOATNUM	{
				printf("F->FLOATNUM:%f\n",$1);
				char tmp[100];
				sprintf(tmp,"%f",$1);
				$$=formVn(formIdAddr("",1,0,0,0),1,"",tmp,0);
				show_Vn($$);
			}
		|	CONSTCHAR	{
				
				char tmp[100];
				sprintf(tmp,"%c",$1[1]);
				$$=formVn(formIdAddr("",4,0,0,0),1,"",tmp,0);
				printf("F->CONSTCHAR:%s\n",tmp);
				show_Vn($$);
			}
		|	CONSTSTRING	{
				
				int j=strlen($1);
				char *tempstr=strdup($1);
				if(j>2)
				{
					for(int i=1;i<j-1;i++)
						tempstr[i-1]=tempstr[i];
					tempstr[j-2]=0;
				}else{
					tempstr=strdup("");
				}
				char tmp[j+1];
				sprintf(tmp,"%s",tempstr);
				$$=formVn(formIdAddr("",5,0,0,0),1,"",tmp,0);
				printf("F->CONSTSTRING:%s\n",tmp);
				show_Vn($$);
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