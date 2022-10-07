@
@       Ejercicio 1.7
@
@       Author: Ricardo-Valadez
@       Date: 6/4/22
@
@       Codigo en lenguaje de alto nivel (c++)
@
@       #include iostream
@       using namespace std;
@
@       int main()
@
@       Variables que vamos a utilizar
@       int r3=240,r2=170,r0,r1,r4;
@
@       El valor que arroja aqui es la operacion and
@       int r0 = r3 && r2;
@       cout << (r3 && r2) << endl
@       El valor de la siguiente operacion es utilizando or
@       int r1 = r3 || r2
@       cout << (r3 || r2) << endl
@       Se hace la operacion not y se asigna a r4
@       int r4= ~r0
@
@       Representacion de los tst
@       r0  = 0x80000000
@       tst1 = r0 || r0
@
@       tst = r0 || 0x40000000
@
@       }

@---------------
@ Data Section
@---------------

.text
.global main

@--------------
@ Code Section
@--------------

        @Aqui se utiliza la operacion tst que en realidad es un and
        @El resultado es temporal y no borra el valor original
main   	mov r0, # 0x80000000
	tst r0, # 0x80000000
        tst r0, # 0x40000000
        bx lr

@Resultados

@ nzcv
@ a: 1010
@ 4: 0100
@tst r0, # 0x80000000 Z: 0
@tst r0, # 0x40000000 Z: 1
