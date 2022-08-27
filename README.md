# docker-ilo-client
Firefox client to HP ILO server

# How-to

### Run this container:
`docker run --rm --name ilo-client -p 5900:5900 -e HILO_HOST=https://ADDRESS_OF_YOUR_HOST -e HILO_USER=SOME_USERNAME -e HILO_PASS=SOME_PASSWORD sshnaidm/docker-ilo-client`

### Then run any VNC client and point it to vnc://localhost:5900


