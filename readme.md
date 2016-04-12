# Matriz de dispersión
## Desarrollado por Boris Beck y Daniel Herrera

#### Descripción:
La matriz de dispersión es una combinación de un gráfico de dispersión con la idea central de una matriz de correlación. Para entender bien en que consiste una matriz de dispersión, será necesario explicar cada una de sus partes.

###### Matriz de correlación:
La matriz de correlación es una tabla de doble entrada que muestra una lista multivariable horizontalmente y verticalmente. Las variables pueden ser distintas para cada uno de los ejes (horizontal y vertical) aunque por lo general se utilizan el mismo conjunto de variables, haciendo que la matriz sea simétrica. La relación se genera a partir del emparejamiento de variables cuyos valores son representados en una celda de la matriz.

La necesidad de utilizar este tipo de estructura de datos surge a partir de los estudios matemáticos estadísticos. En muchas áreas de la ciencia, la necesidad de comparar y relacionar múltiples variables requería de un medio en el cual puedan ser representados fielmente. De ahí surge la matriz de correlación.


###### Diagrama de dispersión:
También conocido como nube de puntos, el diagrama de dispersión consiste en una serie de puntos trazados sobre un eje horizontal y vertical. Cada eje corresponde a una variable que comprende un rango determinado de valores. La relación entre los valores de cada eje es representada por un punto en la gráfica. Algunos diagramas utilizan una línea llamada línea de tendencia el cual indica la tendencia de la correlación entre ambas variables.

El diagrama de dispersión surge a partir de una necesidad similar a la matriz de correlación, sin embargo, lo que de verdad impulso el desarrollo de este tipo de gráficas fueron los estudios sobre la herencia genética de Francis Galton y los estudios en el campo de la astronomía de John F. W. Herschel en el siglo XVIII.

###### Combinando ambas técnicas:
Con el desarrollo de los gráficos generados por computadora y el software estadístico en el año 1960, surgieron muchos desarrollos sobre las matrices de dispersión. Uno de los principales desarrollos fue el de buscar un método para graficar múltiples diagramas de dispersión en una sola gráfica para así poder estudiar las relaciones de múltiples variables a múltiples variables y no solamente de una variable a una variable. La idea era intercambiar la resolución de las gráficas de nube de puntos por una vista en forma de matriz en la cual se pueda observar las relaciones entre varios parámetros. Esto fue nombrado posteriormente por Edward Tufte como "pequeños múltiplos" y actualmente es conocido como matriz de dispersión entre otros nombres.

Para el año 1974, los avances en gráficos de computadora permitieron el desarrollo de estos gráficos en 3D y 2D con interacción con los sistemas PRIM-9 de Fishkeller, Friedman y Tukey. Más adelante, se incluyeron otras funcionalidades de interacción como tomar muestras de la gráfica para estudios detallados, resaltado de variables, cambio de colores y combinaciones entre tecnologías de interacción existentes.

#### Características:

###### Tamaños variables:
La principal característica de esta gráfica es el hecho de que es posible incluir un número determinado de variables, haciendo que la matriz tenga un tamaño definido a la necesidad del usuario. No se encuentra limitada a dos variables (una para cada eje) como un gráfico de dispersión.

###### Relaciones múltiples:
Gracias a que es posible mostrar múltiples variables, es posible observar y analizar múltiples atributos de una muestra y su relación entre ellos, esto permite observar patrones, tendencias, anomalías, varianzas y un sin fin de datos útiles para análisis estadísticos.

#### Parametros de configuración:

###### Ejes:
Es posible especificar en cuales de los lados, ya sea ninguno, uno, dos, tres o todos ellos mostrar la escala de los ejes para cada variable. Esto permite un mejor entendimiento de los datos mostrados ya que es posible identificar un valor numérico aproximado para cada una de estas variables.

Esto se logra modificando los atributos de la gráfica:
```javascript
> //Mostrar el eje en todos los lados
> grafica.axisBottom = true;
> grafica.axisTop = true;
> grafica.axisLeft = true;
> grafica.axisRight = true;
```

###### Etiquetas:
Las etiquetas facilitan la identificación de los ejes, es una forma muy natural de saber el nombre del parámetro que esta siendo representado en un eje determinado.

Esta configuración se puede realizar de la siguiente manera:
```javascript
> //Mostrar las etiquetas en todos los lados
> grafica.labelBottom = true;
> grafica.labelTop = true;
> grafica.labelLeft = true;
> grafica.labelRight = true;
```
####### Colores:
Otra cualidad que puede ser modificada son los colores de la matriz, los puntos, los bordes y las etiquetas, cada una de ellas puede tener un color distinto si así lo desea.

Esta configuración se puede realizar de la siguiente manera:
```javascript
> //Cambiar el color del relleno de la matriz
> grafica.matrixBackgroudnColor = #FFFFFF;
> //Cambiar el color de los bordes de la matriz
> grafica.matrixBorderColor = #000000;
> //Cambiar el color de los bordes de los puntos de la matriz
> grafica.dotBorderColor = #EFEFEF
> //Cambiar el color del relleno de los puntos de la matriz
> grafica.dotBackgroundColor = #EFEFEF
> //Cambiar el color del texto/etiquetas de la matriz
> grafica.labelBackgroundColor = #EFEFEF
```

