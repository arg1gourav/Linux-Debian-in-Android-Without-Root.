# Linux-Debian-in-Android-Without-Root

From this repository, you will learn how to use a full Linux Debian system inside Android **without root access** using Proot + XSDL.  
This is the **smoothest, lightest, and fastest method** available for running Linux on Android.

---

## Requirements:

- At least **6GB free internal storage**.
- A **decent CPU** and **4GB RAM** for smooth performance.

---

## Required Apps:

- **Termux** (Download from [F-Droid](https://f-droid.org/en/packages/com.termux/))
- **XSDL XServer** (Download from [Play Store](https://play.google.com/store/apps/details?id=x.org.server.vnc) or APK source)

---

# The Process:

Before starting, make sure you have a stable Wi-Fi connection. The process will consume around **200-300MB of data**.

---

## Step 1: Setting Up Termux

Open **Termux** and type the following commands one by one:

### 1. Update Termux packages:
```
pkg update -y
```

### 2. Install proot-distro:
```
pkg install proot-distro -y
```

![Installing proot-distro](./images/proot.png)

---

## Step 2: Installing Debian in Termux

### 1. Install Debian:
```
proot-distro install debian
```

### 2. Login into Debian:
```
proot-distro login debian
```

![Debian Installation](./images/debian-install.png)

---

## Step 3: Inside Debian Environment

Once inside Debian, run the following commands one by one:

```
apt update -y
apt install lxde-core lxappearance lxterminal -y
```

- It will ask for the keyboard layout.
- **Type `1` and press Enter**.

![LXDE Installation](./images/lxde-install.png)

```
apt install dbus-x11 pulseaudio -y
```

### Create and enable swap file for smooth performance:
```
fallocate -l 3G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
```

### After completing all, logout:
```
logout
```

![Swapfile Creation](./images/swapfile.png)

---

## Step 4: Configure Debian Launch Script in Termux

Back in **Termux Home**, create a launch script:

```
nano ./debian.sh
```

Copy & paste the following script into the file:

```
#!/data/data/com.termux/files/usr/bin/bash

proot-distro login debian --shared-tmp -- bash -c '
  export DISPLAY=127.0.0.1:0
  export PULSE_SERVER=tcp:127.0.0.1:4713
  swapon /swapfile 2>/dev/null || true
  startlxde
'
```

- Press **Ctrl + X**, then **Y**, then **Enter** to save the file.

### Make the script executable:
```
chmod +x ./debian.sh
```

![Script Setup](./images/script-setup.png)

---

## Step 5: Launching Debian with GUI

1. **Open the XSDL XServer app** and wait until the blue screen appears.
2. Go back to **Termux** and run:
```
./debian.sh
```

3. Return to **XSDL XServer** to see Debian running with GUI.

![Debian Running](./images/debian-running.png)

---

## 🎉 Done!  
Now every time you want to open Debian, just run this command in Termux:

```
./debian.sh
```

# Linux-Debian-in-Android-Without-Root

From this repository, you will learn how to use a full Linux Debian system inside Android **without root access** using Proot + XSDL.  
This is the **smoothest, lightest, and fastest method** available for running Linux on Android.

---

## Requirements:

- At least **6GB free internal storage**.
- A **decent CPU** and **4GB RAM** for smooth performance.

---

## Required Apps:

- **Termux** (Download from [F-Droid](https://f-droid.org/en/packages/com.termux/))
- **XSDL XServer** (Download from [Play Store](https://play.google.com/store/apps/details?id=x.org.server.vnc) or APK source)

---

# The Process:

Before starting, make sure you have a stable Wi-Fi connection. The process will consume around **200-300MB of data**.

---

## Step 1: Setting Up Termux

Open **Termux** and type the following commands one by one:

### 1. Update Termux packages:
```
pkg update -y
```

### 2. Install proot-distro:
```
pkg install proot-distro -y
```

![Installing proot-distro](./images/proot.png)

---

## Step 2: Installing Debian in Termux

### 1. Install Debian:
```
proot-distro install debian
```

### 2. Login into Debian:
```
proot-distro login debian
```

![Debian Installation](./images/debian-install.png)

---

## Step 3: Inside Debian Environment

Once inside Debian, run the following commands one by one:

```
apt update -y
apt install lxde-core lxappearance lxterminal -y
```

- It will ask for the keyboard layout.
- **Type `1` and press Enter**.

![LXDE Installation](./images/lxde-install.png)

```
apt install dbus-x11 pulseaudio -y
```

### Create and enable swap file for smooth performance:
```
fallocate -l 3G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
```

### After completing all, logout:
```
logout
```

![Swapfile Creation](./images/swapfile.png)

---

## Step 4: Configure Debian Launch Script in Termux

Back in **Termux Home**, create a launch script:

```
nano ./debian.sh
```

Copy & paste the following script into the file:

```
#!/data/data/com.termux/files/usr/bin/bash

proot-distro login debian --shared-tmp -- bash -c '
  export DISPLAY=127.0.0.1:0
  export PULSE_SERVER=tcp:127.0.0.1:4713
  swapon /swapfile 2>/dev/null || true
  startlxde
'
```

- Press **Ctrl + X**, then **Y**, then **Enter** to save the file.

### Make the script executable:
```
chmod +x ./debian.sh
```

![Script Setup](./images/script-setup.png)

---

## Step 5: Launching Debian with GUI

1. **Open the XSDL XServer app** and wait until the blue screen appears.
2. Go back to **Termux** and run:
```
./debian.sh
```

3. Return to **XSDL XServer** to see Debian running with GUI.

![Debian Running](./images/debian-running.png)

---

## 🎉 Done!  
Now every time you want to open Debian, just run this command in Termux:

```
./debian.sh
```

Enjoy full Linux Debian on your Android device — **no root needed!**

---

## Screenshots:

| Installing proot-distro | Debian Installation | LXDE Installation |
|------------------------|--------------------|------------------|
| ![Proot](./images/proot.png) | ![Debian Install](./images/debian-install.png) | ![LXDE Install](./images/lxde-install.png) |

| Swapfile Creation | Script Setup | Debian Running |
|------------------|-------------|---------------|
| ![Swapfile](./images/swapfile.png) | ![Script](./images/script-setup.png) | ![Debian](./images/debian-running.png) |

---

## License:
**MIT License**  
Free for personal and commercial use.￼Enter
