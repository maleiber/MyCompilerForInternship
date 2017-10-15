/* A Bison parser, made by GNU Bison 2.7.  */

/* Bison implementation for Yacc-like parsers in C
   
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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.7"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* Copy the first part of user declarations.  */
/* Line 371 of yacc.c  */
#line 1 "./bisonsyntax.y"

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
	

/* Line 371 of yacc.c  */
#line 82 "bisonsyntax.tab.c"

# ifndef YY_NULL
#  if defined __cplusplus && 201103L <= __cplusplus
#   define YY_NULL nullptr
#  else
#   define YY_NULL 0
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* In a future release of Bison, this section will be replaced
   by #include "bisonsyntax.tab.h".  */
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
/* Line 387 of yacc.c  */
#line 14 "./bisonsyntax.y"

	char* stringtype;
	char chartype;
	int itype;
	float ftype;
	value* thisval;
	vnstruct* Vn;


/* Line 387 of yacc.c  */
#line 195 "bisonsyntax.tab.c"
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

/* Copy the second part of user declarations.  */

/* Line 390 of yacc.c  */
#line 236 "bisonsyntax.tab.c"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(N) (N)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int yyi)
#else
static int
YYID (yyi)
    int yyi;
#endif
{
  return yyi;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL \
	     && defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
  YYLTYPE yyls_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE) + sizeof (YYLTYPE)) \
      + 2 * YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)				\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack_alloc, Stack, yysize);			\
	Stack = &yyptr->Stack_alloc;					\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, (Count) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYSIZE_T yyi;                         \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (YYID (0))
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  71
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   553

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  61
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  19
/* YYNRULES -- Number of rules.  */
#define YYNRULES  84
/* YYNRULES -- Number of states.  */
#define YYNSTATES  173

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   315

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    59,    60
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     6,     8,     9,    11,    14,    16,    20,
      24,    27,    28,    30,    32,    34,    36,    37,    40,    45,
      47,    51,    58,    66,    72,    77,    78,    80,    83,    88,
      93,   101,   105,   109,   113,   115,   117,   119,   121,   123,
     125,   127,   133,   137,   142,   152,   160,   166,   169,   172,
     178,   179,   183,   185,   189,   193,   197,   201,   205,   209,
     211,   213,   217,   221,   225,   229,   232,   236,   238,   242,
     246,   248,   250,   252,   254,   256,   258,   260,   262,   267,
     272,   274,   276,   278,   283
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int8 yyrhs[] =
{
      62,     0,    -1,    63,    62,    -1,    63,    -1,    -1,    64,
      -1,    65,    56,    -1,    72,    -1,    43,    62,    44,    -1,
      19,    76,    56,    -1,    19,    56,    -1,    -1,    66,    -1,
      74,    -1,    76,    -1,    69,    -1,    -1,    70,    69,    -1,
      70,    69,    25,    66,    -1,    67,    -1,    67,    25,    66,
      -1,    70,    41,    71,    42,    68,    69,    -1,    70,    41,
      42,    68,    69,    57,    76,    -1,    70,    41,    42,    68,
      69,    -1,    41,    71,    42,    68,    -1,    -1,     3,    -1,
      20,     3,    -1,     3,    41,    71,    42,    -1,     3,    39,
      65,    40,    -1,     3,    39,    65,    40,    43,    62,    44,
      -1,    69,    57,    69,    -1,    69,    57,    76,    -1,    69,
      25,    69,    -1,    10,    -1,    11,    -1,    12,    -1,    13,
      -1,    14,    -1,     3,    -1,    78,    -1,    46,    74,    64,
      47,    64,    -1,    46,    74,    64,    -1,    48,    74,    49,
      64,    -1,    50,    39,    65,    56,    65,    56,    65,    40,
      64,    -1,    49,    64,    48,    39,    75,    40,    56,    -1,
      51,    65,    43,    73,    44,    -1,    54,    56,    -1,    53,
      56,    -1,    52,    65,    34,    64,    73,    -1,    -1,    39,
      75,    40,    -1,    75,    -1,    76,    28,    76,    -1,    76,
      29,    76,    -1,    76,    30,    76,    -1,    76,    33,    76,
      -1,    76,    31,    76,    -1,    76,    32,    76,    -1,    58,
      -1,    59,    -1,    76,    21,    76,    -1,    76,    22,    76,
      -1,    76,    23,    76,    -1,    76,    24,    76,    -1,    22,
      76,    -1,    39,    76,    40,    -1,    77,    -1,    76,    25,
      76,    -1,    43,    76,    44,    -1,    69,    -1,    78,    -1,
      79,    -1,    15,    -1,    16,    -1,     4,    -1,     5,    -1,
       6,    -1,    39,    11,    40,    76,    -1,    11,    39,    76,
      40,    -1,     7,    -1,     9,    -1,     8,    -1,    39,    12,
      40,    76,    -1,    12,    39,    76,    40,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,    97,    97,    98,    99,   101,   103,   104,   105,   106,
     107,   108,   110,   111,   112,   113,   114,   116,   119,   122,
     125,   129,   134,   166,   174,   177,   179,   184,   189,   222,
     225,   228,   232,   238,   246,   247,   248,   249,   250,   252,
     268,   277,   278,   279,   280,   283,   286,   289,   290,   292,
     295,   299,   300,   302,   303,   304,   305,   306,   307,   308,
     309,   311,   312,   313,   314,   315,   316,   317,   322,   332,
     340,   345,   352,   359,   367,   386,   389,   392,   395,   398,
     402,   405,   408,   411,   414
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "ID", "DEC", "HEX", "OCT", "DEFLOAT",
  "HEFLOAT", "OCFLOAT", "VOID", "INT", "FLOAT", "CHAR", "STRING",
  "CONSTCHAR", "CONSTSTRING", "DEF", "DEFINE", "RETURN", "ADDR", "PLUS",
  "MINUS", "MULTI", "RDIV", "COMMA", "DOT", "RELOP", "EQ", "LT", "GT",
  "LE", "GE", "NE", "COLON", "LOGIC", "OR", "AND", "NOT", "LPARENTHESE",
  "RPARENTHESE", "LBRACKET", "RBRACKET", "LBRACE", "RBRACE",
  "DOUBLEQUOMARKS", "IF", "ELSE", "WHILE", "DO", "FOR", "SWITCH", "CASE",
  "CONTINUE", "BREAK", "STRUCT", "SEMIC", "ASSIGNMENT", "TRUE", "FALSE",
  "UMINUS", "$accept", "P", "L", "S", "expr", "DECLARE", "ARRAYDECLARE",
  "DEFINITE_ARRAYSIZE", "LVALUE", "TYPE", "ARRSIZE", "CTRLexpr",
  "SWITCH_CASE", "C", "IC", "E", "F", "INTNUM", "FLOATNUM", YY_NULL
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,   301,   302,   303,   304,
     305,   306,   307,   308,   309,   310,   311,   312,   313,   314,
     315
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    61,    62,    62,    62,    63,    64,    64,    64,    64,
      64,    64,    65,    65,    65,    65,    65,    66,    66,    66,
      66,    67,    67,    67,    68,    68,    69,    69,    69,    69,
      69,    69,    69,    69,    70,    70,    70,    70,    70,    71,
      71,    72,    72,    72,    72,    72,    72,    72,    72,    73,
      73,    74,    74,    75,    75,    75,    75,    75,    75,    75,
      75,    76,    76,    76,    76,    76,    76,    76,    76,    76,
      77,    77,    77,    77,    77,    78,    78,    78,    78,    78,
      79,    79,    79,    79,    79
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     2,     1,     0,     1,     2,     1,     3,     3,
       2,     0,     1,     1,     1,     1,     0,     2,     4,     1,
       3,     6,     7,     5,     4,     0,     1,     2,     4,     4,
       7,     3,     3,     3,     1,     1,     1,     1,     1,     1,
       1,     5,     3,     4,     9,     7,     5,     2,     2,     5,
       0,     3,     1,     3,     3,     3,     3,     3,     3,     1,
       1,     3,     3,     3,     3,     2,     3,     1,     3,     3,
       1,     1,     1,     1,     1,     1,     1,     1,     4,     4,
       1,     1,     1,     4,     4
};

/* YYDEFACT[STATE-NAME] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       4,    26,    75,    76,    77,    80,    82,    81,    34,    35,
      36,    37,    38,    73,    74,     0,     0,     0,     0,     4,
       0,     0,    16,     0,     0,     0,     0,    59,    60,     0,
       3,     5,     0,    12,    19,    70,     0,     7,    13,    52,
      14,    67,    71,    72,    16,     0,     0,     0,     0,     0,
       0,     0,    10,    70,     0,    27,    65,     0,     0,     0,
       0,     0,    14,    11,     0,     0,     0,    16,     0,    48,
      47,     1,     2,     6,     0,     0,     0,     0,    17,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    39,     0,     0,    40,     0,     0,     0,     0,     9,
       0,     0,    51,    66,     8,    69,    42,    11,     0,     0,
      50,    35,    36,    20,    33,    31,    32,    25,     0,     0,
      61,    62,    63,    64,    68,    53,    54,    55,    57,    58,
      56,    29,     0,    28,    79,    84,    78,    83,    11,    43,
       0,    16,    16,     0,     0,     0,    25,    18,     4,    41,
       0,     0,     0,    46,     0,    23,     0,     0,     0,    16,
      11,    25,     0,    21,    30,    45,     0,    50,    24,    22,
      11,    49,    44
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    29,    30,    31,    32,    33,    34,   145,    53,    36,
      93,    37,   143,    38,    39,    40,    41,    42,    43
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -81
static const yytype_int16 yypact[] =
{
     174,    33,   -81,   -81,   -81,   -81,   -81,   -81,   -81,   -31,
     -27,   -81,   -81,   -81,   -81,   401,    17,   443,   316,   174,
     338,   338,   253,    23,   275,   -28,    28,   -81,   -81,    73,
     174,   -81,    36,   -81,    20,   110,     6,   -81,   -81,   -81,
     520,   -81,   -81,   -81,   275,    74,   443,   443,   -31,   -27,
     463,   443,   -81,   -14,    87,   -81,   -81,    10,    43,    49,
     403,    60,   466,   253,   520,    57,    68,   275,    75,   -81,
     -81,   -81,   -81,   -81,   116,     7,   443,    12,   -11,   443,
     443,   443,   443,   443,   443,   443,   443,   443,   443,   443,
      80,   -81,   113,    79,   -81,   340,   490,   495,   345,   -81,
     443,   443,   -81,   -81,   -81,   -81,    85,   253,    94,    78,
      84,   -81,   -81,   -81,   -81,   112,   121,   106,   109,   526,
      45,    45,   121,   121,   -81,    16,    16,    16,    16,    16,
      16,   114,   115,   -81,   -81,   -81,   150,   150,   253,   -81,
     379,   275,   275,   108,    74,     7,   106,   -81,   174,   -81,
     118,   105,   129,   -81,   122,    -4,     7,   124,   135,   275,
     196,   106,   443,   -14,   -81,   -81,   125,    84,   -81,    34,
     253,   -81,   -81
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -81,   -17,   -81,   -21,   -19,   -67,   -81,   -80,     0,   -81,
     -73,   -81,     2,    67,   -15,    14,   -81,   -39,   -81
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -33
static const yytype_int16 yytable[] =
{
      35,    66,    61,    59,   118,    68,    94,   113,    46,     1,
       1,    75,    47,    72,   119,    91,     2,     3,     4,    35,
      55,    75,    35,    48,    35,    90,    16,    16,    69,    54,
      35,    56,    60,    62,    64,    64,    78,    79,    94,    81,
      82,    83,   106,    76,    35,    74,    76,    77,   109,    46,
     100,    92,   147,   162,   117,    79,    80,    81,    82,    83,
      95,    96,    67,    35,    97,    98,   156,    35,    81,    82,
      83,   154,    44,    71,    45,   114,   115,    91,     2,     3,
       4,   168,    47,   101,    70,    48,   139,    63,    65,   102,
     116,   -32,    73,   120,   121,   122,   123,   124,   125,   126,
     127,   128,   129,   130,   104,    94,   107,    35,    79,    80,
      81,    82,    83,    92,   136,   137,   108,   149,   110,   114,
     131,   133,   151,   152,   132,   150,     8,   111,   112,    11,
      12,   157,   138,   140,   141,    75,   142,    75,    35,   167,
     166,    35,    35,    99,   -15,   155,    83,   144,    35,   172,
     -15,   146,   153,   -15,    64,   100,   163,   148,   158,    35,
      35,   159,   115,   160,   161,   170,   -15,    76,   164,   171,
      35,    79,    80,    81,    82,    83,   169,     1,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,   165,     0,    15,    16,     0,    17,     0,     0,     1,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    18,     0,    15,    16,    19,    17,     0,
      20,     0,    21,    22,    23,    24,     0,    25,    26,     0,
     -11,     0,    27,    28,     0,    18,     0,     0,     0,    19,
       0,     0,    20,     0,    21,    22,    23,    24,     0,    25,
      26,     0,   -16,     0,    27,    28,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
       0,     0,    15,    16,     0,    17,     0,     0,     1,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    18,     0,     0,    16,    19,    17,     0,    20,
       0,    21,    22,    23,    24,     0,    25,    26,     0,     0,
       0,    27,    28,     0,    18,     0,     0,     0,    51,     1,
       2,     3,     4,     5,     6,     7,     0,    57,    58,     0,
       0,    13,    14,    27,    28,     0,    16,     0,    17,     0,
       0,     1,     2,     3,     4,     5,     6,     7,     0,    48,
      49,     0,     0,    13,    14,    50,     0,     0,    16,    51,
      17,    79,    80,    81,    82,    83,    79,    80,    81,    82,
      83,     0,     0,     0,    27,    28,     0,    18,     0,     0,
     134,    51,     1,     2,     3,     4,     5,     6,     7,   105,
      48,    49,     0,     0,    13,    14,    27,    28,     0,    16,
       0,    17,     0,     0,     1,     2,     3,     4,     5,     6,
       7,     0,    48,    49,     0,     0,    13,    14,    50,     0,
       0,    16,    51,    17,    79,    80,    81,    82,    83,     0,
       0,    84,    85,    86,    87,    88,    89,    27,    28,     0,
      50,     0,     0,   103,    51,     0,     1,     2,     3,     4,
       5,     6,     7,     0,    48,    49,     0,    52,    13,    14,
       0,     0,     0,    16,     0,    17,     1,     2,     3,     4,
       5,     6,     7,     0,    57,    58,     0,     0,    13,    14,
       0,     0,    50,    16,     0,    17,    51,    79,    80,    81,
      82,    83,     0,     0,    84,    85,    86,    87,    88,    89,
       0,     0,    50,     0,     0,     0,    51,     0,     0,     0,
     105,    79,    80,    81,    82,    83,    79,    80,    81,    82,
      83,     0,     0,     0,     0,     0,     0,     0,     0,     1,
     135,     0,     0,     0,     0,   103,     8,   111,   112,    11,
      12,    79,    80,    81,    82,    83,    16,     0,    84,    85,
      86,    87,    88,    89
};

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-81)))

#define yytable_value_is_error(Yytable_value) \
  YYID (0)

static const yytype_int16 yycheck[] =
{
       0,    22,    19,    18,    77,    24,    45,    74,    39,     3,
       3,    25,    39,    30,    25,     3,     4,     5,     6,    19,
       3,    25,    22,    11,    24,    44,    20,    20,    56,    15,
      30,    17,    18,    19,    20,    21,    36,    21,    77,    23,
      24,    25,    63,    57,    44,    25,    57,    41,    67,    39,
      40,    39,   119,    57,    42,    21,    22,    23,    24,    25,
      46,    47,    39,    63,    50,    51,   146,    67,    23,    24,
      25,   144,    39,     0,    41,    75,    76,     3,     4,     5,
       6,   161,    39,    40,    56,    11,   107,    20,    21,    40,
      76,    57,    56,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    44,   144,    49,   107,    21,    22,
      23,    24,    25,    39,   100,   101,    48,   138,    43,   119,
      40,    42,   141,   142,    11,   140,    10,    11,    12,    13,
      14,   148,    47,    39,    56,    25,    52,    25,   138,   160,
     159,   141,   142,    56,    34,   145,    25,    41,   148,   170,
      40,    42,    44,    43,   140,    40,   156,    43,    40,   159,
     160,    56,   162,    34,    42,    40,    56,    57,    44,   167,
     170,    21,    22,    23,    24,    25,   162,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    56,    -1,    19,    20,    -1,    22,    -1,    -1,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    39,    -1,    19,    20,    43,    22,    -1,
      46,    -1,    48,    49,    50,    51,    -1,    53,    54,    -1,
      56,    -1,    58,    59,    -1,    39,    -1,    -1,    -1,    43,
      -1,    -1,    46,    -1,    48,    49,    50,    51,    -1,    53,
      54,    -1,    56,    -1,    58,    59,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      -1,    -1,    19,    20,    -1,    22,    -1,    -1,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    39,    -1,    -1,    20,    43,    22,    -1,    46,
      -1,    48,    49,    50,    51,    -1,    53,    54,    -1,    -1,
      -1,    58,    59,    -1,    39,    -1,    -1,    -1,    43,     3,
       4,     5,     6,     7,     8,     9,    -1,    11,    12,    -1,
      -1,    15,    16,    58,    59,    -1,    20,    -1,    22,    -1,
      -1,     3,     4,     5,     6,     7,     8,     9,    -1,    11,
      12,    -1,    -1,    15,    16,    39,    -1,    -1,    20,    43,
      22,    21,    22,    23,    24,    25,    21,    22,    23,    24,
      25,    -1,    -1,    -1,    58,    59,    -1,    39,    -1,    -1,
      40,    43,     3,     4,     5,     6,     7,     8,     9,    44,
      11,    12,    -1,    -1,    15,    16,    58,    59,    -1,    20,
      -1,    22,    -1,    -1,     3,     4,     5,     6,     7,     8,
       9,    -1,    11,    12,    -1,    -1,    15,    16,    39,    -1,
      -1,    20,    43,    22,    21,    22,    23,    24,    25,    -1,
      -1,    28,    29,    30,    31,    32,    33,    58,    59,    -1,
      39,    -1,    -1,    40,    43,    -1,     3,     4,     5,     6,
       7,     8,     9,    -1,    11,    12,    -1,    56,    15,    16,
      -1,    -1,    -1,    20,    -1,    22,     3,     4,     5,     6,
       7,     8,     9,    -1,    11,    12,    -1,    -1,    15,    16,
      -1,    -1,    39,    20,    -1,    22,    43,    21,    22,    23,
      24,    25,    -1,    -1,    28,    29,    30,    31,    32,    33,
      -1,    -1,    39,    -1,    -1,    -1,    43,    -1,    -1,    -1,
      44,    21,    22,    23,    24,    25,    21,    22,    23,    24,
      25,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,
      40,    -1,    -1,    -1,    -1,    40,    10,    11,    12,    13,
      14,    21,    22,    23,    24,    25,    20,    -1,    28,    29,
      30,    31,    32,    33
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    19,    20,    22,    39,    43,
      46,    48,    49,    50,    51,    53,    54,    58,    59,    62,
      63,    64,    65,    66,    67,    69,    70,    72,    74,    75,
      76,    77,    78,    79,    39,    41,    39,    39,    11,    12,
      39,    43,    56,    69,    76,     3,    76,    11,    12,    75,
      76,    62,    76,    74,    76,    74,    64,    39,    65,    56,
      56,     0,    62,    56,    25,    25,    57,    41,    69,    21,
      22,    23,    24,    25,    28,    29,    30,    31,    32,    33,
      65,     3,    39,    71,    78,    76,    76,    76,    76,    56,
      40,    40,    40,    40,    44,    44,    64,    49,    48,    65,
      43,    11,    12,    66,    69,    69,    76,    42,    71,    25,
      76,    76,    76,    76,    76,    76,    76,    76,    76,    76,
      76,    40,    11,    42,    40,    40,    76,    76,    47,    64,
      39,    56,    52,    73,    41,    68,    42,    66,    43,    64,
      75,    65,    65,    44,    71,    69,    68,    62,    40,    56,
      34,    42,    57,    69,    44,    56,    65,    64,    68,    76,
      40,    73,    64
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  However,
   YYFAIL appears to be in use.  Nevertheless, it is formally deprecated
   in Bison 2.4.2's NEWS entry, where a plan to phase it out is
   discussed.  */

#define YYFAIL		goto yyerrlab
#if defined YYFAIL
  /* This is here to suppress warnings from the GCC cpp's
     -Wunused-macros.  Normally we don't worry about that warning, but
     some users do, and we want to make it easy for users to remove
     YYFAIL uses, which will produce warnings from Bison 2.5.  */
#endif

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                  \
do                                                              \
  if (yychar == YYEMPTY)                                        \
    {                                                           \
      yychar = (Token);                                         \
      yylval = (Value);                                         \
      YYPOPSTACK (yylen);                                       \
      yystate = *yyssp;                                         \
      goto yybackup;                                            \
    }                                                           \
  else                                                          \
    {                                                           \
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))

/* Error token number */
#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)                                \
    do                                                                  \
      if (YYID (N))                                                     \
        {                                                               \
          (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;        \
          (Current).first_column = YYRHSLOC (Rhs, 1).first_column;      \
          (Current).last_line    = YYRHSLOC (Rhs, N).last_line;         \
          (Current).last_column  = YYRHSLOC (Rhs, N).last_column;       \
        }                                                               \
      else                                                              \
        {                                                               \
          (Current).first_line   = (Current).last_line   =              \
            YYRHSLOC (Rhs, 0).last_line;                                \
          (Current).first_column = (Current).last_column =              \
            YYRHSLOC (Rhs, 0).last_column;                              \
        }                                                               \
    while (YYID (0))
#endif

#define YYRHSLOC(Rhs, K) ((Rhs)[K])


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef __attribute__
/* This feature is available in gcc versions 2.5 and later.  */
# if (! defined __GNUC__ || __GNUC__ < 2 \
      || (__GNUC__ == 2 && __GNUC_MINOR__ < 5))
#  define __attribute__(Spec) /* empty */
# endif
#endif

#ifndef YY_LOCATION_PRINT
# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL

/* Print *YYLOCP on YYO.  Private, do not rely on its existence. */

__attribute__((__unused__))
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static unsigned
yy_location_print_ (FILE *yyo, YYLTYPE const * const yylocp)
#else
static unsigned
yy_location_print_ (yyo, yylocp)
    FILE *yyo;
    YYLTYPE const * const yylocp;
#endif
{
  unsigned res = 0;
  int end_col = 0 != yylocp->last_column ? yylocp->last_column - 1 : 0;
  if (0 <= yylocp->first_line)
    {
      res += fprintf (yyo, "%d", yylocp->first_line);
      if (0 <= yylocp->first_column)
        res += fprintf (yyo, ".%d", yylocp->first_column);
    }
  if (0 <= yylocp->last_line)
    {
      if (yylocp->first_line < yylocp->last_line)
        {
          res += fprintf (yyo, "-%d", yylocp->last_line);
          if (0 <= end_col)
            res += fprintf (yyo, ".%d", end_col);
        }
      else if (0 <= end_col && yylocp->first_column < end_col)
        res += fprintf (yyo, "-%d", end_col);
    }
  return res;
 }

#  define YY_LOCATION_PRINT(File, Loc)          \
  yy_location_print_ (File, &(Loc))

# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */
#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value, Location); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, YYLTYPE const * const yylocationp)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep, yylocationp)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
    YYLTYPE const * const yylocationp;
#endif
{
  FILE *yyo = yyoutput;
  YYUSE (yyo);
  if (!yyvaluep)
    return;
  YYUSE (yylocationp);
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
        break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, YYLTYPE const * const yylocationp)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep, yylocationp)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
    YYLTYPE const * const yylocationp;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  YY_LOCATION_PRINT (yyoutput, *yylocationp);
  YYFPRINTF (yyoutput, ": ");
  yy_symbol_value_print (yyoutput, yytype, yyvaluep, yylocationp);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
#else
static void
yy_stack_print (yybottom, yytop)
    yytype_int16 *yybottom;
    yytype_int16 *yytop;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, YYLTYPE *yylsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yylsp, yyrule)
    YYSTYPE *yyvsp;
    YYLTYPE *yylsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       , &(yylsp[(yyi + 1) - (yynrhs)])		       );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, yylsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (YY_NULL, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULL;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - Assume YYFAIL is not used.  It's too flawed to consider.  See
       <http://lists.gnu.org/archive/html/bison-patches/2009-12/msg00024.html>
       for details.  YYERROR is fine as it does not invoke this
       function.
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYSIZE_T yysize1 = yysize + yytnamerr (YY_NULL, yytname[yyx]);
                  if (! (yysize <= yysize1
                         && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                    return 2;
                  yysize = yysize1;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    YYSIZE_T yysize1 = yysize + yystrlen (yyformat);
    if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
      return 2;
    yysize = yysize1;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep, YYLTYPE *yylocationp)
#else
static void
yydestruct (yymsg, yytype, yyvaluep, yylocationp)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
    YYLTYPE *yylocationp;
#endif
{
  YYUSE (yyvaluep);
  YYUSE (yylocationp);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {

      default:
        break;
    }
}




/* The lookahead symbol.  */
int yychar;


#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval YY_INITIAL_VALUE(yyval_default);

/* Location data for the lookahead symbol.  */
YYLTYPE yylloc
# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
  = { 1, 1, 1, 1 }
# endif
;


/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{
    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       `yyss': related to states.
       `yyvs': related to semantic values.
       `yyls': related to locations.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    /* The location stack.  */
    YYLTYPE yylsa[YYINITDEPTH];
    YYLTYPE *yyls;
    YYLTYPE *yylsp;

    /* The locations where the error started and ended.  */
    YYLTYPE yyerror_range[3];

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;
  YYLTYPE yyloc;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N), yylsp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yylsp = yyls = yylsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
  yylsp[0] = yylloc;
  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;
	YYLTYPE *yyls1 = yyls;

	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),
		    &yyls1, yysize * sizeof (*yylsp),
		    &yystacksize);

	yyls = yyls1;
	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss_alloc, yyss);
	YYSTACK_RELOCATE (yyvs_alloc, yyvs);
	YYSTACK_RELOCATE (yyls_alloc, yyls);
#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;
      yylsp = yyls + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END
  *++yylsp = yylloc;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];

  /* Default location.  */
  YYLLOC_DEFAULT (yyloc, (yylsp - yylen), yylen);
  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
/* Line 1792 of yacc.c  */
#line 97 "./bisonsyntax.y"
    {printf("P->LP\n");}
    break;

  case 3:
/* Line 1792 of yacc.c  */
#line 98 "./bisonsyntax.y"
    {printf("P->L\n");}
    break;

  case 4:
/* Line 1792 of yacc.c  */
#line 99 "./bisonsyntax.y"
    {printf("P->null\n");}
    break;

  case 5:
/* Line 1792 of yacc.c  */
#line 101 "./bisonsyntax.y"
    {printf("L->S\n");}
    break;

  case 6:
/* Line 1792 of yacc.c  */
#line 103 "./bisonsyntax.y"
    {printf("S->expr;\n");}
    break;

  case 7:
/* Line 1792 of yacc.c  */
#line 104 "./bisonsyntax.y"
    {printf("S->Cexpr \n");}
    break;

  case 8:
/* Line 1792 of yacc.c  */
#line 105 "./bisonsyntax.y"
    {printf("S->{P}\n");}
    break;

  case 9:
/* Line 1792 of yacc.c  */
#line 106 "./bisonsyntax.y"
    {printf("S->RETURN LVALUE;\n");}
    break;

  case 10:
/* Line 1792 of yacc.c  */
#line 107 "./bisonsyntax.y"
    {printf("S->RETURN;\n");}
    break;

  case 11:
/* Line 1792 of yacc.c  */
#line 108 "./bisonsyntax.y"
    {printf("S->null\n");}
    break;

  case 12:
/* Line 1792 of yacc.c  */
#line 110 "./bisonsyntax.y"
    {printf("expr->DECLARE\n");}
    break;

  case 13:
/* Line 1792 of yacc.c  */
#line 111 "./bisonsyntax.y"
    {printf("expr->C\n");}
    break;

  case 14:
/* Line 1792 of yacc.c  */
#line 112 "./bisonsyntax.y"
    {printf("expr->E\n");}
    break;

  case 15:
/* Line 1792 of yacc.c  */
#line 113 "./bisonsyntax.y"
    {printf("expr->LVALUE\n");}
    break;

  case 16:
/* Line 1792 of yacc.c  */
#line 114 "./bisonsyntax.y"
    {printf("expr->null\n");}
    break;

  case 17:
/* Line 1792 of yacc.c  */
#line 116 "./bisonsyntax.y"
    {
						printf("DECLARE->TYPE LVALUE\n");
					}
    break;

  case 18:
/* Line 1792 of yacc.c  */
#line 119 "./bisonsyntax.y"
    {
						printf("DECLARE->TYPE LVALUE,DECLARE\n");
					}
    break;

  case 19:
/* Line 1792 of yacc.c  */
#line 122 "./bisonsyntax.y"
    {
						printf("DECLARE->ARRAYDECLARE\n");
					}
    break;

  case 20:
/* Line 1792 of yacc.c  */
#line 125 "./bisonsyntax.y"
    {
						printf("DECLARE->ARRAYDECLARE,DECLARE\n");
					}
    break;

  case 21:
/* Line 1792 of yacc.c  */
#line 129 "./bisonsyntax.y"
    {
							printf("DECLARE->TYPE[ARRSIZE]DEFINITE_ARRAYSIZE LVALUE\n");
							//need to backfill
							//backfill("TYPE",$1)
						}
    break;

  case 22:
/* Line 1792 of yacc.c  */
#line 134 "./bisonsyntax.y"
    {
							printf("DECLARE->TYPE[]DEFINITE_ARRAYSIZE LVALUE = E\n");
							//need to backfill
							//backfill("TYPE",$1)
							//gen("declare "+id+"address");length and size
							//assignment
							//int value=typetoarray[$1];
							//char *name,*nextval;
							int state=0,isthefirst=1;
							//for i in $5->code->codelength
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
							}
							else{
							}
						}
    break;

  case 23:
/* Line 1792 of yacc.c  */
#line 166 "./bisonsyntax.y"
    {
						printf("DECLARE->TYPE[]DEFINITE_ARRAYSIZE LVALUE\n");
						//need to backfill
						//backfill("TYPE",$1)
						//gen("declare "+id+"address");length and size
						
						}
    break;

  case 24:
/* Line 1792 of yacc.c  */
#line 174 "./bisonsyntax.y"
    {
								printf("DEFINITE_ARRAYSIZE->[ARRSIZE]	DEFINITE_ARRAYSIZE\n");
								}
    break;

  case 25:
/* Line 1792 of yacc.c  */
#line 177 "./bisonsyntax.y"
    {printf("DEFINITE_ARRAYSIZE->null\n");}
    break;

  case 26:
/* Line 1792 of yacc.c  */
#line 179 "./bisonsyntax.y"
    {
					printf("LVALUE->ID:%s\n",(yyvsp[(1) - (1)].stringtype));
					//may use by declare or usage
					(yyval.Vn)=formVn(0,1,"",(yyvsp[(1) - (1)].stringtype),0,0);
					}
    break;

  case 27:
/* Line 1792 of yacc.c  */
#line 184 "./bisonsyntax.y"
    {
					printf("LVALUE->&ID\n");
					//may use by declare or usage
					(yyval.Vn)=formVn(0,2,(yyvsp[(2) - (2)].stringtype),"",0,0);
					}
    break;

  case 28:
/* Line 1792 of yacc.c  */
#line 189 "./bisonsyntax.y"
    {
					// NOT DECLARE, IT MUST BE USAGE OF ARRAY
					printf("LVALUE->ID[ARRSIZE]\n");
					char* offset;
					char name[100];
					char buff[255];
					int expect_type[5]={2,3,6,7,9};
					(yyval.Vn)=useage_of_id((yyvsp[(1) - (4)].stringtype),expect_type,(yylsp[(1) - (4)]).first_line, (yylsp[(1) - (4)]).first_column,
						(yylsp[(1) - (4)]).last_line, (yylsp[(1) - (4)]).last_column);
					
					if(!(yyval.Vn)->addr){return;}
					else{
						
						sprintf(name,"%s",((yyval.Vn)->addr)->name);
						(yyval.Vn)->addr=newtemp();
						sprintf(buff,"%s:=%s",((yyval.Vn)->addr)->name,name);
						printf("gen:	%s\n",buff);
						//gen(buff);
					}
					if((yyvsp[(3) - (4)].Vn)->addr==0)
					{
						//negative arrsize
						//just new temp
					}else{
						offset=((yyvsp[(3) - (4)].Vn)->addr)->name;
						//(offset*typesize) caculate in arrsize
						//code+: newtemp=id+offset	
						sprintf(buff,"%s:=%s+%s",(yyval.Vn)->addr,(yyval.Vn)->addr,offset);
						printf("gen:	%s\n",buff);
						//gen(buff);
					}
					
					}
    break;

  case 29:
/* Line 1792 of yacc.c  */
#line 222 "./bisonsyntax.y"
    {
					printf("LVALUE->ID(expr)\n");
					}
    break;

  case 30:
/* Line 1792 of yacc.c  */
#line 225 "./bisonsyntax.y"
    {
					printf("LVALUE->ID(expr){P}\n");
					}
    break;

  case 31:
/* Line 1792 of yacc.c  */
#line 228 "./bisonsyntax.y"
    {
					printf("LVALUE->LVALUE=LVALUE\n");
					
					}
    break;

  case 32:
/* Line 1792 of yacc.c  */
#line 232 "./bisonsyntax.y"
    {
					printf("LVALUE->LVALUE=E\n");
					//newtemp=$3.addr.name; (E)
					//code $1.addr.name=newtemp
					//code $$.addr.name=$1.addr.name
					}
    break;

  case 33:
/* Line 1792 of yacc.c  */
#line 238 "./bisonsyntax.y"
    {
					printf("LVALUE->LVALUE,LVALUE\n");
					//may from normal, or array
					//if(!$1.addr)
					//$1.addr.name=$3.addr.name;
					//$$.addr.name=$1.addr.name
					}
    break;

  case 34:
/* Line 1792 of yacc.c  */
#line 246 "./bisonsyntax.y"
    {printf("TYPE->VOID\n");(yyval.itype)=8;}
    break;

  case 35:
/* Line 1792 of yacc.c  */
#line 247 "./bisonsyntax.y"
    {printf("TYPE->INT\n");(yyval.itype)=0;}
    break;

  case 36:
/* Line 1792 of yacc.c  */
#line 248 "./bisonsyntax.y"
    {printf("TYPE->FLOAT\n");(yyval.itype)=1;}
    break;

  case 37:
/* Line 1792 of yacc.c  */
#line 249 "./bisonsyntax.y"
    {printf("TYPE->CHAR\n");(yyval.itype)=4;}
    break;

  case 38:
/* Line 1792 of yacc.c  */
#line 250 "./bisonsyntax.y"
    {printf("TYPE->STRING\n");(yyval.itype)=5;}
    break;

  case 39:
/* Line 1792 of yacc.c  */
#line 252 "./bisonsyntax.y"
    {
							printf("ARRSIZE->ID:%s\n",(yyvsp[(1) - (1)].stringtype));
							int expect_type[1]={0};
							(yyval.Vn)=useage_of_id((yyvsp[(1) - (1)].stringtype),expect_type,(yylsp[(1) - (1)]).first_line, (yylsp[(1) - (1)]).first_column,
								   (yylsp[(1) - (1)]).last_line, (yylsp[(1) - (1)]).last_column);
							char name[100];
							char buff[255];
							if(!(yyval.Vn)->addr)return;
							sprintf(name,"%s",((yyval.Vn)->addr)->name);
							(yyval.Vn)->addr=newtemp();
							sprintf(buff,"%s:=%s * %d",((yyval.Vn)->addr)->name,name,type_size_map[0]);
							printf("gen:	%s\n",buff);
							//gen(buff);
							//arrsize.addr=newtemp;gen(arrsize.addr = name*typesize);	   
							
						}
    break;

  case 40:
/* Line 1792 of yacc.c  */
#line 268 "./bisonsyntax.y"
    {
						printf("ARRSIZE->INTNUM\n");
						}
    break;

  case 41:
/* Line 1792 of yacc.c  */
#line 277 "./bisonsyntax.y"
    {printf("Cexpr->if C then S else S\n");}
    break;

  case 42:
/* Line 1792 of yacc.c  */
#line 278 "./bisonsyntax.y"
    {printf("Cexpr->if C then S\n");}
    break;

  case 43:
/* Line 1792 of yacc.c  */
#line 279 "./bisonsyntax.y"
    {printf("Cexpr->while C do S\n");}
    break;

  case 44:
/* Line 1792 of yacc.c  */
#line 280 "./bisonsyntax.y"
    {
				printf("Cexpr->for(expr;expr;expr)S\n");
				}
    break;

  case 45:
/* Line 1792 of yacc.c  */
#line 283 "./bisonsyntax.y"
    {
					printf("Cexpr->DO S WHILE (IC)\n");
				}
    break;

  case 46:
/* Line 1792 of yacc.c  */
#line 286 "./bisonsyntax.y"
    {
					printf("Cexpr->SWITCH	expr {SWITCH_CASE}\n");
				}
    break;

  case 47:
/* Line 1792 of yacc.c  */
#line 289 "./bisonsyntax.y"
    {printf("Cexpr->BREAK;\n");}
    break;

  case 48:
/* Line 1792 of yacc.c  */
#line 290 "./bisonsyntax.y"
    {printf("Cexpr->CONTINUE;\n");}
    break;

  case 49:
/* Line 1792 of yacc.c  */
#line 292 "./bisonsyntax.y"
    {
					printf("SWITCH_CASE->CASE expr:S BREAK;SWITCH_CASE\n");
				}
    break;

  case 50:
/* Line 1792 of yacc.c  */
#line 295 "./bisonsyntax.y"
    {printf("SWITCH_CASE->null\n");}
    break;

  case 51:
/* Line 1792 of yacc.c  */
#line 299 "./bisonsyntax.y"
    {printf("C->(IC)\n");}
    break;

  case 52:
/* Line 1792 of yacc.c  */
#line 300 "./bisonsyntax.y"
    {printf("C->IC\n");}
    break;

  case 53:
/* Line 1792 of yacc.c  */
#line 302 "./bisonsyntax.y"
    {printf("IC->E == E\n");}
    break;

  case 54:
/* Line 1792 of yacc.c  */
#line 303 "./bisonsyntax.y"
    {printf("IC->E < E\n");}
    break;

  case 55:
/* Line 1792 of yacc.c  */
#line 304 "./bisonsyntax.y"
    {printf("IC->E > E\n");}
    break;

  case 56:
/* Line 1792 of yacc.c  */
#line 305 "./bisonsyntax.y"
    {printf("IC->E != E\n");}
    break;

  case 57:
/* Line 1792 of yacc.c  */
#line 306 "./bisonsyntax.y"
    {printf("IC->E <= E\n");}
    break;

  case 58:
/* Line 1792 of yacc.c  */
#line 307 "./bisonsyntax.y"
    {printf("IC->E >= E\n");}
    break;

  case 59:
/* Line 1792 of yacc.c  */
#line 308 "./bisonsyntax.y"
    {printf("IC->TRUE\n");}
    break;

  case 60:
/* Line 1792 of yacc.c  */
#line 309 "./bisonsyntax.y"
    {printf("IC->FALSE\n");}
    break;

  case 61:
/* Line 1792 of yacc.c  */
#line 311 "./bisonsyntax.y"
    {printf("E->E+E\n");}
    break;

  case 62:
/* Line 1792 of yacc.c  */
#line 312 "./bisonsyntax.y"
    {printf("E->E-E\n");}
    break;

  case 63:
/* Line 1792 of yacc.c  */
#line 313 "./bisonsyntax.y"
    {printf("E->E*E\n");}
    break;

  case 64:
/* Line 1792 of yacc.c  */
#line 314 "./bisonsyntax.y"
    {printf("E->E/E\n");}
    break;

  case 65:
/* Line 1792 of yacc.c  */
#line 315 "./bisonsyntax.y"
    {printf("E->-E\n");}
    break;

  case 66:
/* Line 1792 of yacc.c  */
#line 316 "./bisonsyntax.y"
    {printf("E->(E)\n");}
    break;

  case 67:
/* Line 1792 of yacc.c  */
#line 317 "./bisonsyntax.y"
    {
					printf("E->F\n");
					(yyval.Vn)=(yyvsp[(1) - (1)].Vn);
					show_Vn((yyval.Vn));
				}
    break;

  case 68:
/* Line 1792 of yacc.c  */
#line 322 "./bisonsyntax.y"
    {
					printf("E->E,E\n");
					printf("$1E:\n");
					show_Vn((yyvsp[(1) - (3)].Vn));
					printf("$3E:\n");
					show_Vn((yyvsp[(3) - (3)].Vn));
					(yyval.Vn)=formVn(formIdAddr("",-1,0,0,0),((yyvsp[(1) - (3)].Vn)->code)->def,((yyvsp[(1) - (3)].Vn)->code)->key,((yyvsp[(1) - (3)].Vn)->code)->val,(yyvsp[(3) - (3)].Vn)->code,0);
					printf("$$E:\n");
					show_Vn((yyval.Vn));
				}
    break;

  case 69:
/* Line 1792 of yacc.c  */
#line 332 "./bisonsyntax.y"
    {
					printf("E->{E}\n");
					(yyval.Vn)=formVn(formIdAddr("",-1,0,0,0),1,"","",0,(yyvsp[(2) - (3)].Vn)->code);
					printf("$$E:\n");
					show_Vn((yyval.Vn));
				}
    break;

  case 70:
/* Line 1792 of yacc.c  */
#line 340 "./bisonsyntax.y"
    {
				printf("F->LVALUE\n");
				(yyval.Vn)=(yyvsp[(1) - (1)].Vn);
				show_Vn((yyval.Vn));
			}
    break;

  case 71:
/* Line 1792 of yacc.c  */
#line 345 "./bisonsyntax.y"
    {
				printf("F->INTNUM:%d\n",(yyvsp[(1) - (1)].itype));
				char *tmp=(char*)malloc(sizeof(char *)*255);
				sprintf(tmp,"%d",(yyvsp[(1) - (1)].itype));
				(yyval.Vn)=formVn(formIdAddr("",0,0,0,0),1,"",tmp,0,0);
				show_Vn((yyval.Vn));
			}
    break;

  case 72:
/* Line 1792 of yacc.c  */
#line 352 "./bisonsyntax.y"
    {
				printf("F->FLOATNUM:%f\n",(yyvsp[(1) - (1)].ftype));
				char *tmp=(char*)malloc(sizeof(char *)*255);
				sprintf(tmp,"%f",(yyvsp[(1) - (1)].ftype));
				(yyval.Vn)=formVn(formIdAddr("",1,0,0,0),1,"",tmp,0,0);
				show_Vn((yyval.Vn));
			}
    break;

  case 73:
/* Line 1792 of yacc.c  */
#line 359 "./bisonsyntax.y"
    {
				
				char *tmp=(char*)malloc(sizeof(char *)*255);
				sprintf(tmp,"%c",(yyvsp[(1) - (1)].stringtype)[1]);
				(yyval.Vn)=formVn(formIdAddr("",4,0,0,0),1,"",tmp,0,0);
				printf("F->CONSTCHAR:%s\n",tmp);
				show_Vn((yyval.Vn));
			}
    break;

  case 74:
/* Line 1792 of yacc.c  */
#line 367 "./bisonsyntax.y"
    {
				
				int j=strlen((yyvsp[(1) - (1)].stringtype));
				char *tempstr=strdup((yyvsp[(1) - (1)].stringtype));
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
				(yyval.Vn)=formVn(formIdAddr("",5,0,0,0),1,"",tmp,0,0);
				printf("F->CONSTSTRING:%s\n",tmp);
				show_Vn((yyval.Vn));
			}
    break;

  case 75:
/* Line 1792 of yacc.c  */
#line 386 "./bisonsyntax.y"
    {
					(yyval.itype)=_my_atoi((yyvsp[(1) - (1)].stringtype),10);
					}
    break;

  case 76:
/* Line 1792 of yacc.c  */
#line 389 "./bisonsyntax.y"
    {
					(yyval.itype)=_my_atoi((yyvsp[(1) - (1)].stringtype),16);
				}
    break;

  case 77:
/* Line 1792 of yacc.c  */
#line 392 "./bisonsyntax.y"
    {
					(yyval.itype)=_my_atoi((yyvsp[(1) - (1)].stringtype),8);
				}
    break;

  case 78:
/* Line 1792 of yacc.c  */
#line 395 "./bisonsyntax.y"
    {
					printf("INTNUM->(int)E\n");
				}
    break;

  case 79:
/* Line 1792 of yacc.c  */
#line 398 "./bisonsyntax.y"
    {
					printf("INTNUM->int(E)\n");
				}
    break;

  case 80:
/* Line 1792 of yacc.c  */
#line 402 "./bisonsyntax.y"
    {
					(yyval.ftype)=_my_atof((yyvsp[(1) - (1)].stringtype),10);
					}
    break;

  case 81:
/* Line 1792 of yacc.c  */
#line 405 "./bisonsyntax.y"
    {
					(yyval.ftype)=_my_atof((yyvsp[(1) - (1)].stringtype),8);
					}
    break;

  case 82:
/* Line 1792 of yacc.c  */
#line 408 "./bisonsyntax.y"
    {
					(yyval.ftype)=_my_atof((yyvsp[(1) - (1)].stringtype),16);
					}
    break;

  case 83:
/* Line 1792 of yacc.c  */
#line 411 "./bisonsyntax.y"
    {
					printf("FLOATNUM->(float)E\n");
					}
    break;

  case 84:
/* Line 1792 of yacc.c  */
#line 414 "./bisonsyntax.y"
    {
					printf("FLOATNUM->float(E)\n");
					}
    break;


/* Line 1792 of yacc.c  */
#line 2482 "bisonsyntax.tab.c"
      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;
  *++yylsp = yyloc;

  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }

  yyerror_range[1] = yylloc;

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval, &yylloc);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  yyerror_range[1] = yylsp[1-yylen];
  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;

      yyerror_range[1] = *yylsp;
      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp, yylsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  yyerror_range[2] = yylloc;
  /* Using YYLLOC is tempting, but would change the location of
     the lookahead.  YYLOC is available though.  */
  YYLLOC_DEFAULT (yyloc, yyerror_range, 2);
  *++yylsp = yyloc;

  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval, &yylloc);
    }
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp, yylsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}


/* Line 2055 of yacc.c  */
#line 419 "./bisonsyntax.y"

void yyerror (char const *s) {
   fprintf (stderr, "%s\n", s);
 }