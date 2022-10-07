@
@       Ejercicio 1.6
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

@---------------
@ Code Section
@---------------

@El main
        @Con el mov mueve los siguientes valores a las siguientes variables
        @El valor que se mueve al r2 es  240
main :  mov r2, # 0b11110000    /* r2 <- 11110000 */
        @El valor de r3 es 170
        mov r3, # 0b10101010    /* r3 <- 10101010 */
        @La operacion and se utiliza para crear un nuevo valor del r2 y r3
        @Se crea mediante un proceso booleano
        @El valor de r0 en este caso queda 1010 0000 en binario
        and r0, r2, r3          /* r0 <- r2 AND r3 */
        orr r1, r2, r3          /* r1 <- r2 OR r3 */
        @Se aplica la operacion not y se mueve al operando r4
        mvn r4, r0              /* r4 <- NOT r0 */
        mov r0, # 0x80000000
        @Aqui se utiliza la operacion tst que en realidad es un and
        @El resultado es temporal y no borra el valor original
        tst r0, # 0x80000000
        tst r0, # 0x40000000
        bx lr

@ Resultados

@ r0
@ binario: 1010 0000
@ hexa: a0

@ ~r0
@ binario: 0101 1111
@ hexa: 5f
