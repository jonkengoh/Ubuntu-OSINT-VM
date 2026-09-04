# Package Shell script Setup

Using nano inside scripts directory:

```bash
cd scripts/
sudo nano packages.sh
```

Fill in the following code:

![Package shell script contents](images/03-vm-update-scripts/01-create-package-shell-script.png)


Change permissions and run the shell script:

```bash
chmod +x packages.sh
./packages.sh
```

![Run package shell script](images/03-vm-update-scripts/02-run-package-shell-script.png)


# Unattended Security Update (USU) Setup 


Check current Ubuntu configurations:

```bash
apt policy unattended-upgrades
```

![Check policy](images/03-vm-update-scripts/03-check-uu-policy.png)

```bash
systemctl status unattended-upgrades --no-pager
```

![Check systemctl](images/03-vm-update-scripts/04-check-systemctl-status.png)

```bash
grep -R "Unattended-Upgrade" /etc/apt/apt.conf.d/ 2>/dev/null
```

![Grep](images/03-vm-update-scripts/05-grep-r.png)





```bash
cat /etc/apt/apt.conf.d/20auto-upgrades
sudo unattended-upgrade --dry-run --debug
```

![Check policy](images/03-vm-update-scripts/06-check-uu-status.png)


## If USU is not configured:

Add this shell script

```bash
cd scripts/
sudo nano security_updates.sh
```

![Check systemctl](images/03-vm-update-scripts/07-create-sus.png)

Run the file to configure automatic security updates

```bash
chmod +x security_updates.sh
./security_updates.sh
```

![Grep](images/03-vm-update-scripts/08-run-sus.png)
