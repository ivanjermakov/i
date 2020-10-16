#!/usr/bin/env python3
import time
from typing import *
from cpu_temp import *

import psutil


def out(blocks: list) -> None:
    print()
    for block in blocks:
        print(f'    {block}')
    print(' ')

date_time = time.strftime("%b %d, %H:%M")

battery = psutil.sensors_battery()
plugged = "c" if battery.power_plugged else ""
percent = f'{round(battery.percent)}%'

memory = psutil.virtual_memory()
used_memory = round(memory.used / 1000000)
available_memory = round(memory.available / 1000000)
total_memory = used_memory + available_memory

cpu_percent = round(psutil.cpu_percent(interval=.1))
cpu_temp = round(cpu_temp())

out([
    f'd {date_time}',
    f'b {percent}{plugged}',
    f'm {used_memory}/{total_memory}',
    f'c {cpu_percent}% {cpu_temp}°'
])
