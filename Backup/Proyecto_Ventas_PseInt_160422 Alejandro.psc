Proceso Principal
	//Se definen cuatro matrices para trabajar con nros y texto
	Definir matrizProductos Como Caracter; //matrizProductos para texto  ---> Codigo // Descripcion del articulo
	Definir matrizVendedor Como Caracter; //matrizVendedor para texto ---> Codigo // Nombre vendedor
	Definir matrizPySProductos Como Real; //matrizPySProductos para numeros ---> Codigo // Nada // Precio // Stock
	Definir matrizNrosVendedor Como Real; //matrizNrosVendedor para numeros ---> Codigo // Nada // Comision
	//Contadores para llevar registro de cantidades globales de vendedores y productos
	Definir cantVend,cantProd Como Entero;
	Dimension matrizProductos[99,99];
	Dimension matrizPYSProductos[99,99];
	Dimension matrizVendedor[99,99];
	Dimension matrizNrosVendedor[99,99];
	//Antes del menu, se inicializa la funcion cargarDatos, para obtener los valores iniciales necesarios para que no falle el programa
	cargarDatos(matrizProductos,matrizPySProductos); // Argumentos
	//Se definenen contadores globales
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
		Escribir "     MENU PRINCIPAL @ Tienda virtual ";
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
				Escribir "No hace nada... Esta opción se utilizó para realizar las primeras pruebas.. Y la guardamos de recuerdo. ";
				Escribir "";
				Escribir "Presione una tecla para continuar..";
				Esperar Tecla;
				Limpiar Pantalla;
			9: 
				Limpiar Pantalla;
				Escribir "";
				Escribir "Gracias por testear este proyecto en PSEint";
				Escribir "Realizado por los siguientes alumnos:";
				Escribir "";
				Escribir "Fernando Barrionuevo [kaiofono@gmail.com]";
				Escribir "Maximiliano Chalin [mchalin@gmail.com]";
				Escribir "Pia olivera [piaoliveraa@gmail.com]";
				Escribir "Viviana Montenegro [vivy.montenegro@gmail.com]";
				Escribir "Lucas Lopez [lucaslopez1711@hotmail.com]";
				Escribir "Juan Arce [emuchmoney@gmail.com]";
				Escribir "Leandro Barrios [leandrobarrios027@gmail.com]";
				Escribir "Sergio Vega [sergiodariovega@gmail.com]";
				Escribir "Giuliana Ayelen Pagano Alejos [paganoayelen@gmail.com]";
				Escribir "Alejandro Algarin [alejandro.algarin@hotmail.com]";
				Escribir "";
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
	Escribir "";
FinProceso
//Funcion para la carga de datos del stock
Funcion cargarDatos(palabras,nros Por Referencia) // Parámetros
	Definir i,j Como Entero; // Contadores
	//Texto bienvenida
	Escribir "Bienvenido al sistema de gestion de ventas.";
	Escribir "Proyecto para la UTN Facultad Regional San Rafael";
	Escribir "";
	Escribir "";
	Escribir "Por favor ingrese los datos de los productos en stock,";
	Escribir "para este ejercicio solo 3 son necesarios.";
	Escribir "";
	//Ciclo para completar la base de datos de producto
	Para j<-0 Hasta 2 Con Paso 1 Hacer
		Para i<-0 Hasta 3 Con Paso 1 Hacer
			Segun i Hacer
				0:
					Escribir Sin Saltar "Ingrese código del nuevo producto:";
					nros[i,j] <- validacionNumeros;
					palabras[i,j] <- ConvertirATexto(nros[i,j]);
				1:
					Escribir Sin Saltar "Ingrese descripción:"; 
					Leer palabras[i,j];
				2:
					Escribir Sin Saltar "Ingrese el precio: ";
					nros[i,j] <- validacionNumeros;
				3: 
					Escribir Sin Saltar "Ingrese stock disponible:";
					nros[i,j] <- validacionNumeros;
			FinSegun
		FinPara
		Escribir "";
	FinPara
FinFuncion

//Funcion para validar que los datos ingresado sean numeros
SubProceso retorno <- validacionNumeros
	Definir longitudNum,contador,i,j,retorno Como Entero;
	Definir numPermitidos,num,numUnico Como Caracter;
	Dimension numPermitidos[10];
	Repetir
		leer num;
		longitudNum<-Longitud(num);
		contador <- 0;
		
		//Se almacena los numeros del 0 al 9 como caracteres, en el arreglo numPermitidos
		para i<-0 Hasta 9 hacer
			numPermitidos[i]<-ConvertirATexto(i);
		FinPara
		
		//Se verifica que cada digito ingresado corresponda a un numero 
		para i<-0 Hasta longitudNum-1 Hacer
			Para j<-0 Hasta 9 Hacer
				numUnico <- SubCadena(num,i,i);
				si numUnico = numPermitidos[j] Entonces
					contador<-contador+1;
				FinSi
			FinPara
		FinPara
		si  contador < LongitudNum Entonces
			Escribir "Los digitos ingresados no corresponden a numeros..";
		FinSi
	Hasta Que contador = longitudNum ;
	retorno<-ConvertirANumero(num);
FinSubProceso

//Funcion para la carga de vendedores
Funcion cargarVendedor(palabras,nros,cantVend Por Referencia) // Parámetros
	Definir i,j,agrega Como Entero; // Contadores
	Limpiar Pantalla;
	Escribir "Cuantos vendedores dará de alta?";
	agrega <- validacionNumeros;
	Escribir "";
	//Ciclo para cargar vendedor
	Para j<-0 Hasta agrega-1 Con Paso 1 Hacer
		Para i<-0 Hasta 2 Con Paso 1 Hacer
			Segun i Hacer
				0:
					Escribir Sin Saltar "Ingrese código del vendedor:";
					nros[i,j+cantVend] <- validacionNumeros;
					
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
	agrega <- validacionNumeros;
	Escribir "";
	//Ciclo para cargar producto a la matriz ya creada
	Para j<-0 Hasta agrega-1 Con Paso 1 Hacer
		Para i<-0 Hasta 3 Con Paso 1 Hacer
			Segun i Hacer
				0:
					Escribir Sin Saltar "Ingrese código del nuevo producto:";
					nros[i,j+cantProd] <- validacionNumeros;
					palabras[i,j+cantProd] <- ConvertirATexto(nros[i,j+cantProd]);
				1:
					Escribir Sin Saltar "Ingrese descripción:"; 
					Leer palabras[i,j+cantProd];
				2:
					Escribir Sin Saltar "Ingrese precio:";
					nros[i,j+cantProd] <- validacionNumeros;;
				3: 
					Escribir Sin Saltar "Ingrese stock disponible:";
					nros[i,j+cantProd] <- validacionNumeros;;
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
	Escribir "Listado de vendedores y su comisión (30% por compra facturada): ";
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
	//Indice para realizar busquedas en matrices
	opcion <- 1;
	//Utilizado en la parte de productos de la funcion generar ventas
	opcion2 <- 0;
	Limpiar Pantalla;
	Escribir "Seleccione un vendedor:";
	Escribir "";
	//Sino existen vendedores, selecciona un vendedor genérico sin comisión; sino, los lista
	Si cantVend = 0 Entonces
		Escribir "No existen vendedores cargados, se generará una venta sin comisionar";
		Escribir Sin Saltar "";
		// Utilizado para vendedor genérico
		opcion1 <- 99;
		Escribir "";
		Escribir "Presione una tecla para continuar..";
		Esperar Tecla;
	SiNo
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
		//Elige el vendedor de la lista
		leer opcion1;
	FinSi
	Escribir "---------------------------------------------------------";
	Escribir "Seleccione un producto con stock disponible para la compra:";
	Escribir "";
	//Controla el stock, que no sea 0
	Repetir
		si opcion2 <> 0 Entonces
			Limpiar Pantalla;
			Escribir "Error! No puede seleccionar un producto sin stock..";
			Escribir "Producto: ",matrizProductos[1,opcion2-1]," - Stock: ",matrizPySProductos[3,opcion2-1];		
			Escribir "Por favor elija otro:";
			Escribir "";
		FinSi
		//Indice para listado
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
	Escribir "---------------------------------------------------------";
	Escribir "Cantidad de ",matrizProductos[1,opcion2-1],"(s) quiere comprar? Disponibles ",matrizPySProductos[3,opcion2-1]; 
	//Controla que el stock sea suficiente
	Leer temp;
	Si temp > matrizPySProductos[3,opcion2-1] Entonces
		Repetir 
			Escribir "No puede facturar ",temp,"unidades del producto seleccionado";
			Escribir "Ingrese la cantidad deseada:";
			
			Leer temp;
		Hasta Que temp <=  matrizPySProductos[3,opcion2-1]
	FinSi
	
	//descuenta el producto
	matrizPySProductos[3,opcion2-1] <- matrizPySProductos[3,opcion2-1] -temp;
	
	//suma la comision si tiene vendedor asignado, 
	si opcion1 <> 99 Entonces
		matrizNrosVendedor[2,opcion1-1] <- matrizNrosVendedor[2,opcion1-1] + ((matrizPySProductos[2,opcion2-1] * temp)*0.3);
	FinSi
	//Imprime comprobante de compra con muchos datos importantes
	Limpiar Pantalla;
	Escribir "";
	Escribir "Gracias por comprar en nuestra tienda!!";
	Escribir "";
	Escribir "-----------------------------------------------------";
	Escribir "Detalle de su compra:";
	Escribir "";
	Escribir "[***] Código del producto: ",matrizPySProductos[0,opcion2-1]," [***] Descripción: ",matrizProductos[1,opcion2-1];
	Escribir "[***] Precio por unidad: $",matrizPySProductos[2,opcion2-1]," [***] Cantidad comprada(s): ",temp;
	Escribir "";
	Escribir "[*****] Valor final de la compra: $",matrizPySProductos[2,opcion2-1] * temp;
	si opcion1 <> 99 Entonces
		Escribir "[*****] Vendedor: ",matrizVendedor[1,opcion1-1];
		Escribir "-----------------------------------------------------";
		Escribir "-----------------------------------------------------";
		Escribir "Cupón para vendedor: ";
		Escribir "-----------------------------------------------------";
		Escribir "Código Vendedor: ",  matrizVendedor[0,opcion1-1]   ," --- Vendedor: ",matrizVendedor[1,opcion1-1];
		Escribir "Comisión que genera la venta (30% de la compra):";
		Escribir "                             $ ",(matrizPySProductos[2,opcion2-1] * temp)*0.3;
	SiNo
		Escribir "[*****] Vendedor genérico, no comisiona venta.";
	FinSi
	Escribir "";
	Escribir "Presione una tecla para continuar..";
	Esperar Tecla;
	Limpiar Pantalla;	
FinFuncion