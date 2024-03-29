SELECT
    nombre
FROM
    localidades
WHERE
    numerohabitantes > (
        SELECT
            numerohabitantes
        FROM
            localidades
        WHERE
            idlocalidad = (
                SELECT
                    localidad
                FROM
                    votantes
                WHERE
                    fechanacimiento = (
                        SELECT
                            min(fechanacimiento)
                        FROM
                            votantes
                        WHERE
                            fechanacimiento > (
                                SELECT
                                    min(fechanacimiento)
                                FROM
                                    votantes
                            )
                    )
            )
    )