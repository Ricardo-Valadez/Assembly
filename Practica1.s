@
@	Ejercicio 1.3
@
@	Author: Ricardo-Valadez
@	Date: 6/4/22
@
@	Codigo en lenguaje de alto nivel (c#)
@
@	main
@
@	Variables que vamos a utilizar
@	int r1,r2,r0;
@
@	Le asignamos los valores a cada una de las variables
@	r1=50;
@	r2=192;
@
@	Realizamos la operacion y se lo agregamos al r0
@	r0=r1+r2;
@
@	En nuestro caso establecemos una linea de codigo para imprimir el valor de r0 como evidencia
@	Console.WriteLine(r0);
@

@---------------
@ Data Section
@---------------

.data

@La variable tiene 50 de valor
var1: .byte 0b00110010
      .align
@La variable tiene 192 de valor
var2: .byte 0b11000000
      .align
.text
.global main

@---------------
@ Code Section
@---------------

@El main
	@ldr se utiliza junto con ldrsb para asignale los valores de var1 al r1
main: 	ldr	r1, =var1	/*r1 <- &var1 */
	ldrsb	r1, [r1]	/*r1 <- /r1*/
	@Se hace de la misma manera para la var2 y r2
	ldr 	r2, =var2	/*r2 <- &var2*/
	ldrsb	r2, [r2]	/*r2 <- *r2*/
	@Finalmente el comando add agrega el valor de la suma de r1 y r2 a r0
	add 	r0, r1, r2	/*r0 <- r1 + r2 */
	bx 	lr

@ Resultados

@ Decimal: r0=242
@ Si interpreatamos el resultado como byte binario : 1111 0010
@ Hexa: f2
@ Si interpretamos el resultado como palabra (32 bits) binario :
@ 1111 1111 1111 1111 1111 1111 1111 0010
@ Hexa: fffffff2
@ Idem, pero si hubiesemos extendido los signos (ldrb en lugar de ldrsb): 
@ 1111 0010
@ Hexa: f2
