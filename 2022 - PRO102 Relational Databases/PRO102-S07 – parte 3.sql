/*
# @author Esteban Cuevas
# @collaborators Ruth Morales, Karen Contreras
# Date: 2022-07-16
# License: MIT https://opensource.org/licenses/MIT
*/

USE [pro102s07_netflix]
GO

/* 1. Mostrar todas las películas ordenadas por Título */
SELECT * FROM pelicula ORDER BY titulo ASC

/* 2. Mostrar los nombres de las películas que comienzan con la letra "E" */
SELECT * FROM pelicula WHERE titulo LIKE 'E%'

/* 3. Mostrar los códigos de las películas que su título termine con la letra "R" */
SELECT codigo FROM pelicula WHERE titulo LIKE '%R'

/* 4. Mostrar los primeros 3 directores insertados */
SELECT TOP(3) * FROM director ORDER BY codigo ASC

/* 5. Mostrar las últimas 3 categorías insertadas */
SELECT TOP(3) * FROM categoria ORDER BY codigo DESC

/* 6A. Contar las películas por cada categoría, automático */
SELECT COUNT(codigo), codCategoria FROM pelicula GROUP BY codCategoria

/* 6B. Contar las películas por cada categoría, una a una */
SELECT COUNT(codigo) FROM pelicula WHERE codCategoria = 1
SELECT COUNT(codigo) FROM pelicula WHERE codCategoria = 2
SELECT COUNT(codigo) FROM pelicula WHERE codCategoria = 3
SELECT COUNT(codigo) FROM pelicula WHERE codCategoria = 4
SELECT COUNT(codigo) FROM pelicula WHERE codCategoria = 5
