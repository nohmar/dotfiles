pg() {
  pg_ctl -D /usr/local/var/postgres $1 -l /tmp/postgres.log
}

case "$OSTYPE" in
  darwin*) alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
esac
