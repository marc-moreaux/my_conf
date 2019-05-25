
xrandr --output VGA1 --properties --mode 1920x1080_60.00 --right-of LVSD1
mkdir /media/mmoreaux/Data
mkdir /media/mmoreaux/windows
mount /dev/sda3 /media/mmoreaux/Data -o gid=mmoreaux -o uid=mmoreaux -o fmask=133 -o dmask=002
mount /dev/sda2 /media/mmoreaux/windows -o gid=mmoreaux -o uid=mmoreaux -o fmask=133 -o dmask=002
