
# funciones ----

cifra <- 54314

# las funciones que empiezan con "is" nos permiten consultar si un objeto "es" de cierto tipo
is.numeric(cifra)
is.character(cifra)
# la respuesta llega como un dato tipo lógico: TRUE o FALSE


# para obtener el tipo de un objeto:
cifra2 <- "8575495"

typeof(cifra2)
class(cifra2)

is.numeric(cifra2)

# las funciones que empiezan con "as" convierten el tipo de los objetos
cifra3 <- as.numeric(cifra2) # convertir a numérico

typeof(cifra3)
class(cifra3)

# podemos convertir a formato numérico un vector de datos en caracter
cifras <- c("3442", "09486085", "6734637", "cuatromil", "3434")

class(cifras)
as.numeric(cifras)
# lo que ocurrió fue que el elemento numero 4 no pudo convertirse a numérico,
# por lo tanto, queda expresado como NA

# a este suceso se le llama "coerción"
prueba <- c(1, 2, 3, 4, 5, 6, "perro")

prueba
# en este caso, creamos un vector con elementos de dos tipos distintos, y como
# sabemos que los vectores sólo pueden ser de un tipo, R convierte todos los elementos
# al tipo de datos más "general", en este caso caracter


edades <- c(30, 40, 50, 55, 45, 46, 47, 23, 25, 74, 63)

# obtener cantidad de elementos del vector
length(edades)

# extraer una muestra aleatoria desde el vector
sample(edades, 1) # un elemento al azar
sample(edades, 5) # cinco elementos al azar

# crear una secuencia entre dos números
seq(from = 10, to = 100, by = 5)
# del 10 al 100, de 5 en 5

# del 1 al 2, avanzando en 0.1
seq(from = 1, to = 2, by = 0.1)

# podemos usar funciones para definir cualquier argumento de cualquier otra función
seq(from = min(edades), to = max(edades), by = 10)

# repetir un objeto
rep("hola", 10)

# crear una secuencia de años
años <- seq(1900, 2020, 10)

# crear una secuencia de números decimales
numeros <- seq(from = 0, to = 2, by = 0.132)

# redondear números decimales
round(numeros, 2)

# crear un vector de varios millones de números
numeros <- 500000:4000000

# ver cuántos números tiene el vector
length(numeros)

# extraer una muestra de este vector
ingresos <- sample(numeros, 20)

ingresos

# desactivar la notación científica
options(scipen = 99999)

ingresos

# redondear números enteros en sus cifras significativas
ingresos2 <- signif(ingresos, 3)


# repaso de comparaciones
4 == 4
4 == 30
4 != 2


# ifelse ----
# función que a partir de una comparación, retorna un elementos si la
# comparación es TRUE, u otro si es FALSE
año <- 2025
ifelse(año == 2025, yes = "presente", no = "pasado")

año <- 2020
ifelse(año == 2025, "presente", "pasado")

# en este ejemplo, la misma expresión de ifelse retorna distintos valores dependiendo de
# el dato que le entregamos (el objeto "año")

# apliquemos ifelse() al vector de ingresos anteriormente creado
ifelse(ingresos2 > 1000000, yes = "alto", no = "bajo")
# de este modo estamos convirtiendo una variable numérica a una variable categórica


# pegar texto ----
casos <- c(2, 4, 3, 1)

paste(casos, "casos")

# combinar paste() con ifelse() para escribir una palabra en plural dependiendo del dato
paste(casos, ifelse(casos > 1, "casos", "caso"))

# otra forma de hacer lo mismo, pero sólo cambiando la letra "s"
paste0(casos, " ", "caso", ifelse(casos > 1, "s", ""))




# flujo de control con if else ----
# esta técnica permite crear condicionalidad en la ejecución del código
# usando una comparación, se decide si el código se ejecutará o no
# el código sólo se ejecuta si la comparación retorna TRUE

basura <- 7000

basura

if (basura > 900) {
  # limpiar el dato porque viene en kilos en vez de toneladas
  basura <- basura /1000
  message("el valor es mayor a 900, por lo que será dividido en 1000")
} 

basura
# en este ejemplo, creamos un flujo de control donde un dato se divide sólo
# si se cumple un cierto criterio

# probemos cambiando el dato, esta vez agregando un mensaje que también confirma
# si la condición no se cumple
basura <-  6

if (basura > 900) {
  # limpiar el dato porque viene en kilos en vez de toneladas
  basura <- basura /1000
  message("valor anómalo: el valor es mayor a 900, por lo que será dividido en 1000")
} else {
  message("valor normal")
}

# en el apartado "else" podemos especificar código que se ejecutará si la
# condición es FALSE, o bien, podemos omitir el apartado "else" para que sólo
# se ejecute el código si la condición es TRUE



# funciones + ifelse ----


personas <- c("paula", "catherine", "luis", "basti", "natalia", "raul", "susana")

# crear otra función para saludar
saludar <- function(persona) {
  paste("¡hola ", persona, "!", sep = "")
}

saludar(personas)

# agreguémosle un nuevo argumento a la función, y dependiendo del argumento,
# la función hará algo distinto:
saludar <- function(persona, alegria) {
  
  exclamacion <- ifelse(alegria == TRUE, "!!!", "!")
  
  paste("¡hola ", persona, exclamacion, sep = "")
}

saludar(personas, alegria = FALSE)

saludar(personas, alegria = TRUE)



# en este caso, la función es igual a la anterior, pero al definir el segundo
# argumento de la función, le proveemos un valor por defecto (FALSE), de modo
# que la función puede usarse sin especificar el argumento, en cuyo caso el 
# arugmento asumirá el valor por defecto
saludar <- function(persona, alegria = FALSE) {
  
  exclamacion <- ifelse(alegria == TRUE, "!!!", "!")
  
  paste("¡hola ", persona, exclamacion, sep = "")
}

# sin el argumento (asume el valor por defecto)
saludar(personas)

# con el argumento
saludar(personas, alegria = TRUE)


# en vez de un ifelse, podemos usar un rep(), para que la cantidad de exclamaciones
# se defina en un argumento
saludar2 <- function(persona, alegria = 3) {
  
  exclamacion <- rep("!", alegria)
  
  exclamacion2 <- paste(exclamacion, collapse = "")
  
  paste("¡hola ", persona, exclamacion2, sep = "")
}

saludar2(personas)

saludar2(personas, 10)




# creamos un argumento, el cual se usará para modificar el flujo de la función
saludar3 <- function(persona, alegria = 3, omitir = "no") {
  # if (persona %in% c("susana", "basti")) {
  #   paste("HOLA", "nombre", "QUE BUENO QUE VINISTEEE")
  # }
  
  if (omitir == "sí") {
    message("omitiendo")
    paste0(persona, ".")
    
  } else {
  
  exclamacion <- rep("!", alegria)
  
  exclamacion2 <- paste(exclamacion, collapse = "")
  
  persona <- ifelse(persona == "susana", toupper(persona), persona)
  
  paste("¡hola ", persona, exclamacion2, sep = "")
  }
}
# si se pone "no", la función funcionará normalmente, pero si se pone "sí", 
# la función se comportará distinto

saludar3(personas, alegria = 4)

saludar3(personas, alegria = 4, omitir = "sí")



# iteraciones ----
# en una iteración, se realiza una operación multiples veces en base al vector que entregues
pasos <- 10:20

for (i in pasos) {
 texto <- paste("este es el paso:", i)
 
 print(texto)
}
# en este caso tenemos un vector de 10 números, por lo que el código especificado
# se aplica a cada uno de los números, usando el objeto "i" como si fuera el objeto 
# que contiene el valor de cada paso (10, 11, 12, etc.)
 

# en una iteración, podemos controlar el flujo del código con if else
for (persona in personas) {

  saludo <- paste("hola", persona)
  
  if (persona == "susana") {
    saludo <- paste("chao", persona)
  }
  
  print(saludo)
}
# en este caso, ponemos una excepción para que, en un paso específico, 
# el comportamiento sea distinto


# en este ejemplo, controlamos el flujo del código para que hayan múltiples condiciones
# y para cada condición se haga algo distinto
for (persona in personas) {
  
  if (persona == "susana") {
    saludo <- paste("holaaaa susanaaa!")
    
  } else if (persona == "catherine") {  
    saludo <- paste("excelente pregunta, catherine")
    
  } else if (persona == "basti") {
    saludo <- sample(c("serpiente", "perro", "gato", "rata", "gallina", "pez"), 1)
    
  } else {
    saludo <- paste("hola", persona)
  }
  
  print(saludo)
}
# por cada paso, el objeto "persona" asume el valor del elemento correspondiente del vector "personas",
# y avanza por el código probando si "persona" coincide con alguna de las condiciones dadas,
# y al final, si no cayó en ninguna de las comparaciones específicas, realiza una operación general para
# todos los demás casos


animo <- "feliz"
# animo <- "enojado"
# animo <- "triste"

for (persona in personas) {
  
  if (persona == "susana") {
    
    if (animo == "feliz") {
    saludo <- paste("holaaaa susanaaa!")
    
    } else if (animo == "enojado") {
      saludo <- paste("hola po susana")
    }
    
  } else if (persona == "catherine") {  
    saludo <- paste("excelente pregunta catherine")
    
  } else if (persona == "basti") {
    saludo <- sample(animales, 1)
    
  } else {
    saludo <- paste("hola", persona)
  }
  
  print(saludo)
}


# data frames ----
# los data frames son tablas de datos construidas con vectores
edades

edades <- c(30, 43, 50, 28, 23)
ingresos <- c(400, 345, 200, 700, 1000)
pais <- c("chile", "perú", "colombia", "brasil", "argentina")

length(pais)

datos <- data.frame(edades,
           ingresos,
           pais)

datos

# ver características del vectos
dim(datos) # filas y columnas
length(datos) # cantidad de columnas

# extraer una columna como vector
datos$ingresos
datos$pais

# selección de elementos en vectores
personas[5]

# en un dataframe, lo mismo extraería la columna en esa posición
datos[3]

# extraer una fila
datos[3, ]
# [x, y]

# extraer dos columnas en base a su posición
datos[ , 1:2]

# extraer dos columnas en base a su nombre
datos[ , c("ingresos", "pais")]

# realizar una operación en base a una columna, y guardarla como vector
año <- datos$edades - 2025

año

# luego, usamos ese nuevo vector para introducirlo al dataframe como
# una nueva columna
datos$año <- año

datos

# lo mismo se podría hacer de una forma más directa: creando la columna
# de inmediato a partir de la operación directa sobre una columna existente
datos$año <- datos$edades - 2025
datos

# aplicar ifelse para crear nueva columna en base a columna existente
datos$ingresos
datos$nivel <- ifelse(datos$ingresos >= 700, "alto", "bajo")
datos

# modificar una columna existente aplicándole una función
datos$año
datos$año <- abs(datos$año)
datos

# modificar una columna existente aplicándole una operación matemática
datos$ingresos
datos$ingresos <- datos$ingresos * 1000
datos


# instalar paquetes ----
install.packages("readxl")
# es necesario ekjecutarlo solo una vez en tu computador; es como instalar una app

# activar o cargar paquete, cada vez que necesites usarlo; es como abrir una app
library("readxl")

# cargar datos desde excel y asignarlos a un objeto
datos <- read_excel("campamentos_chile_2024.xlsx")

# extraer una columna
datos$region

# ver datos únicos en un vector
unique(datos$region)

# cantidad de valores únicos de una variable
length(unique(datos$region))


# dplyr ----

# instalar otro paquete
install.packages("dplyr")

library(dplyr)

datos

## selección de columnas ----
select(datos, 
       nombre, hogares, hectareas)

select(datos, 
       where(is.numeric))

select(datos, 
       nombre, where(is.numeric)
       )

select(datos, 
       starts_with("cut"))

select(datos, 
       -starts_with("cut"))

select(datos, 
       -provincia)

## filtros ----
datos_filtrados <- filter(datos,
       hogares > 100 & hogares < 200)

datos_filtrados$nombre


## ordenamiento ----
arrange(datos, area)

arrange(datos, desc(area))

datos

## operaciones encadenadas ----
datos2 <- filter(datos,
       hogares > 100 & hogares < 200)

datos3 <- arrange(datos2, area)

select(datos3, nombre, hogares, area)

# en vez de hacer las tres operaciones por separado, podemos encadenarlos
# para esto usamos el operador de conexión o "pipe" ( |> )

# |> # pipe

# ejemplo:
# cantidad de valores únicos de una variable
length(unique(datos$region))

# cantidad de valores únicos de una variable
datos$region |> unique() |> length()

# encadenamos las operaciones que hicimos antes, en una sola expresión
datos |> 
  filter(hogares > 100 & hogares < 200) |> 
  arrange(area) |> 
  select(nombre, hogares, area) |> 
  filter(area > 20000)
# queda mucho más ordenado


# filtrar, seleccionar columnas y crear una nueva columna
datos |> 
  filter(hogares > 100) |> 
  select(nombre, hogares, area) |> 
  mutate(tipo = ifelse(hogares > 300, "muchos", "pocos")) 

# crear una variable nueva
datos |> 
  select(nombre, hogares, area) |> 
  mutate(año = 2025) |> 
  mutate(area2 = area/1000)

# corregir el tipo de una variable
datos |> 
  select(nombre, hogares, area) |> 
  mutate(area = as.character(area)) |> 
  mutate(area = as.numeric(area)) |> 
  mutate(area2 = round(area2, 0))

# crear una columna con texto redactado en base a las variables
datos |> 
  filter(hogares > 100) |> 
  select(nombre, hogares, area) |> 
  mutate(hogares2 = paste(hogares, "hogares")) |> 
  mutate(hogares3 = paste0(nombre, " tiene ", hogares2, ", del tipo ", tipo))


# muchas operaciones consecutivas
datos5 <- datos |> 
  filter(hogares > 100) |> 
  select(nombre, hogares, area) |> 
  mutate(tipo = ifelse(hogares > 300, "muchos", "pocos")) |> 
  mutate(año = 2025) |> 
  mutate(area2 = area/1000) |> 
  mutate(area = as.character(area)) |> 
  mutate(area = as.numeric(area)) |> 
  mutate(area2 = round(area2, 0)) |> 
  mutate(hogares2 = paste(hogares, "hogares")) |> 
  mutate(hogares3 = paste0(nombre, " tiene ", hogares2, ", según nuestro criterio son ", tipo))

# extraer la columna redactada
datos5$hogares3

datos5
