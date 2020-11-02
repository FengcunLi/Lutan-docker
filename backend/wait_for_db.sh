wait_for_db() {

    export PGPASSWORD=$POSTGRES_PASSWORD
    RETRIES=10

    until psql -h $POSTGRES_HOST -U $POSTGRES_USER -d $POSTGRES_DB -c "select 1;" >/dev/null 2>&1 || [ $RETRIES -eq 0 ]; do
        ((RETRIES = RETRIES - 1))
        echo "Waiting for PostgreSQL to start, $RETRIES remaining attempts..."
        sleep 2
    done
}

wait_for_db
