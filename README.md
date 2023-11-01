# Frappuccino

A dirty response to dev's skill issues in installing Caffeine

## What is Frappuccino?

Following the Caffeine, Espresso and so on trend, Frappuccino is probably the most lightweight way to keep your Linux system awake forcefully.

## Why not Caffeine?

I am aware that this is probably just a problem of mine, but I can't seem to install Caffeine on Arch for some obscure reason so I wrote my version.

## How does it work?

Frappuccino is just a quick wrapper around systemd-inhibit that creates a service and an infinite 2-seconds loop logging in the service logs.
The logging loop is the argument to systemd-inhibit that will thus prevent any shutdown/sleep/hibernation to happen.

## Is it safe / compatible with ...?

Honestly, who knows. But being an innocent script and provided you don't have any other frappuccino named services, the worse that can happens is that it does not work.

## Installation

Clone or download this repository in your /home/username/ directory.

    cd
    git clone https://github.com/thecookingsenpai/frappuccino
    cd frappuccino

Now give the installation file the right permissions and execute it:

    chmod +x install.sh
    ./install.sh

Done!

## Management

To inspect the service:

    sudo systemctl status frappuccino

This should show you some logs lines with the most recent timestamp.

To start/stop the service:

    sudo systemctl start frappuccino
    sudo systemctl stop frappuccino
    sudo systemctl restart frappuccino

The service is automatically enabled for autostart. You can remove it with:

    sudo systemctl disable frappuccino

And, vice versa:

    sudo systemctl enable frappuccino

## Performances and workload

Having a 2 seconds sleep, this script is basically guaranteed to have 0 impact on performance even on small systems like a Raspberry Pi 0 (on which I am aware isn't needed but you get the point).

## License

This software is released under the CC BY-NC-SA 4.0 License.
