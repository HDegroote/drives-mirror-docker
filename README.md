# Drives Mirror Docker

Mirror a directory into a hyperdrive with live updates.

Useful for continuous backups, keeping files in sync across machines, and providing file access to other people.

This is a thin rapper around the [drives CLI](https://github.com/holepunchto/drives).

The docker image lives [here](https://hub.docker.com/repository/docker/hdegroote/dir-to-hyperdrive-mirror)

## Usage

```
docker run --mount type=bind,source=<dir-to-mirror>,destination=/home/mirror/publish,readonly --mount type=volume,source=mirror-volume,destination=/home/mirror/data --network host hdegroote/dir-to-hyperdrive-mirror
```

Replacing `<dir-to-mirror>` with the path of a directory on your own machine.

`--network host` is optional: it just gets rid of some edge cases in the connectivity layer (hyperdht)

The hyperdrive's public key will be logged. The key will persist across restarts (assuming the `/home/mirror/data` uses a volume)
