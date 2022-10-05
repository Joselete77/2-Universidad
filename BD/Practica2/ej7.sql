SELECT partido, count(partido)
FROM partidos
LEFT JOIN consultas_datos
ON partidos.idpartido = consultas_datos.partido
GROUP BY idpartido
/*Con left join el partido que borres se mostrará de todas formas*/