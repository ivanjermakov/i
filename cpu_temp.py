import subprocess

def cpu_temp():
    return int(subprocess.check_output(['i8kctl', 'temp']))
