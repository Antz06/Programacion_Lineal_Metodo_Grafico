# Ejemplo:
# Un comerciante de frutas necesita 30 cajas de naranjas, 25 de plátanos
# y 20 de manzanas. Dos mayoristas están en condiciones de satisfacer sus
# necesidades, pero solo venden la fruta en contenedores completos. 
# El mayorista “Argiabasto” envía en cada contenedor 10 cajas de naranjas, 
# 10 de plátanos y 5 de manzanas. El mayorista “Frutos con sabor a México” 
# envía en cada contenedor 5 cajas de naranjas, 5 de plátanos y 10 de manzanas. 
# Sabiendo que el mayorista “Argiabasto” se encuentra a 280 Km. de distancia y 
# el mayorista “Frutos con sabor a México” a 420 Km., calcular cuántos 
# contenedores habrá de comprar a cada mayorista, con el objeto de ahorrar 
# tiempo y dinero, reduciendo al mínimo la distancia.

#Mayoristas         Cajas/naranjas   Cajas/plátanos   Cajas/manzanas    Distancia
#Argiabasto              10               10              5               280 km
#Frutos con              5                5               10              420 km
#sabor a México

# Resolución del problema de programación líneal a través del método gráfico

# Paso 1: Identificar las variables básicas
# x1 = Contenedores de Argiabasto 
# x2 = Contenedores de Frutos con sabor a México

# Paso 2: Identificar las variables "cj"
# c1 = 280 km/ distancia del mayorista Argiabasto
# c2 = 420 km/ distancia del mayorista Frutos con sabor a México

# Paso 3: función objetivo
# Min z = (280km/Argiabasto)(x1Argiabasto) + (420km/Frutos)((x2Frutos)
# Min z = 280x1 + 420x2

# Paso 4: Identificar "bj"
# b1 = Cantidad mínima requerida de naranjas (30)
# b2 = Cantidad mínima requerida de plátanos (25)
# b3 = Cantidad mínima requerida de manzanas (20)

# Paso 5: Identificar "aij"
# b1 = Cantidad mínima requerida de naranjas (30)
#   * Argiabasto ofrece en cada contenedor 10 cajas
#   * Frutos con sabor a México ofrece en cada contenedor 5 cajas
# b2 = Cantidad mínima requerida de plátanos (25)
#   * Argiabasto ofrece en cada contenedor 10 cajas
#   * Frutos con sabor a México ofrece en cada contenedor 5 cajas
# b3 = Cantidad mínima requerida de manzanas (20)
#   * Argiabasto ofrece en cada contenedor 5 cajas
#   * Frutos con sabor a México ofrece en cada contenedor 10 cajas

# Paso 6: Armar restricciones
# b1 = Cantidad mínima requerida de naranjas (30)
#    = (10 cajas/Argiabasto)(x1.A) + (5 cajas/Frutos)(x2.F)
#    = 10x1 + 5x2 >= 30
# b2 = Cantidad mínima requerida de plátanos (25)
#    = (10 cajas/Argiabasto)(x1.A) + (5 cajas/Frutos)(x2.F)
#    = 10x1 + 5x2 >= 25
# b3 = Cantidad mínima requerida de manzanas (20)
#    = (5 cajas/Argiabasto)(x1.A) + (10 cajas/Frutos)(x2.F)
#    = 5x1 + 10x2 >= 20

# Paso 7: No negatividad
# x1, x2 >= 0

# Paso 8: Modelo general
# Min z = 280x1 + 420x2
# s.a.
# 10x1 + 5x2 >= 30  (1)
# 10x1 + 5x2 >= 25  (2)
# 5x1 + 10x2 >= 20  (3)
#
# x1, x2 >= 0

# Paso 9 Gráficar el sistema.


# Importar la librería
install.packages("matlib")
library(matlib)

# Asignar los coeficientes de las restricciones
# 10x1 + 5x2  >= 30         10   5     (1)
# 10x1 + 5x2  >= 25         10   5     (2)
# 5x1 + 10x2  >= 20         5   10     (3)
# Definir el número de columnas en 2 y el número de filas en 3
A<-matrix(c(10,10,5,5,5,10), ncol = 2, nrow = 3)

# Asignar los valores del lado derecho de las desigualdades
# 10x1 + 5x2  >= 30             30     (1)
# 10x1 + 5x2  >= 25             25     (2)
# 5x1 + 10x2  >= 20             20     (3)
b<- c(30,25,20)

# Se grafican las ecuaciones
plotEqn(A,b, xlim=c(0,5), labels=TRUE)

# Como se puede observar en el gráfico, las rectas de la restricción 1(línea negra) y la
# restricción 2 (línea roja) son paralelas, es decir, nunca se cruzan entre sí, por lo 
# que solo tendríamos 3 puntos para trabajar, que es la intersección de la restricción 1
# con el eje de x2. La intersección que existe entre la restricción 1 y la restricción 3
# (línea verde) y la intersección de la restricción 3 con el eje de x1. Por lo que se 
# procede a encontrar los puntos de intersección de los puntos:

# A) Intersección de la recta de la restricción 1 (línea negra) con la recta del eje
#    x2
# B) Intersección de la recta de la restricción 1 (línea negra) con la recta de la
#    restricción 3 (línea verde)
# C) Intersección de la recta de la restricción 3 (línea verde) con la recta del eje
#    x1

# Intersección A

# Intersección de la restricción 1 con la recta del eje x2
# Se resuelve de manera matricial como ;
# 10x1 + 5x2 = 30
# x1         = 0

# entonces las matrices A y B quedan como:
# [A=
#           10    5
#            1    0
# ;B=
#           30
#            0
# ]
# Definiendo matricialmente las funciones dentro de R, quedaría como

A <- matrix(c(10,5,1,0), nrow = 2, ncol = 2, byrow = T)
# Mostrar la matriz A
A
##     [,1] [,2]
##[1,]    10  5
##[2,]     1  0

B <- matrix(c(30,0), nrow = 2, ncol = 1, byrow = F)
# Mostrar la matriz A
B
##     [,1]
##[1,]  30
##[2,]   0

# Resolviendo nos queda como
r <- solve(t(A)%*%A)%*%t(A)%*%B
# Mostrar la matriz r
r
##      [,1]
##[1,]    0
##[2,]    6

# Intersección B

# Intersección de la recta de la restricción 1 (línea negra) con la recta de la
# restricción 3 (línea verde)
# 10x1 + 5x2 = 30
# 5x1 + 10x2 = 20

# entonces las matrices A y B quedan como:
# [A=
#             10     5
#             5     10
# ;B=
#             30
#             20
# ]

# Definiendo matricialmente las funciones dentro de R, quedaría como

A <- matrix(c(10,5,5,10), nrow = 2, ncol = 2, byrow = T)
# Mostrar la matriz A
A
##     [,1] [,2]
##[1,]    10   5
##[2,]    5   10

B <- matrix(c(30,20), nrow = 2, ncol = 1, byrow = F)
# Mostrar la matriz A
B
##     [,1]
##[1,]  30
##[2,]  20

# Resolviendo nos queda como
r <- solve(t(A)%*%A)%*%t(A)%*%B
# Mostrar la matriz r
r
##       [,1]
##[1,]   2.6666667
##[2,]   0.6666667

# Intersección C

# Intersección de la recta de la restricción 3 (línea verde) con la recta del eje
# x1
# 5x1 + 10x2 = 100
#         x2 = 0

# entonces las matrices A y B quedan como:
# [A=
#             5     10
#             0     1
# ;B=
#             20
#             0
# ]

# Definiendo matricialmente las funciones dentro de R, quedaría como

A <- matrix(c(5,10,0,1), nrow = 2, ncol = 2, byrow = T)
# Mostrar la matriz A
A
##     [,1] [,2]
##[1,]    5    10
##[2,]    0    1

B <- matrix(c(20,0), nrow = 2, ncol = 1, byrow = F)
# Mostrar la matriz A
B
##     [,1]
##[1,]   20
##[2,]    0

# Resolviendo nos queda como
r <- solve(t(A)%*%A)%*%t(A)%*%B
# Mostrar la matriz r
r
##     [,1]
##[1,]    4
##[2,]    0

# Por último se busca determinar los puntos donde la función se maximice; por 
# lo que simplemente se evalua en la función objetivo cada uno de los puntos 
# encontrados.

# Definiendo la función objetivo

# Para ello escribe el código como
val<-matrix(c(0, 6, 2.6666667, 0.6666667, 4, 0), nrow=3, ncol = 2, byrow=T)
# Mostrar la matriz val
val
##      [,1]            [,2]
## [1,]    0               6
## [2,]  2.6666667 0.6666667
## [3,]    4               0

FO<-matrix(c(280,420), nrow=2, ncol=1)
# Mostrar la matriz FO
FO
##      [,1]
## [1,]  150
###[2,]  220

r=val%*%FO
# Mostrar la matriz r
r

##       [,1]
## [1,] 2520.000
## [2,] 1026.667
## [3,] 1120.000

# como se observa la solución óptima del sistema es 1026.667 con las variables 
# X1=2.6666667 y x2=0.6666667