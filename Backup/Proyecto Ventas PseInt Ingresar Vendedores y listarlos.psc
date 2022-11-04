Proceso vendedores
	Definir i,j Como Entero; // Contadores
	//Se definen dos matrices para trabajar con nros y texto (Codigo del producto)
	Definir matrizVendedores Como Caracter; // matrizVendedores para texto  ---> Legajo // Nombre del vendedor
	Definir matrizNrosVendedores Como Real; // matrizNrosVendedores para numeros ---> Legajo // Nada // Comision
	
	//Define la dimension de las matrices
	Dimension matrizVendedores[99,99];
	Dimension matrizNrosVendedores[99,99];
	
	//Ciclo para completar la tabla de vendedores
	Para j<-0 Hasta 2 Con Paso 1 Hacer
		Para i<-0 Hasta 2 Con Paso 1 Hacer
			Segun i Hacer
				0:
					Escribir Sin Saltar "Ingrese código del nuevo vendedor:";
					Leer matrizNrosVendedores[i,j];
					matrizVendedores[i,j] <- ConvertirATexto(matrizNrosVendedores[i,j]);
				1:
					Escribir Sin Saltar "Ingrese Nombre del vendedor:"; 
					Leer matrizVendedores[i,j];
				2:
					matrizNrosVendedores[i,j] <- 0; // Le ingresamos valor 0 para que funcione la suma de comisiones con su valor inicial cargado
			FinSegun
		FinPara
	FinPara
	Escribir "";
	//Ciclo para mostrar los vendedores
	Escribir "Tabla de vendedores y sus comisiones";
	Para j<-0 Hasta 2 Con Paso 1 Hacer
		Para i<-0 Hasta 2 Con Paso 1 Hacer
			Segun i Hacer
				0:
					Escribir Sin Saltar "Vendedor N°: ",matrizNrosVendedores[i,j];
				1:
					Escribir " ##### ",matrizVendedores[i,j];
				2:
					Escribir "Comision acumulada: $", matrizNrosVendedores[i,j]; 
					Escribir "";
			FinSegun
		FinPara
	FinPara
	Escribir "";
FinProceso 
