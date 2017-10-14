
typedef struct blocklist blocklist;
typedef struct listnode listnode;
typedef struct hashtable hashtable;

#include "blocklist.h"
#include "syntax.h"
#include "lex.yy.c"
#include "bisonsyntax.tab.c"
#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
extern char lex_buff[256];
extern int lex_buff_size;

void main(int argc,char* argv[])
{
	
	FILE *rhand;
	int ret_val=0;
	//preactions
	yylloc.first_line = yylloc.last_line = 1;
	yylloc.first_column = yylloc.last_column = 0;
	_init_block_list();
	printf("%d open %s\n", argc ,argv[1]);
	if(argc>1){
		rhand=fopen(argv[1],"r");
	}
	yyin=rhand;
	yyparse();
	
	/*
	int now=0;
	_init_block_list();
	printf("init block list...\n");
	printf("add id inta in block%d:%d\n",now,_blockfindandadd(now,"inta",0,0,0));
	printf("add id float in block%d:%d\n",now,_blockfindandadd(now,"floatb",1,2,0));
	printf("want to find id inta in block%d\n",now);
	show_value(_find_id_from_block(now,"inta"));
	now=_add_new_block();
	printf("\n add new block:%d\n",now);
	printf("add id inta in block%d:%d\n",now,_blockfindandadd(now,"inta",0,4,0));
	printf("add id float in block%d:%d\n",now,_blockfindandadd(now,"floatb",1,6,0));
	printf("want to find id inta in block%d\n",now);
	show_value(_find_id_from_block(now,"inta"));
	*/
	/*while(ret_val=yylex())
	{
		printf("type: %d scan: val:%s length:%d\n",ret_val,lex_buff,lex_buff_size);
		memset(lex_buff,0 ,sizeof lex_buff);
		lex_buff_size=0;
		lex_value=0;
	};*/
	
	printf("scan end.\n");

}