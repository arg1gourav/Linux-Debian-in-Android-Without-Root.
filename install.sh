#!/data/data/com.termux/files/usr/bin/bash

# ----------- Debian Install Script for Termux (No Root) -----------
# Author: Gourav's Custom Installer
# License: MIT

set -e

# Step 1: Update Termux and install proot-distro
pkg update -y
pkg upgrade -y
pkg install proot-distro -y

# Step 2: Install Debian
proot-distro install debian

# Step 3: Login to Debian and setup environment
proot-distro login debian -- bash -c "\
  apt update -y && \
  apt install lxde-core lxappearance lxterminal dbus-x11 pulseaudio -y && \
  fallocate -l 3G /swapfile && \
  chmod 600 /swapfile && \
  mkswap /swapfile && \
  swapon /swapfile && \
  echo '✔️ LXDE and swapfile setup complete inside Debian.'"

# Step 4: Create Debian launch script in Termux
cat > ~/debian.sh <<'EOF'
#!/data/data/com.termux/files/usr/bin/bash

proot-distro login debian --shared-tmp -- bash -c '
  export DISPLAY=127.0.0.1:0
  export PULSE_SERVER=tcp:127.0.0.1:4713
  swapon /swapfile 2>/dev/null || true
  startlxde
'
EOF

chmod +x ~/debian.sh

echo "\n🎉 Done! To launch Debian GUI, run: ./debian.sh inside Termux and open XSDL app on blue screen."
￼Enter
