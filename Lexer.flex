package prueba.lexico;
import static prueba.lexico.Token.*;
%%
%class Lexemas
%type Token


Blancos = [ \t\r\n]

%{
public String lexema;
%}

/*Segunda parte del analizador lexico*/

Nombre = (({Mayuscula}{Minuscula}*{Punto}?) |
          ({Mayuscula}{Minuscula}*{MinusculaAcentuada}?{Minuscula}*{Punto}?) |
          ({MayusculaAcentuada}{Minuscula}+{Punto}?){Espacio}?)

Direccion = ({Mayuscula}{Minuscula}*{Punto}?{Espacio}?|
             {Minuscula}+{Espacio}|
             {MayusculaAcentuada}{Minuscula}+{Espacio}|
             {Mayuscula}{Minuscula}*{MinusculaAcentuada}?{Minuscula}*{Espacio})+
             {Gato}{Espacio}?{DigitoSinCero}{Digito}*({Espacio}?{Guion}{Espacio}?{Mayuscula})?

Curp = ({Mayuscula}{4}{Digito}{6}{Mayuscula}{5}{Digito}{2})?

Nacimiento = (({Digito}{DigitoSinCero}|{DigitoSinCero}{Digito}){Diagonal}({Mes}|[0]?{DigitoSinCero}|[1][0-2]){Diagonal}[1-2]{Digito}{3})

Celular = {Digito}{3} (\-) {Digito}{3} (\-) {Digito}{2} (\-) {Digito}{2} 

Correo = ({Mayuscula}|{Minuscula}|{Digito})+({Guion}? ({Mayuscula}| 
          {Minuscula}|{Digito}))* {Arroba} {Dominio} {Punto} {Minuscula}+

Carrera = ({Mayuscula}?{Minuscula}+{Espacio}{Minuscula}{2}{Espacio}{Ingenieria}{Minuscula}*)

Ingenieria = (Sistemas|Gestion|TICS|Electromecanica|Industrial|Logistica)
Mes = (Enero|Febrero|Marzo|Abril|Mayo|Junio|Julio|Agosto|Septiembre|Octubre|Noviembre|Diciembre)
Mayuscula = [A-ZÑ]
Minuscula = [a-zñ]
MayusculaAcentuada = [A-U]
MinusculaAcentuada = [a-u]
Dominio = (hotmail|gmail|yahoo)
Digito = [0-9]
Guion=(\-)
Arroba = (\@)
Gato = (\#)
Punto = (\.)
Diagonal = (\/)
DigitoSinCero = [1-9]
Espacio = [ ]
Blancos = [ \t\r\n]

%%

/*Tercera parte del analizador lexico*/
[Blancos]                                {/*Ignorar*/}

{Nombre}                                {lexema=yytext(); return Nombre;}
{Direccion}                             {lexema=yytext(); return Direccion;}
{Correo}                                {lexema=yytext(); return Correo;}
{Celular}                               {lexema=yytext(); return Celular;}
{Curp}					{lexema=yytext(); return Curp;}
{Nacimiento}				{lexema=yytext(); return Nacimiento;}
{Carrera}                               {lexema=yytext(); return Carrera;}
.                                       {lexema=yytext(); return Error;}