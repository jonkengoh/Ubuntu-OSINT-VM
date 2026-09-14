## Ubuntu Archive Mirror Returns HTTP 403

### Symptom

`apt upgrade` fails while downloading packages from the Singapore Ubuntu
archive with an HTTP 403 Forbidden response.

### Diagnosis

The VM had working network connectivity and DNS resolution. The affected
package was accessible from `archive.ubuntu.com`, indicating that the issue
was specific to the configured Singapore mirror.

### Resolution

The active Ubuntu repository in `/etc/apt/sources.list.d/ubuntu.sources`
was changed from the Singapore archive to the main Ubuntu archive.

### Verification

`apt update` and `apt upgrade` completed successfully after changing the
archive.



## APT failures caused by incorrect VM time

### Symptoms

APT package installation may fail with errors such as:

* Release file ... is not valid yet
* HTTP 404 errors for packages that should exist
* Package metadata appearing inconsistent or unavailable

For example:
```
Error: Release file for http://archive.ubuntu.com/ubuntu/dists/resolute-updates/InRelease
is not valid yet
```
### Diagnosis

First, check whether the VM’s system clock is synchronized:
```
timedatectl
```
The important field is:
```
System clock synchronized: yes
```
It can also be checked directly with:
```
timedatectl show --property=NTPSynchronized --value
```
If this returns:
```
no
```
the VM’s clock may be incorrect.

Check which time synchronization service is available:
```
systemctl list-unit-files | grep -E 'chrony|timesyncd'
```
On this VM, systemd-timesyncd was not available, but Chrony was installed and enabled.

Check Chrony’s synchronization sources:
```
chronyc sources -v
```
A source marked with ^* indicates that Chrony has selected it as the active synchronization source.

For example:
```
^* ntp-nts-3.ps5.canonical.> ...
```
After synchronization, verify again:
```
timedatectl show --property=NTPSynchronized --value
```
The expected result is:
```
yes
```
### Resolution

Once the VM clock was synchronized through Chrony, APT was able to validate repository metadata correctly.

Run:
```
sudo apt update
```
Then retry the previously failing package installation:
```
sudo apt install -y python3-pip python3-venv
```
Verification

Confirm that the package installation completed successfully:
```
python3 -m pip --version
python3 -m venv --help
```
The VM verification script also checks time synchronization:
```
./scripts/verify.sh
```
A successful result should include:
```
Time synchronization:
NTP synchronization: OK
```
### Notes

This issue was initially observed as an APT package download/metadata problem. Checking the system clock revealed that the underlying issue was time synchronization rather than package availability or an incorrect repository configuration.

When APT reports that a Release file is “not valid yet”, checking the VM’s system time should therefore be part of the initial diagnosis.