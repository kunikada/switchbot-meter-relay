# SwitchBot Meter Relay

Send SwitchBot Meter data to specified url. (HTTP Post)

## Hardware

BLE required

## Usage

    docker run -it \
           -e POST_URL=https://example.com \
           --net=host \
           --cap-add=NET_ADMIN \
           --health-interval=5m \
           -d kunikada/switchbot-meter-relay

### INTERVAL

Option `--health-interval` (default 5m)

### ENVIRONMENT VARIABLES

 * POST_URL : URL to post (Required)

## Post sample

`BLE MAC`s are `6a:5b:4c:3d:2e:1f` and `f0:e9:d8:c7:b6:a5`.

    {
      "6a5b4c3d2e1f_t": 22.4,
      "6a5b4c3d2e1f_h": 65,
      "f0e9d8c7b6a5_t": 26.3,
      "f0e9d8c7b6a5_h": 70,
      "created_at": "2019-4-8 15:26:37"
    }

