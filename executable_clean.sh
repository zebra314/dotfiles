paccache -ruk0;
paccache -rk1;
pacman -Sc;
journalctl --vacuum-size=100M;
journalctl --vacuum-time=2weeks;
