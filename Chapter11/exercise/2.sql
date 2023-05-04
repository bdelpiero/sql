SELECT
    SUM(
        CASE
            WHEN rating = 'G' THEN 1
            ELSE 0
        ) 'G',
        SUM(
            CASE
                WHEN rating = 'PG' THEN 1
                ELSE 0
            ) 'PG',
            SUM(
                CASE
                    WHEN rating = 'PG_13' THEN 1
                    ELSE 0
                ) 'PG_13',
                SUM(
                    CASE
                        WHEN rating = 'R' THEN 1
                        ELSE 0
                    ) 'R',
                    SUM(
                        CASE
                            WHEN rating = 'NC_17' THEN 1
                            ELSE 0
                        ) 'NC_17',
                        FROM
                            film;