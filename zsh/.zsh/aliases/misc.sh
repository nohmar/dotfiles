pg() {
  pg_ctl -D /usr/local/var/postgres $1 -l /tmp/postgres.log
}
