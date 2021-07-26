# Install notes ubuntu server + Azure Pipelines Agent

Image: Ubuntu server 18.04 preinstalled server image

```
sudo useradd -G sudo -m pi
sudo passwd pi
sudo usermod --shell /bin/bash pi
sudo hostnamectl set-hostname buildbot64
echo 'APT::Get::Assume-Yes "true";' | sudo tee /etc/apt/apt.conf.d/90assumeyes
echo '%sudo ALL=(ALL) NOPASSWD:ALL' | sudo tee -a /etc/sudoers
```

```
sudo nano /etc/netplan/50-cloud-init.yaml
```

```yaml
network:
    ethernets:
        eth0:
            dhcp4: true
            optional: true
    version: 2
    wifis:
        wlp3s0:
            optional: true
            access-points:
                "SSID-NAME-HERE":
                    password: "PASSWORD-HERE"
            dhcp4: true
```

```
sudo netplan apply
```

```
sudo apt update
sudo apt dist-upgrade -y
sudo apt install -y avahi-daemon net-tools
sudo systemctl enable ssh
curl -sL get.docker.com | sh
sudo usermod -aG docker $USER
sudo reboot
```

```
mkdir agent
cd agent
curl -SsL https://vstsagentpackage.azureedge.net/agent/2.186.1/vsts-agent-linux-arm64-2.186.1.tar.gz | tar -xz
bash ./config.sh
sudo bash ./svc.sh install
sudo bash ./svc.sh start
```

Note: arm32 is just "arm" in the download link
