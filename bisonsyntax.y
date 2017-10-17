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
%type	<Vn>ARRAYDECLARE
%type	<Vn>DEFINITE_ARRAYSIZE
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
							printf("ARRAYDECLARE->TYPE[ARRSIZE]DEFINITE_ARRAYSIZE LVALUE\n");
							if($5==0){}
							else{
								
								char *name=(char*)malloc(sizeof(char)*100);
								char *oldname=(char*)malloc(sizeof(char)*100);
								char *buff=(char*)malloc(sizeof(char)*255);
								idaddr* temp;
								sprintf(name,"%s",($3->addr)->name);
								sprintf(oldname,"%s",($5->addr)->name);
								$$=formVn(newtemp(),1,"",($3->code)->val,0,0);
								sprintf(buff,"%s = %s * %s",($$->addr)->name,name,oldname);
								vn_append_code($$,1,"",buff,$5->code,0);printf("gen:	%s\n",buff);
								buff=(char*)malloc(sizeof(char)*255);
								temp=newtemp();
								sprintf(buff,"%s = %s * %d",temp->name,($$->addr)->name,type_size_map[$1]);
								vn_append_code($$,1,"",buff,0,0);printf("gen:	%s\n",buff);
								$$->addr=temp;
								//name(size) is $$->addr, use it to alloc
								//if(-1==_blockfindandadd(_get_block_pos(),name in lvalue,typetoarray[$1],0,$$->addr)){code_append($$,alloc_space(name,$$->addr));}
								
								//alloc finished nextis assign if lvalue needed
								
								show_Vn($$);
								
							}
							//need to backfill
							//backfill("TYPE",$1)
						}	
					|	TYPE	LBRACKET	RBRACKET	DEFINITE_ARRAYSIZE	LVALUE	ASSIGNMENT	E{
							printf("ARRAYDECLARE->TYPE[]DEFINITE_ARRAYSIZE LVALUE = E\n");
							
							
							
							
							//need to backfill
							//backfill("TYPE",$1)
							//gen("declare "+id+"address");length and size
							//assignment
							//int value=typetoarray[$1];
							//char *name,*nextval;
							int state=0,isthefirst=1;
							//for i in $5->code->codelength
							//{
							//isthefirst=1;
							//name=$5->code->val;
							//idaddr* preaddr;
							//preaddr=distributeaddr();
							//state=_blockfindandadd(_get_block_pos(),name,value,preaddr,0);
							if(state==-1)
							{
								//checkarraysize(outer-len,definite-arrarsize,E)
								// gen addr_offset:=addr_id
								//the outer len confirm by len of E
								//int size=outer-len * definite-arrarsize
								//nextval=E->codevalue
								// for i in size
								//	nextval=getnextval(nextval,isthefirst);
								//  if isthefirst: isthefirst=0;
								//	gen offset:=nextval;
								//
								//  gen addr_offset:=addr_offsetoffset+typesize
								//blockfindandadd
							}
							else{
							}
							//}
						}
					|	TYPE	LBRACKET	RBRACKET	DEFINITE_ARRAYSIZE	LVALUE		{
						printf("DECLARE->TYPE[]DEFINITE_ARRAYSIZE LVALUE\n");
						//need to backfill
						//backfill("TYPE",$1)
						//gen("declare "+id+"address");length and size
						
						}
					;
	DEFINITE_ARRAYSIZE	:	LBRACKET	ARRSIZE	RBRACKET	DEFINITE_ARRAYSIZE	{
									printf("DEFINITE_ARRAYSIZE->[ARRSIZE]	DEFINITE_ARRAYSIZE\n");
									if($4==0){$$=$2;show_Vn($$);}
									else{
										char *name=(char*)malloc(sizeof(char)*100);
										char *oldname=(char*)malloc(sizeof(char)*100);
										char *buff=(char*)malloc(sizeof(char)*255);
										sprintf(name,"%s",($2->addr)->name);
										sprintf(oldname,"%s",($4->addr)->name);
										$$=formVn(newtemp(),1,"",($2->code)->val,0,0);
																			
										sprintf(buff,"%s = %s * %s",($$->addr)->name,name,oldname);
										printf("gen:	%s\n",buff);
										
										vn_append_code($$,1,"",buff,$4->code,0);
										
										show_Vn($$);
									}
									
								
								}
						|		{
								printf("DEFINITE_ARRAYSIZE->null\n");
								$$=0;
								}
						;
	LVALUE	:	ID			{
					printf("LVALUE->ID:%s\n",$1);
					//may use by declare or usage
					$$=formVn(0,1,"",$1,0,0);
					show_Vn($$);
					}	
			|	ADDR	ID	{
					printf("LVALUE->&ID\n");
					//may use by declare or usage
					$$=formVn(0,2,$2,"",0,0);
					}
			|	ID	LBRACKET	ARRSIZE	RBRACKET	{
					// NOT DECLARE, IT MUST BE USAGE OF ARRAY
					printf("LVALUE->ID[ARRSIZE]\n");
					char* offset;
					char *name=(char*)malloc(sizeof(char)*100);
					char *buff=(char*)malloc(sizeof(char)*255);
					idaddr* tmp;
					int expect_type[5]={2,3,6,7,9};
					$$=useage_of_id($1,expect_type,@1.first_line, @1.first_column,
						@1.last_line, @1.last_column);
					
					if(!$$->addr){return;}
					else{
						
						sprintf(name,"%s",($$->addr)->name);
						$$->addr=newtemp();
						sprintf(buff,"%s := %s",($$->addr)->name,name);
						vn_append_code($$,1,"",buff,0,0);
						printf("gen:	%s\n",buff);
						//gen(buff);
					}
					if($3->addr==0)
					{
						//negative arrsize
						//just new temp
					}else{
						tmp=newtemp();
						//(offset*typesize) caculate in arrsize
						//code+: newtemp=id+offset	
						sprintf(buff,"%s = %s * %s",tmp,($3->addr)->name,type_size_map[$$->addr->type]);
						vn_append_code($$,1,"",buff,0,0);
						printf("gen:	%s\n",buff);
						sprintf(buff,"%s := %s + %s",$$->addr,$$->addr,offset);
						vn_append_code($$,1,"",buff,0,0);
						printf("gen:	%s\n",buff);
						//gen(buff);
					}
					show_Vn($$);
					}
			|	ID	LPARENTHESE	expr	RPARENTHESE	{
					printf("LVALUE->ID(expr)\n");
					}
			|	ID	LPARENTHESE	expr	RPARENTHESE	LBRACE	P	RBRACE	{
					printf("LVALUE->ID(expr){P}\n");
					}
			|	LVALUE	ASSIGNMENT	LVALUE			{
					printf("LVALUE->LVALUE=LVALUE\n");
					printf("	$1E:\n");
					show_Vn($1);
					printf("	$3E:\n");
					show_Vn($3);
					}		
			|	LVALUE	ASSIGNMENT	E				{
					printf("LVALUE->LVALUE=E\n	$1LVALUE:\n");
					show_Vn($1);
					printf("	$3E:\n");
					show_Vn($3);
					
					//newtemp=$3.addr.name; (E)
					//code $1.addr.name=newtemp
					//code $$.addr.name=$1.addr.name
					}	
			|	LVALUE	COMMA	LVALUE				{
					printf("LVALUE->LVALUE,LVALUE\n");
					$$=$1;
					code_append($1->code,$3->code);
					show_Vn($$);
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
							char *name=(char*)malloc(sizeof(char)*100);
							char *buff=(char*)malloc(sizeof(char)*255);
							if(!$$->addr){printf("addr of id is empty!\n");return;}
							sprintf(name,"%s",($$->addr)->name);
							$$=formVn(newtemp(),1,"",name,0,0);
							sprintf(buff,"%s = %s",($$->addr)->name,name,type_size_map[0]);
							printf("gen:	%s\n",buff);
							sprintf(($$->code)->val,"%s",buff);
							show_Vn($$);
							//gen(buff);
							//arrsize.addr=newtemp;gen(arrsize.addr = name*typesize);	   
							
						}
			|	INTNUM	{
							printf("ARRSIZE->INTNUM\n");
							
							char *name=(char*)malloc(sizeof(char)*100);
							char *buff=(char*)malloc(sizeof(char)*255);
							sprintf(name,"%d",$1);
							$$=formVn(newtemp(),1,"",name,0,0);
							
							sprintf(buff,"%s = %s",($$->addr)->name,name);
							printf("gen:	%s\n",buff);
							sprintf(($$->code)->val,"%s",buff);
							show_Vn($$);
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
					code_parellel_append($$->code,form_code_value_easy(1,"size","1"));
					codevalue* cv_tmp1=form_code_value_easy(0,"code","");
					codevalue* cv_tmp2=form_code_value_easy(0,"addr","");
					codevalue* cv_tmp3=form_code_value_easy(0,"","");
					char* buff=(char*)malloc(sizeof(char)*100);
					sprintf(buff," = %s" ,($1->code)->val);
					code_append(cv_tmp2,form_code_value_easy(1,"",buff));
					code_append(cv_tmp1,cv_tmp3);
					code_parellel_append(cv_tmp3,cv_tmp2);
					code_parellel_append($$->code,cv_tmp1);
					show_Vn($$);
				}
		|	E	COMMA	E	{
					printf("E->E,E\n");
					printf("$1E:\n");
					show_Vn($1);
					printf("$3E:\n");
					show_Vn($3);
					char *buff=(char*)malloc(sizeof(char)*32);
					codevalue* cv_size1=search_code_value_by_key($1->code,"size");
					codevalue* cv_size2=search_code_value_by_key($3->code,"size");
					codevalue* cv_code1=search_code_value_by_key($1->code,"code");
					codevalue* cv_code2=search_code_value_by_key($3->code,"code");
					int newsize=cv_size1->def+cv_size2->def;
					sprintf(buff,"%d",newsize);
			
					$$=formVn(formIdAddr("",-1,0,0,0),1,"","",0,0);			
					code_parellel_append($$->code,form_code_value_easy(newsize,"size",buff));
					
					code_append(cv_code2,(cv_code1)->nextval);
					if(cv_code2)code_parellel_append($$->code,cv_code2);
					
					code_append_debar_parellel($$->code,$3->code,"err");
					code_append_debar_parellel($$->code,$1->code,"err");
					////$$=formVn(formIdAddr("",-1,0,0,0),($1->code)->def,($1->code)->key,($1->code)->val,$3->code,0);
					printf("$$E:\n");
					show_Vn($$);
				}
		|	LBRACE	E	RBRACE	{
					printf("E->{E}\n");
					$$=formVn(formIdAddr("",-1,0,0,0),1,"","",0,$2->code);
					printf("$$E:\n");
					show_Vn($$);
				}
		;
	
	F	:	ID	{
				printf("F->ID\n");
				$$=formVn(0,1,"",$1,0,0);
				show_Vn($$);
				
			}
		|	INTNUM	{
				printf("F->INTNUM:%d\n",$1);
				char *tmp=(char*)malloc(sizeof(char *)*255);
				sprintf(tmp,"%d",$1);
				$$=formVn(formIdAddr("",0,0,0,0),1,"",tmp,0,0);
				show_Vn($$);
				
			}
		|	FLOATNUM	{
				printf("F->FLOATNUM:%f\n",$1);
				char *tmp=(char*)malloc(sizeof(char *)*255);
				sprintf(tmp,"%f",$1);
				$$=formVn(formIdAddr("",1,0,0,0),1,"",tmp,0,0);
				show_Vn($$);
			}
		|	CONSTCHAR	{
				
				char *tmp=(char*)malloc(sizeof(char *)*255);
				sprintf(tmp,"%c",$1[1]);
				$$=formVn(formIdAddr("",4,0,0,0),1,"",tmp,0,0);
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
				$$=formVn(formIdAddr("",5,0,0,0),1,"",tmp,0,0);
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