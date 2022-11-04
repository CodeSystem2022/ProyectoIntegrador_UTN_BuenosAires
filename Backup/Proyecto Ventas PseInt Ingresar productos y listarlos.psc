Proceso sin_titulo
	Definir i,j Como Entero; // Contadores
	//Se definen dos matrices para trabajar con nros y texto (Codigo del producto)
	Definir matrizProductos Como Caracter; //matrizProductos para texto  ---> Codigo // Descripcion del articulo
	Definir matrizPySProductos Como Real; //matrizPySProductos para numeros ---> Codigo // Nada // Precio // Stock
	
	//Define la dimension de las matrices
	Dimension matrizProductos[99,99];
	Dimension matrizPYSProductos[99,99];
	
	//Ciclo para completar la base de datos de producto
	Para j<-0 Hasta 2 Con Paso 1 Hacer
		Para i<-0 Hasta 3 Con Paso 1 Hacer
			Segun i Hacer
				0:
					Escribir Sin Saltar "Ingrese código del nuevo producto:";
					Leer matrizPySProductos[i,j];
					matrizProductos[i,j] <- ConvertirATexto(matrizPySProductos[i,j]);
				1:
					Escribir Sin Saltar "Ingrese descripción:"; 
					Leer matrizProductos[i,j];
				2:
					Escribir Sin Saltar "Ingrese precio:";
					leer matrizPySProductos[i,j];
				3: 
					Escribir Sin Saltar "Ingrese stock disponible:";
					leer matrizPySProductos[i,j];
			FinSegun
		FinPara
	FinPara
	//Ciclo para mostrar la base de datos de producto
	Para j<-0 Hasta 2 Con Paso 1 Hacer
		Escribir "";
		Para i<-0 Hasta 3 Con Paso 1 Hacer
			Segun i Hacer
				0:
					Escribir Sin Saltar "(", matrizPySProductos[i,j],") #";
				1:
					Escribir Sin Saltar matrizProductos[i,j];
				2:
					Escribir Sin Saltar "   °   Precio: $",matrizPySProductos[i,j];
				3: 
					Escribir Sin Saltar "  °   Stock disponible: ",matrizPySProductos[i,j];
					
			FinSegun
			
		FinPara
	FinPara
	Escribir "";
FinProceso 
