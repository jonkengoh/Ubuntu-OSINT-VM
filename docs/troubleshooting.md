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