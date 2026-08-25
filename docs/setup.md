# VM Setup

## 0. Download Ubuntu 26.04 LTS

Download Ubuntu from https://ubuntu.com/download/desktop:
![Ubuntu Download screen](images/vm-creation/01-ubuntu-download.png)
Select ARM 64-bit Architecture for ARM-based hardware.

You should see the download confirmation:
![Ubuntu Download Success screen](images/vm-creation/02-ubuntu-download-confirm.png)

## 1. Create the Virtual Machine

Open UTM and select **Create a New Virtual Machine**.

![UTM VM creation screen](images/vm-creation/03-create-vm.png)

Select **Virtualize** rather than Emulate.

![Virtualize selection](images/vm-creation/04-select-virtualize.png)

---

## 2. Select the Operating System

Select **Linux** from the list:

![Linux VM configuration](images/vm-creation/05-select-linux.png)

Provide the Ubuntu ARM64 installation image and select Apple Virtualization:
![Linux VM configuration](images/vm-creation/06-select-arm64iso.png)


---

## 3. Configure VM Resources

Configure the VM with:

| Resource | Configuration |
|---|---|
| CPU | 4 cores |
| Memory | 8 GB |
| Storage | 80 GB |

![VM resource configuration](images/vm-creation/07-vm-resources-1.png)

![VM resource configuration](images/vm-creation/08-vm-resources-2.png)

Press next for everything; *skip* **file sharing/shared directory** for now.

---

## 4. Configure Networking

Use shared/NAT networking for the initial environment.

![Network configuration](images/vm-creation/09-networking.png)