# monitor-hotplug

Automatically switch monitor layouts when an external monitor is plugged in or unplugged.  
Designed for use with [dwm](https://dwm.suckless.org/) or other X11 window managers.

## Features

- Detects when your external monitor is plugged in or unplugged
- Automatically switches between single and dual monitor layouts using `xrandr`
- Simple Bash script, no dependencies beyond `xrandr`

## Usage

1. **Clone the repository:**
    ```sh
    git clone https://github.com/yourusername/monitor-hotplug.git
    cd monitor-hotplug
    ```

2. **Edit `monitor-hotplug.sh` to match your monitor output names.**  
   Use `xrandr` to list your outputs and set the `EXTERNAL` and `INTERNAL` variables.

3. **Make the script executable:**
    ```sh
    chmod +x monitor-hotplug.sh
    ```

4. **Run the script in the background:**
    ```sh
    ./monitor-hotplug.sh &
    ```

   Or add it to your `.xinitrc` or run as a [systemd user service](#run-as-a-systemd-user-service).

## Run as a systemd user service

1. Copy the script to a suitable location, e.g., `~/.local/bin/monitor-hotplug.sh`
2. Create `~/.config/systemd/user/monitor-hotplug.service`:

    ```ini
    [Unit]
    Description=Monitor hotplug xrandr script

    [Service]
    ExecStart=/home/YOURUSER/.local/bin/monitor-hotplug.sh

    [Install]
    WantedBy=default.target
    ```

3. Enable and start the service:

    ```sh
    systemctl --user enable --now monitor-hotplug.service
    ```

## License

DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE

---

**Feel free to fork and contribute!**
