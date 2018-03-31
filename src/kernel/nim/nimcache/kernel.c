/* Generated by Nim Compiler v0.18.0 */
/*   (c) 2018 Andreas Rumpf */
/* The generated code is subject to the original license. */
/* Compiled for: Standalone, i386, gcc */
/* Command for C compiler:
   ./cross/bin/i586-elf-gcc -c -w -w -nostdlib -ffreestanding -O2 -Wall -Wextra -O3 -fno-strict-aliasing  -I/usr/local/Cellar/nim/0.18.0/nim/lib -o /Users/pascalmouret/workspace/nimOS/src/kernel/nim/nimcache/kernel.o /Users/pascalmouret/workspace/nimOS/src/kernel/nim/nimcache/kernel.c */
#define NIM_NEW_MANGLING_RULES
#define NIM_INTBITS 32

#include "nimbase.h"
#undef LANGUAGE_C
#undef MIPSEB
#undef MIPSEL
#undef PPC
#undef R3000
#undef R4000
#undef i386
#undef linux
#undef mips
#undef near
#undef powerpc
#undef unix
typedef struct NimStringDesc NimStringDesc;
typedef struct TGenericSeq TGenericSeq;
struct TGenericSeq {
NI len;
NI reserved;
};
struct NimStringDesc {
  TGenericSeq Sup;
NIM_CHAR data[SEQ_DECL_SIZE];
};
N_NIMCALL(void, kernel_main)(void);
N_LIB_PRIVATE N_NIMCALL(void, clearScreen_rGek5AvgCTnYs2VhhKFXLQ)(void);
N_LIB_PRIVATE N_NIMCALL(NU16, vgaEntry_jr9boQRH2OlUsRxz3wur9cag)(NIM_CHAR c, NU8 color);
N_LIB_PRIVATE N_NIMCALL(void, println_9ak9aJ5XvKlHp5D9bhub7HyVQ)(NimStringDesc* s);
N_LIB_PRIVATE N_NIMCALL(void, print_1B9bgUXvA6e89b9akDlkqc64Q)(NIM_CHAR c);
N_LIB_PRIVATE N_NIMCALL(void, scroll_rGek5AvgCTnYs2VhhKFXLQ_2)(void);
NI currentRow_5j5DaeewZTQWVZmO9clEaiA;
NI currentCol_zytghgoW4MxkVjJyT8ynKw;
STRING_LITERAL(TM_7rAdWGds0BYXXf60ejgZcA_2, "Hello, NIM Kernel!", 18);
STRING_LITERAL(TM_7rAdWGds0BYXXf60ejgZcA_3, "version 0.0.0.0.0.1", 19);

N_LIB_PRIVATE N_NIMCALL(NU16, vgaEntry_jr9boQRH2OlUsRxz3wur9cag)(NIM_CHAR c, NU8 color) {
	NU16 result;
{	result = (NU16)0;
	result = ((NU16) ((NU16)(((NU16) (((NU8)(c)))) | (NU16)((NU32)(((NU16) (color))) << (NU32)(((NI) 8))))));
	goto BeforeRet_;
	}BeforeRet_: ;
	return result;
}

N_LIB_PRIVATE N_NIMCALL(void, clearScreen_rGek5AvgCTnYs2VhhKFXLQ)(void) {
	NI i;
	i = ((NI) 0);
	{
		while (1) {
			if (!(i < ((NI) 2000))) goto LA2;
			((NU16*) 753664)[(i)- 0] = vgaEntry_jr9boQRH2OlUsRxz3wur9cag(32, ((NU8) 15));
			i += ((NI) 1);
		} LA2: ;
	}
}

N_LIB_PRIVATE N_NIMCALL(void, print_1B9bgUXvA6e89b9akDlkqc64Q)(NIM_CHAR c) {
	{
		if (!!(((NU8)(c) == (NU8)(10)))) goto LA3_;
		((NU16*) 753664)[((NI)((NI)(((NI) 80) * currentRow_5j5DaeewZTQWVZmO9clEaiA) + currentCol_zytghgoW4MxkVjJyT8ynKw))- 0] = vgaEntry_jr9boQRH2OlUsRxz3wur9cag(c, ((NU8) 15));
		currentCol_zytghgoW4MxkVjJyT8ynKw += ((NI) 1);
	}
	LA3_: ;
	{
		NIM_BOOL T7_;
		T7_ = (NIM_BOOL)0;
		T7_ = (((NI) 80) <= currentCol_zytghgoW4MxkVjJyT8ynKw);
		if (T7_) goto LA8_;
		T7_ = ((NU8)(c) == (NU8)(10));
		LA8_: ;
		if (!T7_) goto LA9_;
		currentRow_5j5DaeewZTQWVZmO9clEaiA += ((NI) 1);
		currentCol_zytghgoW4MxkVjJyT8ynKw = ((NI) 0);
	}
	LA9_: ;
}

N_LIB_PRIVATE N_NIMCALL(void, println_9ak9aJ5XvKlHp5D9bhub7HyVQ)(NimStringDesc* s) {
	{
		NI c;
		NI colontmp_;
		NI res;
		c = (NI)0;
		colontmp_ = (NI)0;
		colontmp_ = (NI)((s ? s->Sup.len : 0) - ((NI) 1));
		res = ((NI) 0);
		{
			while (1) {
				if (!(res <= colontmp_)) goto LA3;
				c = res;
				print_1B9bgUXvA6e89b9akDlkqc64Q(s->data[c]);
				res += ((NI) 1);
			} LA3: ;
		}
	}
	print_1B9bgUXvA6e89b9akDlkqc64Q(10);
}

N_LIB_PRIVATE N_NIMCALL(void, scroll_rGek5AvgCTnYs2VhhKFXLQ_2)(void) {
	{
		NI i;
		NI res;
		i = (NI)0;
		res = ((NI) 0);
		{
			while (1) {
				if (!(res <= ((NI) 1919))) goto LA3;
				i = res;
				((NU16*) 753664)[(i)- 0] = ((NU16*) 753664)[((NI)(i + ((NI) 80)))- 0];
				res += ((NI) 1);
			} LA3: ;
		}
	}
	{
		NI i_2;
		NI res_2;
		i_2 = (NI)0;
		res_2 = ((NI) 1919);
		{
			while (1) {
				if (!(res_2 <= ((NI) 1999))) goto LA6;
				i_2 = res_2;
				((NU16*) 753664)[(i_2)- 0] = vgaEntry_jr9boQRH2OlUsRxz3wur9cag(32, ((NU8) 15));
				res_2 += ((NI) 1);
			} LA6: ;
		}
	}
}

N_NIMCALL(void, kernel_main)(void) {
	clearScreen_rGek5AvgCTnYs2VhhKFXLQ();
	println_9ak9aJ5XvKlHp5D9bhub7HyVQ(((NimStringDesc*) &TM_7rAdWGds0BYXXf60ejgZcA_2));
	println_9ak9aJ5XvKlHp5D9bhub7HyVQ(((NimStringDesc*) &TM_7rAdWGds0BYXXf60ejgZcA_3));
	scroll_rGek5AvgCTnYs2VhhKFXLQ_2();
}
NIM_EXTERNC N_NOINLINE(void, unknown_kernelInit000)(void) {
	currentRow_5j5DaeewZTQWVZmO9clEaiA = ((NI) 0);
	currentCol_zytghgoW4MxkVjJyT8ynKw = ((NI) 0);
}

NIM_EXTERNC N_NOINLINE(void, unknown_kernelDatInit000)(void) {
}

