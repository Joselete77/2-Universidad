SELECT
    nombrecompleto "Nombre partido", avg(certidumbre) "Certidumbre media"
FROM
    partidos
JOIN
    consultas_datos
ON
    partidos.idpartido = consultas_datos.partido
WHERE
    fechacreacion != (
        SELECT
            max(fechacreacion)
        FROM
            partidos
        WHERE 
            fechacreacion < (
                SELECT
                    max(fechacreacion)
                FROM
                    partidos
            )
    )
AND fechacreacion != (
        SELECT
            max(fechacreacion)
        FROM
            partidos
    )
GROUP BY nombrecompleto
ORDER BY avg(certidumbre) ASC