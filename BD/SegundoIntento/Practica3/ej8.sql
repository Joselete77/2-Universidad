SELECT
    dni, count(votante)
FROM
    votantes
JOIN
    consultas
ON
    votantes.dni = consultas.votante
WHERE
    dni != (
        SELECT
            dni
        FROM
            votantes
        WHERE
            fechanacimiento = (
                SELECT
                    min(fechanacimiento)
                FROM
                    votantes
                WHERE
                    fechanacimiento = (
                        SELECT
                            min(fechanacimiento)
                        FROM
                            votantes
                    )
            )
    )
GROUP BY dni
ORDER BY count(votante) DESC
