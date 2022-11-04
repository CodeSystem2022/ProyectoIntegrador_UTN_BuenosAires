




Proceso Principal
	//Se definen dos matrices para trabajar con nros y texto (Codigo del producto)
	Definir matrizProductos Como Caracter; //matrizProductos para texto  ---> Codigo // Descripcion del articulo
	Definir matrizPySProductos Como Real; //matrizPySProductos para numeros ---> Codigo // Nada // Precio // Stock
	Dimension matrizProductos[99,99];
	Dimension matrizPYSProductos[99,99];
	
	//Antes del menu, se inicializa la funcion cargarDatos, para obtener los valores iniciales necesarios para que no falle el programa
	cargarDatos(matrizProductos,matrizPySProductos); // Argumentos
	Limpiar Pantalla;
	menu(matrizProductos,matrizPySProductos); // Argumentos ((fue la unica forma que encontre de q el menu interactue con las matrices))
	Escribir "";
FinProceso





SubProceso menu(matrizProductos,matrizPySProductos) // Parámetros
 	Definir opcion como entero;
	Repetir
		Escribir "MENU";
		Escribir "1. Listar productos en stock";
		Escribir "2. No hace nada";
		Escribir "9. Salir";
		Escribir sin saltar "Digite una opción: ";
		Leer opcion;
		Escribir "";
		Segun opcion Hacer
			1:
				mostrarDatos(matrizProductos,matrizPySProductos); // Argumentos
			2:
				Limpiar Pantalla;
				Escribir "";
				Escribir "No hace nada... ";
				Escribir "";
			9: 
				Limpiar Pantalla;
				Escribir "";
				Escribir "Gracias por testear este proyecto en PSEint";
				Escribir "Realizado por los siguientes alumnos:";
				Escribir "Aca vamos nosotros";
				Escribir "Aca vamos nosotros";
				Escribir "Aca vamos nosotros";
				Escribir "Aca vamos nosotros";
				Escribir "Para la UTN Facultad Regional San Rafael";
			De Otro Modo:
			Limpiar Pantalla;
			Escribir "";
				Escribir " ( ",opcion," ) No es una opción valida, por favor seleccione otro debajo.";
		FinSegun
		Escribir "";
	Hasta Que opcion = 9
FinSubProceso

















//Funcion para la carga de datos del stock
Funcion cargarDatos(palabras,nros Por Referencia) // Parámetros
	Definir i,j Como Entero; // Contadores
	Escribir "Por favor ingrese los datos de los productos en stock, para este ejercicio solo 3 son necesarios.";
	Escribir "";
	
	//Ciclo para completar la base de datos de producto
	Para j<-0 Hasta 2 Con Paso 1 Hacer
		Para i<-0 Hasta 3 Con Paso 1 Hacer
			Segun i Hacer
				0:
					Escribir Sin Saltar "Ingrese código del nuevo producto:";
					Leer nros[i,j];
					palabras[i,j] <- ConvertirATexto(nros[i,j]);
				1:
					Escribir Sin Saltar "Ingrese descripción:"; 
					Leer palabras[i,j];
				2:
					Escribir Sin Saltar "Ingrese precio:";
					leer nros[i,j];
				3: 
					Escribir Sin Saltar "Ingrese stock disponible:";
					leer nros[i,j];
			FinSegun
		FinPara
		Escribir "";
	FinPara
FinFuncion















//Funcion para mostrar datos del stock de productos
Funcion mostrarDatos(palabras,nros) // Parámetros
	Definir i,j Como Entero; // Contadores
	Limpiar Pantalla;
	Escribir "Listado de productos y su disponibilidad: ";
	Para j<-0 Hasta 2 Con Paso 1 Hacer
		Escribir "";
		Para i<-0 Hasta 3 Con Paso 1 Hacer
			Segun i Hacer
				0:
					Escribir Sin Saltar "(", nros[i,j],") #";
				1:
					Escribir Sin Saltar palabras[i,j];
				2:
					Escribir Sin Saltar "   °   Precio: $",nros[i,j];
				3: 
					Escribir Sin Saltar "  °   Stock disponible: ",nros[i,j];
			FinSegun
		FinPara
	FinPara
	Escribir "";
	
FinFuncion

