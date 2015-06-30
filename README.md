# SABnzbd for Raspberry Pi 2

This is a Dockerfile to set up [SABnzbd](http://sabnzbd.org).

# Usage

```shell
$ docker run \
  -p 8082:8082
  -v /mnt/data:/data
  -v ./config:/config
  nunofgs/rpi-sabnzbd
```
