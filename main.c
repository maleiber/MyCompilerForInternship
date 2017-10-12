#include "node.h"
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
	printf("%d open %s\n", argc ,argv[1]);
	if(argc>1){
		rhand=fopen(argv[1],"r");
	}
	yyin=rhand;
	yyparse();
	/*while(ret_val=yylex())
	{
		printf("type: %d scan: val:%s length:%d\n",ret_val,lex_buff,lex_buff_size);
		memset(lex_buff,0 ,sizeof lex_buff);
		lex_buff_size=0;
		lex_value=0;
	};*/
	
	printf("scan end.\n");

}