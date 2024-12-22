# Mpv conf

## Install uosc

- https://github.com/tomasklaen/uosc

```bash
mkdir -p  ~/.config/mpv/{fonts,scripts,script-opts}
wget -q -O /tmp/uosc.zip https://github.com/tomasklaen/uosc/releases/latest/download/uosc.zip
unzip -d ~/.config/mpv /tmp/uosc.zip
rm -f /tmp/uosc.zip

wget -q -O ~/.config/mpv/script-opts/uosc.conf https://github.com/tomasklaen/uosc/releases/latest/download/uosc.conf
```
