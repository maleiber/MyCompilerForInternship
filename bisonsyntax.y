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
%type	<Vn>P
%type	<Vn>L
%type	<Vn>S
%type	<Vn>expr
%type	<Vn>DECLARE
%type	<Vn>F
%type	<Vn>E
%type	<Vn>LVALUE
%type	<Vn>ARRSIZE
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
	P	:	L	P	{printf("P->LP\n");
					codevalue* cv_code1=search_code_value_by_key($1->code,"code");
					codevalue* cv_code2=search_code_value_by_key($2->code,"code");
					if(cv_code2)code_append(cv_code1,cv_code2->nextval);
					$$=$1;
					gen_Vn($$);
					}
		|	L		{printf("P->L\n");$$=$1;gen_Vn($$);}
		|			{printf("P->null\n");$$=0;}
		;
	L	:	S	{printf("L->S\n");$$=$1;}
		;
	S	:	expr SEMIC	{printf("S->expr;\n");$$=$1;}
		|	CTRLexpr	{printf("S->Cexpr \n");}
		|	LBRACE	P	RBRACE 	{
						printf("S->{P}\n");
						codevalue* cv_code=search_code_value_by_key($2->code,"code");
						if(cv_code){
							code_append(cv_code,_release_now_block());
							code_append(cv_code,_reassign_now_block());
						}
						$$=$2;
						gen_Vn($$);
						}
		|	RETURN	E	SEMIC	{printf("S->RETURN LVALUE;\n");}
		|	RETURN	SEMIC			{printf("S->RETURN;\n");}
		|	{printf("S->null\n");$$=0;}
		;
	expr:	DECLARE		{printf("expr->DECLARE\n");}
		|	C			{printf("expr->C\n");}
		|	E			{printf("expr->E\n");}
		|	LVALUE		{
							printf("expr->LVALUE\n");
							//usage
							$$=formVn(formIdAddr("",-1,0,0,0),1,"","",0,0);
							codevalue* lvalue_num=search_code_value_by_key($1->code,"lsize");
							codevalue* lvalue_code=search_code_value_by_key($1->code,"code");
							codevalue* lvalue_id=search_code_value_by_key($1->code,"lid");
							codevalue* lvalue_id_index;
							codevalue* new_code=form_code_value_easy(1,"code","");
							vnstruct* find_ans=0;
							//code access: if that id not define before ,that expr is negative
							lvalue_id_index=lvalue_id;
							int all_expect[11]={0,1,2,3,4,5,6,7,8,9,10};
							int real_count=0;
							char* buff=(char*)malloc(sizeof(char)*100);
							while(lvalue_id_index){
								find_ans=useage_of_id(lvalue_id_index->val,all_expect,11,
								@1.first_line, @1.first_column,
								@1.last_line, @1.last_column);
								//find_ans=_blockfindandadd(_get_block_pos(),,c1,formIdAddr(space,0,0,0,0),0,space);
								if((find_ans->code)->def==0){}
								else{
									real_count++;
									sprintf(buff,"%d",type_size_map[(find_ans->addr)->type]);
									define_klink("typesize",buff);
								}
								
								lvalue_id_index=lvalue_id_index->nextval;
							}
							if(real_count==0){code_parellel_append($$->code,new_code);}
							else{
							$$=$1;
							};
						}
		|				{printf("expr->null\n");$$=0;}
		;
	DECLARE	:	TYPE	LVALUE	{
						printf("DECLARE->TYPE LVALUE\n");
						$$=formVn(formIdAddr("",-1,0,0,0),1,"","",0,0);
						codevalue* lvalue_num=search_code_value_by_key($2->code,"lsize");
						codevalue* lvalue_code=search_code_value_by_key($2->code,"code");
						codevalue* lvalue_id=search_code_value_by_key($2->code,"lid");
						codevalue* ttlen_code=0;
						codevalue* ttlen_code0=form_code_value_easy(0,"","");
						codevalue* lassignstart=search_code_value_by_key($2->code,"lassignstart");
						char *buff=(char*)malloc(sizeof(char)*255);
						sprintf(buff,"%d",lvalue_num->def);
						char *space=newtemp()->name;
						sprintf(buff,"%s = %d * %d",space,lvalue_num->def,type_size_map[$1]);
						ttlen_code=form_code_value_easy(0,"",buff);
						code_parellel_append(ttlen_code0,ttlen_code);
						code_parellel_append($$->code,lassignstart);
						code_parellel_append($$->code,lvalue_id);
						code_parellel_append($$->code,array_declare(ttlen_code0,$1,$2->code,space));
						gen_Vn($$);
						
					}
			|	TYPE	LVALUE	COMMA	DECLARE	{
						printf("DECLARE->TYPE LVALUE,DECLARE\n");
						$$=formVn(formIdAddr("",-1,0,0,0),1,"","",0,0);
						codevalue* D_code=search_code_value_by_key($4->code,"code");
						codevalue* lvalue_num=search_code_value_by_key($2->code,"lsize");
						codevalue* lvalue_code=search_code_value_by_key($2->code,"code");
						codevalue* lvalue_id=search_code_value_by_key($2->code,"lid");
						codevalue* dec_id=search_code_value_by_key($4->code,"lid");
						codevalue* ttlen_code=0;
						codevalue* ttlen_code0=form_code_value_easy(0,"","");
						codevalue* lassignstart=search_code_value_by_key($2->code,"lassignstart");
						char *buff=(char*)malloc(sizeof(char)*255);
						sprintf(buff,"%d",lvalue_num->def);
						char *space=newtemp()->name;
						sprintf(buff,"%s = %d * %d",space,lvalue_num->def,type_size_map[$1]);
						ttlen_code=form_code_value_easy(0,"",buff);
						code_parellel_append(ttlen_code0,ttlen_code);
						codevalue* new_code=array_declare(ttlen_code0,$1,$2->code,space);
						code_append(new_code,D_code->nextval);
						
						code_append(lvalue_id,dec_id);
						code_parellel_append($$->code,lassignstart);
						code_parellel_append($$->code,lvalue_id);
						code_parellel_append($$->code,new_code);
						gen_Vn($$);
					}
			|	ARRAYDECLARE	{
						printf("DECLARE->ARRAYDECLARE\n");
						$$=$1;
					}
			|	ARRAYDECLARE	COMMA	DECLARE	{
						printf("DECLARE->ARRAYDECLARE,DECLARE\n");
						codevalue* L_code=search_code_value_by_key($1->code,"code");
						codevalue* D_code=search_code_value_by_key($3->code,"code");
						codevalue* new_code=form_code_value_easy(1,"code","");
						codevalue* lassignstart=search_code_value_by_key($1->code,"lassignstart");
						codevalue* lvalue_id1=search_code_value_by_key($1->code,"lid");
						codevalue* lvalue_id2=search_code_value_by_key($3->code,"lid");
						code_append(new_code,L_code->nextval);
						code_append(new_code,D_code->nextval);
						$$=formVn(formIdAddr("",-1,0,0,0),1,"","",0,0);
						code_parellel_append($$->code,lassignstart);
						code_append(lvalue_id1,lvalue_id2);
						code_parellel_append($$->code,lvalue_id1);
						code_parellel_append($$->code,new_code);
						
					}
			|	TYPE	ID	LPARENTHESE	DECLARE	RPARENTHESE	LBRACE P RBRACE	{
						printf("DECLARE->TYPE id(LVALUE){P}\n");
						//define function
						$$=formVn(formIdAddr("",-1,0,0,0),1,"","",0,0);
						codevalue* cv_lid=search_code_value_by_key($4->code,"lid");
						codevalue* dec_code=search_code_value_by_key($4->code,"code");
						codevalue* P_code=search_code_value_by_key($7->code,"code");
						codevalue* this_code=form_code_value_easy(0,"code","");
						codevalue* lassignstart=search_code_value_by_key($4->code,"lassignstart");
						int from=_getexternpos();
						int to=_get_block_pos();
						//move_id_from_block(codevalue* cv_lid,int from,int to)
						char *funcpreparelabel,*funcstart,*exitlabel;
						int find_ans=0;
						char* buff=(char*)malloc(sizeof(char)*100);
						funcpreparelabel=newlabel()->name;
						funcstart=newlabel()->name;
						exitlabel=newlabel()->name;
						//function have no offset, noaddrname
						find_ans=_blockfindandadd(
							_get_block_pos(),$2,10,
							formIdAddr($2,10,0,0,0),0,"",lassignstart->val,exitlabel,funcpreparelabel,funcstart);
						if(find_ans>=0){printf("block notfound!\n");}
						else{
							codevalue* cv_line1;	//funcpreparelabel :
							codevalue* cv_line2;	//declare.code
							codevalue* cv_line3;	//goto exitlabel
							codevalue* cv_line4;	//funcstart :
							codevalue* cv_line5;	//P.code
							codevalue* cv_line6;	//goto exitlabel
							
							//....
							
							
							code_append(cv_line5,cv_line6);
							code_append(cv_line4,cv_line5);
							code_append(cv_line3,cv_line4);
							code_append(cv_line2,cv_line3);
							code_append(cv_line1,cv_line2);
							code_append(this_code,cv_line1);
						}
							
						code_parellel_append($$->code,lassignstart);
						code_parellel_append($$->code,this_code);
						
						gen_Vn($$);
						
						
						
					}
			;
	ARRAYDECLARE	:	TYPE	LBRACKET	ARRSIZE	RBRACKET	DEFINITE_ARRAYSIZE	LVALUE	{
							printf("ARRAYDECLARE->TYPE[ARRSIZE]DEFINITE_ARRAYSIZE LVALUE\n");
							
							codevalue* number_code=0;
							codevalue* number_code0=form_code_value_easy(0,"","");
							codevalue* ttlen_code=0;
							codevalue* ttlen_code0=form_code_value_easy(0,"","");
							codevalue* lassignstart=search_code_value_by_key($6->code,"lassignstart");
							codevalue *presize=form_code_value_easy(0,"",""),*presizetmp=0;
							codevalue* lvalue_id=search_code_value_by_key($6->code,"lid");
							char *name3=(char*)malloc(sizeof(char)*100);
							char *name5=(char*)malloc(sizeof(char)*100);
							char *totlen=(char*)malloc(sizeof(char)*100);
							char *space=newtemp()->name;
							char *buff=(char*)malloc(sizeof(char)*255);
							
							$$=formVn(formIdAddr("",-1,0,0,0),1,"","",0,0);
							code_parellel_append($$->code,lassignstart);
							sprintf(name3,"%s",($3->addr)->name);
							presize=$3->code;
							if($5==0){sprintf(name5,"%d",1);}
							else{
								sprintf(name5,"%s",($5->addr)->name);
								code_append(presize,$5->code);
							}
							
							sprintf(buff,"%s = %s * %s",space,name3,name5);
							number_code=form_code_value_easy(0,"",buff);
							code_parellel_append(number_code0,number_code);
							
							buff=(char*)malloc(sizeof(char)*100);
							sprintf(buff,"%s = %s * %d",space,space,type_size_map[typetoarray[$1]]);
							ttlen_code=form_code_value_easy(0,"",buff);
							code_parellel_append(ttlen_code0,ttlen_code);
							
							code_append(number_code0,ttlen_code0);
							code_append(presize,number_code0);
							code_parellel_append($$->code,lvalue_id);
							code_parellel_append($$->code,array_declare(presize,typetoarray[$1],$6->code,space));
							gen_Vn($$);
						

							/*
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
								sprintf(buff,"%s = %s * %d",temp->name,($$->addr)->name,type_size_map[typetoarray[$1]]);
								vn_append_code($$,1,"",buff,0,0);printf("gen:	%s\n",buff);
								$$->addr=temp;
								//name(size) is $$->addr, use it to alloc
								//if(-1==_blockfindandadd(_get_block_pos(),name in lvalue,typetoarray[$1],0,$$->addr)){code_append($$,alloc_space(name,$$->addr));}
								
								//alloc finished nextis assign if lvalue needed
								
								show_Vn($$);
								
							}
							//need to backfill
							//backfill("TYPE",$1)
							*/
							
						}	
					|	TYPE	LBRACKET	RBRACKET	DEFINITE_ARRAYSIZE	LVALUE	ASSIGNMENT	E{
							printf("ARRAYDECLARE->TYPE[]DEFINITE_ARRAYSIZE LVALUE = E\n");
							codevalue* number_code=0;
							codevalue* number_code0=form_code_value_easy(0,"","");
							codevalue* ttlen_code=0;
							codevalue* ttlen_code0=form_code_value_easy(0,"","");
							codevalue *presize=form_code_value_easy(0,"",""),*presizetmp=0;
							codevalue* L_code;
							codevalue* E_code=search_code_value_by_key($7->code,"code");
							codevalue* cv_size=search_code_value_by_key($7->code,"lsize");
							codevalue* cv_lid1=search_code_value_by_key($5->code,"lid");
							codevalue* cv_code=search_code_value_by_key($5->code,"code");
							codevalue* lassignstart=search_code_value_by_key($5->code,"lassignstart");
							codevalue* cv_newlid=form_code_value_easy(1,"lid","");
							
							char *name3=(char*)malloc(sizeof(char)*100);
							char *name5=(char*)malloc(sizeof(char)*100);
							char *totlen=(char*)malloc(sizeof(char)*100);
							char *space=newtemp()->name;
							char *buff=(char*)malloc(sizeof(char)*255);
							
							if(strlen(cv_lid1->val)<1)cv_lid1=0;
							else{
								cv_newlid->val=cv_lid1->val;
								code_append(cv_newlid,cv_lid1->nextval);
							}
							code_parellel_append($$->code,lassignstart);
							
							int newsize=cv_size->def;//number in lvalue
							sprintf(buff,"%d",newsize);
							$$=formVn(formIdAddr("",-1,0,0,0),1,"","",0,0);
							
							L_code=lvalue_assign_e($5->code,$7->code,newsize);
							code_parellel_append(L_code,cv_newlid);
							//printf("L_code\n");
							
							//sprintf(name3,"%s",($3->addr)->name);
							//presize=$3->code;
							sprintf(name5,"%d",newsize);
							
							sprintf(buff,"%s = %s",space,name5);
							number_code=form_code_value_easy(0,"",buff);
							code_parellel_append(number_code0,number_code);
							
							buff=(char*)malloc(sizeof(char)*100);
							sprintf(buff,"%s = %s * %d",space,space,type_size_map[typetoarray[$1]]);
							ttlen_code=form_code_value_easy(0,"",buff);
							code_parellel_append(ttlen_code0,ttlen_code);
							
							code_append(number_code0,ttlen_code0);
							//code_append(presize,number_code0);
							code_parellel_append($$->code,cv_newlid);
							code_parellel_append($$->code,array_declare(number_code0,typetoarray[$1],L_code,space));
							
							gen_Vn($$);
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							/*
							
							
							$$=formVn(formIdAddr("",-1,0,0,0),1,"","",0,0);
						
							if(cv_lid1){cv_newlid->val=cv_lid1->val;code_append(cv_newlid,cv_lid1->nextval);}
							code_parellel_append($$->code,cv_newlid);
							code_parellel_append($$->code,form_code_value_easy(newsize,"lsize",buff));
						
							code_parellel_append($$->code,lvalue_assign_e($5->code,$7->code,newsize));
							gen_Vn($$);
								*/
							
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
					$$=formVn(formIdAddr("",-1,0,0,0),1,$1,"",0,0);	
					char *buff=(char*)malloc(sizeof(char)*255);
					codevalue* lvalue_id=form_code_value_easy(1,"lid",$1);
					codevalue* lassignstart=form_code_value_easy(1,"lassignstart",newtemp()->name);
					//code_append(lvalue_id,form_code_value_easy(1,"",$1));
					
					codevalue* cv_tmp1=form_code_value_easy(0,"code","");
					codevalue* cv_tmp2=form_code_value_easy(0,"","");
					codevalue* cv_tmp3=form_code_value_easy(0,"lassign","");
					sprintf(buff," = & %s",$1);
					codevalue* cv_tmp4=form_code_value_easy(0,"",buff);
					codevalue* cv_tmp5=form_code_value_easy(0,"","");
					codevalue* cv_tmp6=form_code_value_easy(0,"","& ");
					codevalue* cv_tmp7=form_code_value_easy(0,"lassign","");
					codevalue* cv_tmp8=form_code_value_easy(0,""," = & ");
					codevalue* cv_tmp9=form_code_value_easy(0,"lassign","");
					codevalue* cv_tmp10=form_code_value_easy(1,""," + 1");
					code_append(cv_tmp8,cv_tmp10);
					code_parellel_append(cv_tmp8,cv_tmp9);
					code_append(cv_tmp6,cv_tmp8);
					code_parellel_append(cv_tmp6,cv_tmp7);
					code_parellel_append(cv_tmp5,cv_tmp6);
					code_append(cv_tmp2,cv_tmp5);
					code_append(cv_tmp3,cv_tmp4);
					code_parellel_append(cv_tmp2,cv_tmp3);
					code_append(cv_tmp1,cv_tmp2);
					code_parellel_append($$->code,lvalue_id);
					code_parellel_append($$->code,lassignstart);
					code_parellel_append($$->code,form_code_value_easy(1,"lsize","1"));
					code_parellel_append($$->code,cv_tmp1);
					
					gen_Vn($$);
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
					char *tmp1,*tmp2;
					codevalue* cv_code;
					codevalue *find_code;
					codevalue *cv_tmp=0,*cv_tmp0=0;
					int expect_type[5]={2,3,6,7,9};
						
					$$=useage_of_id($1,expect_type,5,@1.first_line, @1.first_column,
						@1.last_line, @1.last_column);
					find_code=form_code_value_easy(0,"",($$->addr)->name);
					printf("find id name:%s\n",($$->addr)->name);
					//$$=formVn(formIdAddr("",-1,0,0,0),1,"","",0,0);	
					int newsize=1;
					
					//codevalue* lvalue_id=form_code_value_easy(1,"lid","");
					
					if(!$$->addr){return;}
					else{
						sprintf(buff,"%d",newsize);			
						code_parellel_append($$->code,form_code_value_easy(newsize,"lsize",buff));
						buff=(char*)malloc(sizeof(char)*255);
						cv_code=form_code_value_easy(0,"code","");
						sprintf(name,"%s",($$->addr)->name);
						tmp1=newtemp()->name;
						sprintf(buff,"& %s = & %s",tmp1,($$->addr)->name);
						code_append(cv_code,form_code_value_easy(1,"",buff));
						
						//printf("gen:	%s\n",buff);
						//gen(buff);
					}
					//strncpy(($$->addr)->name,newtemp()->name,100);
					codevalue* cv_lid=form_code_value_easy(1,"lid",($$->addr)->name);
					codevalue* lassignstart=form_code_value_easy(1,"lassignstart",newtemp()->name);
					if($3==0)
					{
						//negative arrsize
						//just new temp
					}else{
						tmp2=newtemp()->name;
						buff=(char*)malloc(sizeof(char)*255);
						sprintf(buff,"%s = %s * %d",tmp2,($3->addr)->name,type_size_map[$$->addr->type]);
						code_append(cv_code,form_code_value_easy(1,"",($3->code)->val));
						code_append(cv_code,form_code_value_easy(1,"",buff));
						//printf("gen:	%s\n",buff);
						buff=(char*)malloc(sizeof(char)*255);
						
						sprintf(buff,"& %s = & %s + %s",($$->addr)->name,tmp1,tmp2);
						code_append(cv_code,form_code_value_easy(1,"",buff));
						
						buff=(char*)malloc(sizeof(char)*255);
						sprintf(buff," = & %s",($$->addr)->name);
						cv_tmp=form_cv_ck("& ","addr");
						code_append(cv_tmp,form_code_value_easy(1,"",buff));
						cv_tmp0=form_code_value_easy(0,"","");
						code_parellel_append(cv_tmp0,cv_tmp);
						code_append(cv_code,cv_tmp0);
						//printf("gen:	%s\n",buff);
					
					}
					
					code_parellel_append($$->code,cv_lid);
					code_parellel_append($$->code,lassignstart);
					code_parellel_append($$->code,cv_code);
					
					gen_Vn($$);
					
					}
			
			|	LVALUE	ASSIGNMENT	LVALUE			{
					printf("LVALUE->LVALUE=LVALUE\n");
					
					char *buff=(char*)malloc(sizeof(char)*32);
					codevalue* cv_size1=search_code_value_by_key($1->code,"lsize");
					codevalue* cv_size2=search_code_value_by_key($3->code,"lsize");
					codevalue* lassignstart=search_code_value_by_key($1->code,"lassignstart");
					
					codevalue* cv_code1=search_code_value_by_key($1->code,"code");
					codevalue* cv_code2=search_code_value_by_key($3->code,"code");
					codevalue* cv_lid1=search_code_value_by_key($1->code,"lid");
					codevalue* cv_lid2=search_code_value_by_key($3->code,"lid");
					codevalue* cv_newlid=form_code_value_easy(1,"lid","");
					int newsize=cv_size1->def+cv_size2->def;
					sprintf(buff,"%d",newsize);
			
					$$=formVn(formIdAddr("",-1,0,0,0),1,"","",0,0);			
					
					if(cv_lid1==0&&cv_lid2==0)printf("error.\n");
					//code_append(cv_lid1,cv_lid2);
					if(cv_lid1){cv_newlid->val=cv_lid1->val;code_append(cv_newlid,cv_lid1->nextval);}
					if(cv_lid2){code_append(cv_newlid,form_code_value_easy(0,"",cv_lid2->val));code_append(cv_newlid,cv_lid2->nextval);}
					code_parellel_append($$->code,cv_newlid);
					
					code_parellel_append($$->code,form_code_value_easy(newsize,"lsize",buff));
					if(lassignstart)code_parellel_append($$->code,lassignstart);
					
					code_append(cv_code2,(cv_code1)->nextval);
					if(cv_code2)code_parellel_append($$->code,cv_code2);
					
					//code_append_debar_parellel($$->code,$3->code,"err");
					//code_append_debar_parellel($$->code,$1->code,"err");
					printf("$$LVALUE:\n");
					
					gen_Vn($$);
					
					//printf("	$1E:\n");
					//show_Vn($1);
					//printf("	$3E:\n");
					//show_Vn($3);
					}		
			|	LVALUE	ASSIGNMENT	E				{
					printf("LVALUE->LVALUE=E\n");
					
					codevalue* cv_size1=search_code_value_by_key($1->code,"lsize");
					codevalue* cv_lid1=search_code_value_by_key($1->code,"lid");
					codevalue* lassignstart=search_code_value_by_key($1->code,"lassignstart");
					codevalue* cv_newlid=form_code_value_easy(1,"lid","");
					if(strlen(cv_lid1->val)<1)cv_lid1=0;
					char *buff=(char*)malloc(sizeof(char)*32);
					
					int newsize=cv_size1->def;//number in lvalue
					sprintf(buff,"%d",newsize);
					$$=formVn(formIdAddr("",-1,0,0,0),1,"","",0,0);
					
					if(cv_lid1){cv_newlid->val=cv_lid1->val;code_append(cv_newlid,cv_lid1->nextval);}
					code_parellel_append($$->code,cv_newlid);
					code_parellel_append($$->code,form_code_value_easy(newsize,"lsize",buff));
					code_parellel_append($$->code,lassignstart);
					code_parellel_append($$->code,lvalue_assign_e($1->code,$3->code,newsize));
					gen_Vn($$);
					
					
					
					
					
					//newtemp=$3.addr.name; (E)
					//code $1.addr.name=newtemp
					//code $$.addr.name=$1.addr.name
					}	
			|	LVALUE	COMMA	LVALUE				{
					printf("LVALUE->LVALUE,LVALUE\n");
					//$$=$1;
					//code_append($1->code,$3->code);
					//show_Vn($$);
					char *buff=(char*)malloc(sizeof(char)*32);
					codevalue* cv_size1=search_code_value_by_key($1->code,"lsize");
					codevalue* cv_size2=search_code_value_by_key($3->code,"lsize");
					codevalue* cv_code1=search_code_value_by_key($1->code,"code");
					codevalue* cv_code2=search_code_value_by_key($3->code,"code");
					codevalue* cv_lid1=search_code_value_by_key($1->code,"lid");
					codevalue* cv_lid2=search_code_value_by_key($3->code,"lid");
					codevalue* lassignstart=search_code_value_by_key($1->code,"lassignstart");
					int newsize=cv_size1->def+cv_size2->def;
					sprintf(buff,"%d",newsize);
			
					$$=formVn(formIdAddr("",-1,0,0,0),1,"","",0,0);
					codevalue* cv_newlid=form_code_value_easy(1,"lid","");
					if(cv_lid1){cv_newlid->val=cv_lid1->val;}
					else if(cv_lid2){cv_newlid->val=cv_lid2->val;}
					
					if(cv_lid1==0&&cv_lid2==0)printf("error.\n");
					code_append(cv_newlid,cv_lid1->nextval);
					if(cv_lid2){
						code_append(cv_newlid,form_code_value_easy(1,"",cv_lid2->val));
						code_append(cv_newlid,cv_lid2->nextval);
					}
					code_parellel_append($$->code,cv_newlid);
					
					code_parellel_append($$->code,form_code_value_easy(newsize,"lsize",buff));
					code_parellel_append($$->code,lassignstart);
					code_append(cv_code2,(cv_code1)->nextval);
					if(cv_code2)code_parellel_append($$->code,cv_code2);
					
					code_append_debar_parellel($$->code,$3->code,"err");
					code_append_debar_parellel($$->code,$1->code,"err");
					printf("$$LVALUE:\n");
					
					gen_Vn($$);
					
					
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
							$$=useage_of_id($1,expect_type,1,@1.first_line, @1.first_column,
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
	E	:	E	PLUS	E	{
								printf("E->E+E\n");
								$$=formVn(formIdAddr("",-1,0,0,0),1,"","",0,0);		
								codevalue* cv_size1=search_code_value_by_key($1->code,"lsize");
								codevalue* cv_size2=search_code_value_by_key($3->code,"lsize");
								codevalue* cv_newcode=0;
								if(cv_size1->def!=1||cv_size2->def!=1)
								{
									//error multi-value calculate
								}else{
									code_parellel_append($$->code,form_code_value_easy(1,"lsize","1"));
									cv_newcode=EcaculateE($1->code,$3->code,"+");
									code_parellel_append($$->code,cv_newcode);
								}
								gen_Vn($$);
							}
		|	E	MINUS	E	{
								printf("E->E-E\n");
								$$=formVn(formIdAddr("",-1,0,0,0),1,"","",0,0);		
								codevalue* cv_size1=search_code_value_by_key($1->code,"lsize");
								codevalue* cv_size2=search_code_value_by_key($3->code,"lsize");
								codevalue* cv_newcode=0;
								if(cv_size1->def!=1||cv_size2->def!=1)
								{
									//error multi-value calculate
								}else{
									code_parellel_append($$->code,form_code_value_easy(1,"lsize","1"));
									cv_newcode=EcaculateE($1->code,$3->code,"-");
									code_parellel_append($$->code,cv_newcode);
								}
								gen_Vn($$);
							}
		|	E	MULTI	E	{
								printf("E->E*E\n");
								$$=formVn(formIdAddr("",-1,0,0,0),1,"","",0,0);		
								codevalue* cv_size1=search_code_value_by_key($1->code,"lsize");
								codevalue* cv_size2=search_code_value_by_key($3->code,"lsize");
								codevalue* cv_newcode=0;
								if(cv_size1->def!=1||cv_size2->def!=1)
								{
									//error multi-value calculate
								}else{
									code_parellel_append($$->code,form_code_value_easy(1,"lsize","1"));
									cv_newcode=EcaculateE($1->code,$3->code,"*");
									code_parellel_append($$->code,cv_newcode);
								}
								gen_Vn($$);
							}
		|	E	RDIV	E	{
								printf("E->E/E\n");
								$$=formVn(formIdAddr("",-1,0,0,0),1,"","",0,0);		
								codevalue* cv_size1=search_code_value_by_key($1->code,"lsize");
								codevalue* cv_size2=search_code_value_by_key($3->code,"lsize");
								codevalue* cv_newcode=0;
								if(cv_size1->def!=1||cv_size2->def!=1)
								{
									//error multi-value calculate
								}else{
									code_parellel_append($$->code,form_code_value_easy(1,"lsize","1"));
									cv_newcode=EcaculateE($1->code,$3->code,"/");
									code_parellel_append($$->code,cv_newcode);
								}
								gen_Vn($$);
							}
		|	MINUS	E %prec UMINUS	{
								printf("E->-E\n");
								$$=formVn(formIdAddr("",-1,0,0,0),1,"","",0,0);		
								codevalue* cv_size=search_code_value_by_key($2->code,"lsize");
								codevalue* cv_code1=search_code_value_by_key($2->code,"code");
								codevalue* cv_newcode=form_code_value_easy(1,"code","");
								codevalue *cv_new_addr,*cv_new_addr0;
								char* LE_addr=newtemp()->name;
								char *buff;
								if(cv_size->def!=1){
								//error multi-value calculate
								}else{
									code_parellel_append($$->code,form_code_value_easy(1,"lsize","1"));
									redef_value_when_same_key_from_fathercode(cv_code1,"addr",LE_addr);
								
									buff=(char*)malloc(sizeof(char)*100);
									sprintf(buff,"= - %s ↑ ",LE_addr);
									cv_new_addr=form_cv_kc("addr",buff);
									cv_new_addr0=form_code_value_easy(0,"","");
									code_parellel_append(cv_new_addr0,cv_new_addr);
									code_append(cv_code1,cv_new_addr0);
									
									code_append(cv_newcode,cv_code1->nextval);
								}
								code_parellel_append($$->code,cv_newcode);
								gen_Vn($$);
							}
		|	LPARENTHESE	E	RPARENTHESE	{
								printf("E->(E)\n");$$=$2;
							}
		|	F	{
					printf("E->F\n");
					$$=$1;
					code_parellel_append($$->code,form_code_value_easy(1,"lsize","1"));
					codevalue* cv_code=search_code_value_by_key($1->code,"code");
					codevalue* cv_tmp1=form_code_value_easy(0,"code","");
					codevalue* cv_tmp2=form_code_value_easy(0,"addr","");
					codevalue* cv_tmp3=form_code_value_easy(0,"","");
					codevalue* cv_tmp4=form_code_value_easy(0,"","");
					codevalue* cv_tmp5=form_code_value_easy(0,""," ");
					codevalue* cv_tmp6=form_code_value_easy(0,"addr","");
					codevalue* cv_tmp7=form_code_value_easy(0,""," = ");
					codevalue* cv_tmp8=form_code_value_easy(0,"addr","");
					codevalue* cv_tmp9=form_code_value_easy(1,""," + 1");
					char* buff=(char*)malloc(sizeof(char)*100);
					sprintf(buff," ↑ = %s" ,($1->code)->val);
					code_append(cv_tmp3,cv_tmp4);
					code_append(cv_tmp5,cv_tmp7);
					code_parellel_append(cv_tmp5,cv_tmp6);
					code_parellel_append(cv_tmp4,cv_tmp5);
					code_append(cv_tmp7,cv_tmp9);
					code_parellel_append(cv_tmp7,cv_tmp8);
					code_append(cv_tmp2,form_code_value_easy(1,"",buff));
					if(cv_code)code_append(cv_tmp1,cv_code->nextval);
					code_append(cv_tmp1,cv_tmp3);
					code_parellel_append(cv_tmp3,cv_tmp2);
					code_parellel_append($$->code,cv_tmp1);
					//show_Vn($$);
					gen_Vn($$);
				}
		|	E	COMMA	E	{
					printf("E->E,E\n");
					
					char *buff=(char*)malloc(sizeof(char)*32);
					codevalue* cv_size1=search_code_value_by_key($1->code,"lsize");
					codevalue* cv_size2=search_code_value_by_key($3->code,"lsize");
					codevalue* cv_code1=search_code_value_by_key($1->code,"code");
					codevalue* cv_code2=search_code_value_by_key($3->code,"code");
					int newsize=cv_size1->def+cv_size2->def;
					sprintf(buff,"%d",newsize);
			
					$$=formVn(formIdAddr("",-1,0,0,0),1,"","",0,0);			
					code_parellel_append($$->code,form_code_value_easy(newsize,"lsize",buff));
					
					code_append(cv_code2,(cv_code1)->nextval);
					if(cv_code2)code_parellel_append($$->code,cv_code2);
					
					code_append_debar_parellel($$->code,$3->code,"err");
					code_append_debar_parellel($$->code,$1->code,"err");
					printf("$$E:\n");
					
					gen_Vn($$);
				}
		|	LBRACE	E	RBRACE	{
					printf("E->{E}\n");
					//used form rarray
					$$=$2;
					//$$=formVn(formIdAddr("",-1,0,0,0),1,"","",0,$2->code);
					printf("$$E:\n");
					show_Vn($$);
				}
		;
	
	F	:	ID	{
				printf("F->ID\n");
				$$=formVn(0,1,"",$1,0,0);
				show_Vn($$);
				
			}
		|	ID	LPARENTHESE E	RPARENTHESE	{
				printf("F->ID(E)\n");
				//use function
				char* answer_val=newtemp()->name;
				$$=formVn(0,1,"",answer_val,0,0);
				int all_expect[1]={10};
				codevalue *E_code=search_code_value_by_key($3->code,"code");
				codevalue *this_code=form_code_value_easy(1,"code","");
				char *buff,*tmpname;
				char *funcpreparelabel,*funcstart,*exitlabel,*lassignstart;
				vnstruct* find_ans=useage_of_id($1,all_expect,1,
								@1.first_line, @1.first_column,
								@1.last_line, @1.last_column);
				hashtable* funcptr;
				if(!find_ans->addr){printf("addr of id is empty!\n");return;}
				else{
					funcptr=find_hashptr_by_key(_get_block_pos(),$1,all_expect,1);
					if(!funcptr){printf("funcptr of id is empty!\n");return;}
					buff=(char*)malloc(sizeof(char)*100);
					sprintf(buff,"%s",funcptr->enter1);
					funcpreparelabel=buff;
					buff=(char*)malloc(sizeof(char)*100);
					sprintf(buff,"%s",funcptr->enter2);
					funcstart=buff;
					buff=(char*)malloc(sizeof(char)*100);
					sprintf(buff,"%s",funcptr->exit1);
					exitlabel=buff;
					buff=(char*)malloc(sizeof(char)*100);
					sprintf(buff,"%s",funcptr->tmpaddr);
					lassignstart=buff;
					tmpname=newtemp()->name;
				}
				
				codevalue* cv_line1;	//exitlabel = nextline + 1
				codevalue* cv_line2;	//goto funcpreparelabel
				codevalue* cv_line3;	//tmpname=lassignstart
				codevalue* cv_line4;	//E.code
				redef_value_when_same_key_from_fathercode(E_code,"addr",tmpname);
				codevalue* cv_line5;	//exitlabel = nextline + 1
				codevalue* cv_line6;	//goto funcstart
				
				//....
				
				
				code_append(cv_line5,cv_line6);
				code_append(cv_line4,cv_line5);
				code_append(cv_line3,cv_line4);
				code_append(cv_line2,cv_line3);
				code_append(cv_line1,cv_line2);
				code_append(this_code,cv_line1);
				code_parellel_append($$->code,this_code);
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