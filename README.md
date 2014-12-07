docker SABnzbd Raspberry Pi
===========================

This is a Dockerfile to set up "SABnzbd" - (http://sabnzbd.org/) on a Raspberry
Pi.

## Usage

Build from docker file:

```bash
docker build -t sabnzbd .
```

Run:

```bash
docker run -d -h *your_host_name* -v /*your_config_location*:/config -v /*your_videos_location*:/data -p 8082:8082 sabnzbd
```

## Todo

  * Create a data container for the configuration
  * Provide fig integration
  * Configure HTTPS access

## License

This project is released under the MIT License. See the bundled LICENSE file for
details.
