# Proyecto Final del curso Obteniendo y limpiando Datos
El script inicia leyendo los datos de las tablas "trining" y "test"
Además leemos la tabla "features" que contiene el nombre de las columnas
luego se leen los respectivos archivos y_train y_test para leer los labels respectivos (del 1 al 6)
también leemos subject_train y subject_test para tener identificados los sujetos (del 1 al 30)
Después de pegar la información unimos ambas tablas
el siguiente paso es dejar solamente las variables que tienen la media y la desviación estándar
luego los "labels" los cambiamos por algo más descriptivo como es la acción específica a desarrollar
por último creamos una tabla que resumen que contiene los promedios de cada tabla por actividad y por sujeto
