paccache -ruk0
paccache -rk1
pacman -Sc
yay -Sc --aur
journalctl --vacuum-time=3d
journalctl --vacuum-size=100M
rm -rf ~/.cache/thumbnails/*
