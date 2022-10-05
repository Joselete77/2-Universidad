SELECT siglas
FROM partidos
JOIN eventos_resultados
ON partidos.idpartido = eventos_resultados.partido
HAVING count(partido) > (
    SELECT
        AVG(count(partido))
    FROM eventos_resultados
    GROUP BY partido
)
GROUP BY siglas