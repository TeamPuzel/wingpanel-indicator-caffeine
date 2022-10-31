
meson build --prefix=/usr
cd build
ninja

sudo ninja install

killall io.elementary.wingpanel
