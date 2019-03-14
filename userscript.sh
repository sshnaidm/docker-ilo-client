#!/bin/bash 
export HOME=/config
export HILO_HOST=${HILO_HOST%%/}
SESSION_KEY=""
data="{\"method\":\"login\",\"user_login\":\"${HILO_USER}\",\"password\":\"${HILO_PASS}\"}"
if [[ -n "${HILO_USER}" && -n "${HILO_PASS}" ]]; then
    SESSION_KEY=$(curl -k -X POST "${HILO_HOST}/json/login_session" -d "$data" 2>/dev/null | grep -Eo '"session_key":"[^"]+' | sed 's/"session_key":"//')

fi
echo "SESSION_KEY=$SESSION_KEY"
echo $SESSION_KEY > /session_key
exec x11vnc -forever -create

