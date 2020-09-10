#!/usr/bin/env python3
import time
from typing import *

import psutil


def out(blocks: list) -> None:
    print_for_each(blocks, lambda b: f'┌{"─" * (len(b) + 2)}┐')
    print_for_each(blocks, lambda b: f'│ {b} │')
    print_for_each(blocks, lambda b: f'└{"─" * (len(b) + 2)}┘')


def print_for_each(blocks: list, format_fn: Callable[[str], str]) -> None:
    for b in blocks:
        print(format_fn(b), end='')
    print()


date_time = time.strftime("%B %d, %Y %H:%M")

battery = psutil.sensors_battery()
plugged = "c" if battery.power_plugged else ""
percent = f'{round(battery.percent)}%'

memory = psutil.virtual_memory()
used_memory = round(memory.used / 1000000)
available_memory = round(memory.available / 1000000)

cpu_percent = round(psutil.cpu_percent(interval=.1))

out([
    date_time,
    percent + plugged,
    f'{used_memory}MB/{available_memory}MB',
    f'{cpu_percent}%'
])
