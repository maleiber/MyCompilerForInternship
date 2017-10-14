/* A Bison parser, made by GNU Bison 2.7.  */

/* Bison interface for Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2012 Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_BISONSYNTAX_TAB_H_INCLUDED
# define YY_YY_BISONSYNTAX_TAB_H_INCLUDED
/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     ID = 258,
     DEC = 259,
     HEX = 260,
     OCT = 261,
     DEFLOAT = 262,
     HEFLOAT = 263,
     OCFLOAT = 264,
     VOID = 265,
     INT = 266,
     FLOAT = 267,
     CHAR = 268,
     STRING = 269,
     CONSTCHAR = 270,
     CONSTSTRING = 271,
     DEF = 272,
     DEFINE = 273,
     RETURN = 274,
     ADDR = 275,
     PLUS = 276,
     MINUS = 277,
     MULTI = 278,
     RDIV = 279,
     COMMA = 280,
     DOT = 281,
     RELOP = 282,
     EQ = 283,
     LT = 284,
     GT = 285,
     LE = 286,
     GE = 287,
     NE = 288,
     COLON = 289,
     LOGIC = 290,
     OR = 291,
     AND = 292,
     NOT = 293,
     LPARENTHESE = 294,
     RPARENTHESE = 295,
     LBRACKET = 296,
     RBRACKET = 297,
     LBRACE = 298,
     RBRACE = 299,
     DOUBLEQUOMARKS = 300,
     IF = 301,
     ELSE = 302,
     WHILE = 303,
     DO = 304,
     FOR = 305,
     SWITCH = 306,
     CASE = 307,
     CONTINUE = 308,
     BREAK = 309,
     STRUCT = 310,
     SEMIC = 311,
     ASSIGNMENT = 312,
     TRUE = 313,
     FALSE = 314,
     UMINUS = 315
   };
#endif


#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{
/* Line 2058 of yacc.c  */
#line 14 "./bisonsyntax.y"

	char* stringtype;
	char chartype;
	int itype;
	float ftype;
	value* thisval;
	vnstruct Vn;


/* Line 2058 of yacc.c  */
#line 127 "bisonsyntax.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

#if ! defined YYLTYPE && ! defined YYLTYPE_IS_DECLARED
typedef struct YYLTYPE
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
} YYLTYPE;
# define yyltype YYLTYPE /* obsolescent; will be withdrawn */
# define YYLTYPE_IS_DECLARED 1
# define YYLTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;
extern YYLTYPE yylloc;
#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */

#endif /* !YY_YY_BISONSYNTAX_TAB_H_INCLUDED  */
