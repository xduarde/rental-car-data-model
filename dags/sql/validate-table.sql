SELECT EXISTS (
    SELECT FROM 
        pg_tables
    WHERE 
        tablename  = '{{ params.table }}'
    );