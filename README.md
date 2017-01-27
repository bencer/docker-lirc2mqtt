# docker-lirc2mqtt
Docker image for lirc2mqtt

Docker image bunlding lircd and [lirc2mqtt](https://www.npmjs.com/package/lirc2mqtt).

Usage example on docker-compose.yml:

```
  lirc2mqtt:
    build: ./lirc2mqtt
    image: lirc2mqtt
    container_name: lirc2mqtt
    restart: always
    volumes:
      - ./lirc-config/MKJ40653802.conf:/etc/lirc/lircd.conf.d/MKJ40653802.conf
    devices:
      - "/dev/ttyACM0:/dev/ttyACM0"
```

And to access from your MQTT broker:

```
mosquitto_pub -h mqtt.lan -t 'lirc/set/MKJ40653802-TV/KEY_POWER' -m 1
```
