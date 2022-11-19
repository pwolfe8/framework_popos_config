# Framework Laptop, Pop! OS 22.04 Config

Changes to make on Pop! OS 22.04 installation on Framework laptop to get full functionality.


## Basics

```bash
#### update & upgrade & basic text edit ####
sudo apt update && sudo apt upgrade
# vim if you want it. otherwise nano and others work too
sudo apt install -y vim

#### enable fingerprint reader ####
# Found this script from an Elevated Systems youtube video:
./FP_Reader_install.sh
# (later you can do the recommended OS upgrade if you haven't created any fingerprints.
# just delete all fingerprints before updating if you have created some)

#### 3.5 mm jack microphone enable ####
sudo vim /etc/modprobe.d/alsa-base.conf
# in here add
options snd-hda-intel model=dell-headset-multi
# save & quit

#### fix brightness buttons ####
# go into boot loader and blacklist the ambient light sensor
sudo vim /etc/modprobe.d/framework-als-blacklist.conf
# in here add 
blacklist hid_sensor_hub
# save & quit and run
sudo update-initramfs -u

#### suspend mode power savings ####
sudo kernelstub -a nvme.noacpi=1
sudo kernelstub -a mem_sleep_default=deep
```

### Update Firmware & Restart

- do recommended firmware update
- reboot
- make sure everything is up to date on os and firmware and brightness keys work

### Other Power Savings???
Not sure if it works, but if you want to you can follow whichever other things you see fit from [framework blog thread](<https://community.frame.work/t/linux-battery-life-tuning/6665>) 
- I skipped the panel self refresh since after doing all the upgrades my kernel was 6.0.6


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

## Tips

- to reboot into bios:
    ```
    systemctl reboot --firmware-setup
    ```

## Troubleshooting

### Audio

If pipewire gets masked during some upgrade somehow:
```bash
sudo apt reinstall pipewire pipewire-bin pipewire-pulse
systemctl --user --now enable pipewire pipewire-pulse
```





