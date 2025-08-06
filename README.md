# MarstACK
![Logo](app/static/logo.png)

---

This is an application that emulates the eu.hamedata.com endpoint which is required for the Marstek B2500 balcony solar battery to work correctly offline.

When offline (either you or the cloud servers) the zero feed-in system stops working for no reason at all. This script fixes that. In addition, it boosts your privacy by preventing the Battery from "phoning home" (MarstACK logs the data being submitted in the console).

This program works excellently together with Tomquist's great tools such as [b2500-meter](https://github.com/tomquist/b2500-meter) and [hm2mqtt](https://github.com/tomquist/hm2mqtt). Without his effort the Marstek platform would not be of interest.


## Compatibility
I have only tested this with my battery:
* Marstek Saturn-C B2500-H firmware v110

Please let me know if you have success with other models.
I would recommend not doing any blind firmware updates as breakage is likely.


## Installation

### Prerequisites
In order for this to work you must configure your DNS resolver to return your local server's IP for the domain eu.hamedata.com instead of the actual cloud server IP.

There is a [MarstACK Wiki](https://github.com/fignew/MarstACK/wiki) with instructions on how to configure various routers.

### Running in Docker/Podman

```
  docker build -t marstack .
  docker run -p 80:8000 marstack
```

### Running with docker-compose
This will build and run the container, as well as restarting it after system reboot.

```
#cd to cloned directory
docker compose up -d
```

### Running Manually
1. Create a virtual environment (optional but recommended):
   ```bash
   python -m venv venv
   source venv/bin/activate
   ```

2. Install the required packages:
   ```bash
   pip install -r requirements.txt
   ```

3. Run directly with port 80 (using capabilities - recommended in lieu of root):

```bash
# First, grant capabilities to the Python interpreter (one-time setup)
sudo setcap 'cap_net_bind_service=+ep' venv/bin/python
# Then run without sudo
uvicorn main:app --host 0.0.0.0 --port 80
```

## Disclaimer

I am not responsible for any damage or loss this script causes you. This program is provided without warranty or guarantee. Consider it untested because all situations are different and I do not have documentation for the Hame/Marstek APIs. This project is in no way related to or associated with Marstek or Hame.
