#!/usr/bin/env python3

from i3pystatus import Status
from i3pystatus.updates import pacman, cower
from i3pystatus.weather import weathercom

import socket

host = socket.gethostname()
isLaptop = False

if host == "PaCC-RST":
    isLaptop = True


COLOR_RED = '#af3a03'
COLOR_NORMAL = '#fdf4c1'

status = Status(standalone=True)

# Displays clock like this:
status.register("clock",
        format="  %a %-d.%m.%Y   %X",)


if isLaptop:
    status.register(
            'battery',
            format=' {consumption} [{status} ]{percentage_design:.2f}% {remaining}',
            alert=True,
            alert_percentage=15,
            status = {
                'DPL': 'DPL',
                'CHR': '',
                'DIS': '',
                'FULL': '',
                }
            )

# Shows the address and up/down state of eth0. If it is up the address is shown in
# green (the default value of color_up) and the CIDR-address is shown
# (i.e. 10.10.10.42/24).
# If it's down just the interface name (eth0) will be displayed in red
# (defaults of format_down and color_down)
#
# Note: the network module requires PyPI package netifaces
ethernetInterface = "enp0s61f6"
wifiInterface = "wlp6s0"
if isLaptop:
    ethernetInterface = "enp0s25"
    wifiInterface = "wlp3s0"

status.register("network",
    interface=ethernetInterface,
    format_up=" {v4cidr}",
    format_down="",
    color_up=COLOR_NORMAL,
    color_down=COLOR_NORMAL,)

# Note: requires both netifaces and basiciw (for essid and quality)
status.register("network",
    interface=wifiInterface,
    format_up=" {essid} {quality:03.0f}%",
    format_down="",
    color_up=COLOR_NORMAL,)

# Shows the average load of the last minute and the last 5 minutes
# (the default value for format is used)
status.register("temp",
                format='{temp} °C')

status.register("cpu_usage_bar", bar_type = "vertical")

status.register("cpu_usage", format='  {usage:02.0f}%')

# Display memory
status.register('mem', format='  {percent_used_mem}%')

status.register("updates",
        format = " {count}",
        format_no_updates = "",
        backends = [pacman.Pacman(), cower.Cower()])


status.register("mpd",
        format = " {status} {artist} - {title} {song_elapsed}/{song_length}",
        host = "localhost",
        port = 6600,
        max_len = 50
        )

if isLaptop:
    status.register("file",
        format="{workTime}",
        components={"workTime": (lambda x: x, "tmp/workTime")}
        )

status.run()
