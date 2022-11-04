




Proceso Principal
	//Se definen dos matrices para trabajar con nros y texto (Codigo del producto)
	Definir matrizProductos Como Caracter; //matrizProductos para texto  ---> Codigo // Descripcion del articulo
	Definir matrizVendedor Como Caracter; //matrizVendedor para texto ---> Codigo // Nombre vendedor
	Definir matrizPySProductos Como Real; //matrizPySProductos para numeros ---> Codigo // Nada // Precio // Stock
	Definir matrizNrosVendedor Como Real; //matrizNrosVendedor para numeros ---> Codigo // Nada // Comision
	Definir cantVend,cantProd Como Entero;
	Dimension matrizProductos[99,99];
	Dimension matrizPYSProductos[99,99];
	Dimension matrizVendedor[99,99];
	Dimension matrizNrosVendedor[99,99];
	
	//Antes del menu, se inicializa la funcion cargarDatos, para obtener los valores iniciales necesarios para que no falle el programa
	cargarDatos(matrizProductos,matrizPySProductos); // Argumentos
	cantProd <- 3;
	cantVend <- 0;
	Escribir "";
	Escribir "Productos cargados!";
	Escribir "";
	Escribir "Apriete una tecla para continuar...";
	Esperar Tecla;
	Limpiar Pantalla;
	//El menu principal
	Definir opcion como entero;
	Repetir
		Escribir "     MENU PRINCIPAL @ Nombre de la tienda";
		Escribir "";
		Escribir "1. Listar productos";
		Escribir "2. Listar vendedores";
		Escribir "3. Agregar productos";
		Escribir "4. Agregar vendedores";
		Escribir "5. Generar Venta";
		Escribir "9. Salir";
		Escribir "";
		Escribir sin saltar "Digite una opción: ";
		Leer opcion;
		Escribir "";
		Segun opcion Hacer
			1:
				mostrarProductos(matrizProductos,matrizPySProductos,cantProd); // Argumentos
			2:
				mostrarVendedor(matrizVendedor,matrizNrosVendedor,cantVend); // Argumentos
			3:
				agregarProductos(matrizProductos,matrizPySProductos,cantProd); // Argumentos
			4:
				cargarVendedor(matrizVendedor,matrizNrosVendedor,cantVend); // Argumentos
			5:
				generarVenta(matrizVendedor,matrizNrosVendedor,matrizProductos,matrizPySProductos,cantVend, cantProd); // Argumentos
			6:
				Limpiar Pantalla;
				Escribir "";
				Escribir "No hace nada... ";
				Escribir "";
				Escribir "Presione una tecla para continuar..";
				Esperar Tecla;
				Limpiar Pantalla;
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
				Escribir "";
			De Otro Modo:
				Limpiar Pantalla;
				Escribir "";
				Escribir " ( ",opcion," ) No es una opción valida, por favor seleccione otro debajo.";
				Escribir "";
				Escribir "Presione una tecla para continuar..";
				Esperar Tecla;
				Limpiar Pantalla;
		FinSegun
		Escribir "";
	Hasta Que opcion = 9
	
	//	menu(matrizProductos,matrizPySProductos); // Argumentos ((fue la unica forma que encontre de q el menu interactue con las matrices))
	Escribir "";
FinProceso





//SubProceso menu(matrizProductos,matrizPySProductos) // Parámetros

//FinSubProceso

















//Funcion para la carga de datos del stock
Funcion cargarDatos(palabras,nros Por Referencia) // Parámetros
	Definir i,j Como Entero; // Contadores
	Escribir "Bienvenido al sistema de gestion de ventas, proyecto para la UTN Facultad Regional San Rafael.";
	Escribir "";
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






//Funcion para la carga de vendedores
Funcion cargarVendedor(palabras,nros,cantVend Por Referencia) // Parámetros
	Definir i,j,agrega Como Entero; // Contadores
	Limpiar Pantalla;
	Escribir "Cuantos vendedores dará de alta?";
	Leer agrega;
	Escribir "";
	
	//Ciclo para cargar vendedor
	Para j<-0 Hasta agrega-1 Con Paso 1 Hacer
		Para i<-0 Hasta 2 Con Paso 1 Hacer
			Segun i Hacer
				0:
					Escribir Sin Saltar "Ingrese código del vendedor:";
					Leer nros[i,j+cantVend];
					palabras[i,j+cantVend] <- ConvertirATexto(nros[i,j+cantVend]);
				1:
					Escribir Sin Saltar "Ingrese nombre:"; 
					Leer palabras[i,j+cantVend];
				2:
					//Comisión inicial
					nros[i,j+cantVend] <- 0;
			FinSegun
		FinPara
		Escribir "";
		
	FinPara
	cantVend <- cantVend + agrega;
	Escribir "Alta(s) finalizadas.";
	Escribir "";
	Escribir "Presione una tecla para continuar..";
	Esperar Tecla;
	Limpiar Pantalla;
FinFuncion

//Funcion para agregar productos
Funcion agregarProductos(palabras,nros,cantProd Por Referencia) // Parámetros
	Definir i,j,agrega Como Entero; // Contadores
	Limpiar Pantalla;
	Escribir "Cuantos productos nuevos ingresará al stock?";
	Leer agrega;
	Escribir "";
	
	//Ciclo para cargar producto a la matriz ya creada
	Para j<-0 Hasta agrega-1 Con Paso 1 Hacer
		Para i<-0 Hasta 3 Con Paso 1 Hacer
			Segun i Hacer
				0:
					Escribir Sin Saltar "Ingrese código del nuevo producto:";
					Leer nros[i,j+cantProd];
					palabras[i,j+cantProd] <- ConvertirATexto(nros[i,j+cantProd]);
				1:
					Escribir Sin Saltar "Ingrese descripción:"; 
					Leer palabras[i,j+cantProd];
				2:
					Escribir Sin Saltar "Ingrese precio:";
					leer nros[i,j+cantProd];
				3: 
					Escribir Sin Saltar "Ingrese stock disponible:";
					leer nros[i,j+cantProd];
			FinSegun
		FinPara
		Escribir "";
		
	FinPara
	cantProd <- cantProd + agrega;
	Escribir "Producto(s) agregados.";
	Escribir "";
	Escribir "Presione una tecla para continuar..";
	Esperar Tecla;
	Limpiar Pantalla;
FinFuncion



//Funcion para listar vendedores y comisiones
Funcion mostrarVendedor(palabras,nros,cantVend) // Parámetros
	Definir i,j Como Entero; // Contadores
	Limpiar Pantalla;
	Escribir "Listado de vendedores y su comisión: ";
	si cantVend = 0 Entonces 
		Escribir "";
		Escribir "  No existen vendedores cargados todavia..";
	SiNo
		Para j<-0 Hasta cantVend-1 Con Paso 1 Hacer
			Escribir "";
			Para i<-0 Hasta 2 Con Paso 1 Hacer
				Segun i Hacer
					0:
						Escribir Sin Saltar "(", nros[i,j],") #";
					1:
						Escribir Sin Saltar palabras[i,j];
					2:
						Escribir Sin Saltar"   °   Comisión total: $",nros[i,j];
				FinSegun
				
			FinPara
			
		FinPara
		Escribir "";
	FinSi
	
	
	Escribir "";
	Escribir "Presione una tecla para continuar..";
	Escribir "";
	
	Esperar Tecla;
	Limpiar Pantalla;
	
FinFuncion












//Funcion para mostrar datos del stock de productos
Funcion mostrarProductos(palabras,nros,cantProd) // Parámetros
	Definir i,j Como Entero; // Contadores
	Limpiar Pantalla;
	Escribir "Listado de productos y su disponibilidad: ";
	Para j<-0 Hasta cantProd-1 Con Paso 1 Hacer
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
	Escribir "";
	Escribir "Presione una tecla para continuar..";
	Esperar Tecla;
	Limpiar Pantalla;
	
FinFuncion


//Para generar ventas! 
Funcion generarVenta(matrizVendedor,matrizNrosVendedor,matrizProductos,matrizPySProductos,cantVend,cantProd) // Parámetros
	Definir i,j,opcion,opcion1,opcion2,temp Como Entero; // Contadores
	opcion2 <- 0;
	Limpiar Pantalla;
	opcion <- 1;
	Escribir "Seleccione un vendedor:";
	Para j<-0 Hasta cantVend-1 Con Paso 1 Hacer
		Para i<-0 Hasta 1 Con Paso 1 Hacer
			Segun i Hacer
				0:
					Escribir Sin Saltar opcion,"     <---     (", matrizNrosVendedor[i,j],") #";
				1:
					Escribir Sin Saltar matrizVendedor[i,j];
			FinSegun
		FinPara
		Escribir "";
		opcion <- opcion +1;
	FinPara
	Escribir "";
	Escribir "";
	leer opcion1;

	Escribir "Seleccione un producto con stock disponible para la compra:";
	Repetir
		si opcion2 <> 0 Entonces
		Limpiar Pantalla;
		Escribir "Error! No puede seleccionar un producto sin stock..";
		Escribir "Producto: ",matrizProductos[1,opcion2-1]," - Stock: ",matrizPySProductos[3,opcion2-1];		
		Escribir "Por favor elija otro:";
		Escribir "";
		FinSi
		opcion <- 1;
	
		
		Para j<-0 Hasta cantProd-1 Con Paso 1 Hacer
			Para i<-0 Hasta 3 Con Paso 1 Hacer
				Segun i Hacer
					0:
						Escribir Sin Saltar opcion,"     <---     (", matrizPySProductos[i,j],") #";
					1:
						Escribir Sin Saltar matrizProductos[i,j];
					2:
						Escribir Sin Saltar "   °   $",matrizPySProductos[i,j];
					3: 
						Escribir Sin Saltar "  °   Stock disponible: ",matrizPySProductos[i,j];
				FinSegun
			FinPara
			Escribir "";
			opcion <- opcion +1;
		FinPara
		Leer opcion2;
	Hasta Que (matrizPySProductos[3,opcion2-1] <> 0)
	Escribir "";
	//suma la comision
	matrizNrosVendedor[2,opcion1-1] <- matrizNrosVendedor[2,opcion1-1] + matrizPySProductos[2,opcion2-1] ;
	//descuenta el producto
	matrizPySProductos[3,opcion2-1] <- matrizPySProductos[3,opcion2-1] -1;
	
FinFuncion

