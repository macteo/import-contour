#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

function exec_psql() {
  PGPASSWORD="$POSTGRES_PASSWORD" psql --host="$POSTGRES_HOST" --port="$POSTGRES_PORT" --dbname="$POSTGRES_DB" --username="$POSTGRES_USER"
}

function exec_sql_file() {
  local sql_file=$1
  cat "$sql_file" | exec_psql
}

function drop_table() {
  local table=$1
  local drop_command="DROP TABLE IF EXISTS $table;"
  echo $drop_command | exec_psql
}

function drop_table_cascade() {
    local table=$1
  local drop_command="DROP TABLE IF EXISTS $table CASCADE;"
  echo $drop_command | exec_psql
}

function hide_inserts() {
    grep -v "INSERT 0 1"
}