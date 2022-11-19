# framework_popos_config
changes to make on pop os (starting 22.04) on framework laptop to get full functionality 


## Basics

```bash
#### update & upgrade & basic text edit ####
sudo apt update && sudo apt upgrade
# vim if you want it. otherwise nano and others work too
sudo apt install -y vim

#### enable fingerprint reader ####
./FP_Reader_install.sh
# (later you can do the recommended OS upgrade if you haven't created any fingerprints.
# just delete all fingerprints before updating if you have created some)

# go into boot loader and blacklist the ambient light sensor
sudo vim /etc/modprobe.d/framework-als-blacklist.conf
# in here add 
blacklist hid_sensor_hub
# save and run
sudo update-initramfs -u

```

- do recommended firmware update
- reboot
- make sure everything is up to date on os and firmware and brightness keys work

## Personal User App Checklist

- install vscode deb through Pop! Shop or browser
  ```bash
  # then install my settings/shortcuts
  git clone git@github.com:pwolfe8/vscode_profile.git
  bash sync_profile_to_linux_settings_dir.sh
  ```
others
- audacity
- cheese
- slack 
- spotify
- steam





