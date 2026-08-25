# Ubuntu-OSINT-VM

A reproducible Ubuntu Linux virtual machine environment designed for Open-Source Intelligence (OSINT) coursework, research, and general OSINT practice.

The project focuses on building a clean, maintainable, and reproducible ARM64 Linux environment on Apple Silicon while documenting the configuration and automation required to recreate the environment from a fresh installation.

The virtual machine itself is not stored in this repository. Instead, the repository contains documentation, configuration, setup scripts, verification tools, and other resources required to reproduce the environment.

⸻

## Project Goals

* Provide a clean Linux environment for OSINT coursework and practice.
* Document the VM architecture and configuration.
* Automate repeatable system setup tasks.
* Make the environment reproducible from a fresh Ubuntu installation.
* Maintain a clear separation between generic system configuration and course-specific tooling.
* Account for ARM64 compatibility when selecting software and tools.
* Demonstrate practical Linux administration and software engineering practices.
* Provide clear troubleshooting and recovery documentation.

⸻

## Architecture

The initial environment is designed for Apple Silicon hardware.

| Component | Configuration |
|---|---|
| Host | Apple Silicon MacBook Pro |
| Host Architecture | ARM64 / Apple Silicon |
| Virtualization | UTM |
| Guest OS | Ubuntu 26.04 LTS |
| Guest Architecture | ARM64 / AArch64 |
| CPU | 4 vCPU |
| Memory | 8 GB RAM |
| Storage | 80 GB virtual disk |
| Networking | NAT / Shared Networking |

The VM configuration may be adjusted as the requirements of the OSINT coursework become clearer.

### ARM64 Compatibility

Because the host system uses Apple Silicon, ARM64 compatibility is an important consideration throughout the project.

Software added to the environment will be evaluated for:

* Native ARM64 support
* Ubuntu ARM64 compatibility
* Required dependencies
* Availability of ARM64 packages or binaries
* Whether x86_64 emulation is practical
* Availability of suitable alternatives

x86_64-only tools will not be assumed to work correctly on the native ARM64 VM.

Architecture limitations and workarounds will be documented when necessary.

⸻

## Reproducibility

The virtual machine is treated as a disposable environment, while the repository acts as the source of truth for its configuration.


```
The intended workflow is:

Fresh Ubuntu ARM64 VM
        │
        ▼
Clone repository
        │
        ▼
Run bootstrap script
        │
        ▼
Install and configure environment
        │
        ▼
Run verification
        │
        ▼
Known-good OSINT environment
```

The eventual goal is to support a workflow similar to:

git clone <repository-url>
cd ubuntu-osint-vm
./scripts/bootstrap.sh

Setup scripts should be designed to be as idempotent as practical, with explicit dependencies, useful error messages, and verification of important configuration.

Package versions will generally follow the supported Ubuntu repositories unless a specific version is required for compatibility or reproducibility.

⸻

## Project Scope

The project is intentionally being developed incrementally.

### Base Environment

The initial environment focuses on general-purpose Linux functionality rather than immediately installing a large collection of OSINT tools.

Planned base components include:

* Ubuntu system updates
* Git
* Python
* Essential command-line utilities
* Basic shell configuration
* Environment verification
* Documentation and troubleshooting

### OSINT Environment

OSINT-specific tooling will be added as requirements become known.

Each tool will be assessed for:

1. ARM64 compatibility
2. Ubuntu compatibility
3. Installation method
4. Dependencies
5. Version requirements
6. Security considerations
7. Verification requirements
8. Documentation requirements

Course-specific tooling will be kept separate from the generic base environment where appropriate.

⸻

## Security Considerations

An OSINT workstation may handle potentially sensitive research material, credentials, downloaded files, and investigation artifacts.

The environment therefore follows several security principles:

* The VM should remain isolated from the host where practical.
* Credentials and API keys must not be committed to Git.
* .env files containing secrets must remain untracked.
* Browser profiles and cookies must not be committed.
* Private investigation data must remain outside the repository.
* Downloaded files should be handled carefully.
* VM networking should use the least permissive configuration appropriate for the task.
* The VM should not be treated as an anonymity or privacy solution by itself.
* Course-specific security requirements should be documented as they are introduced.

Sensitive investigation data should remain separate from the Git repository.

⸻

## Repository Structure

The repository is intentionally kept small during the initial development stages.

```
ubuntu-osint-vm/
├── README.md
├── LICENSE
├── .gitignore
│
├── docs/
│   ├── architecture.md
│   ├── setup.md
│   └── troubleshooting.md
│
├── scripts/
│   ├── bootstrap.sh
│   ├── packages.sh
│   └── verify.sh
│
└── config/
    └── README.md
```
The structure will evolve as additional requirements are introduced.

OSINT-specific tools and configurations will only be added when there is a clear requirement for them.

⸻

## Development Phase Progress

### Phase 1 — Architecture

* ✅ Select virtualization platform (UTM) 
* ✅ Select Ubuntu release (Ubuntu 26.04 LTS ARM64) 
* ✅ Select ARM64 architecture
* ✅ Define initial VM resources (4 vCPU / 8 GB RAM / 80 GB disk)
* ✅ Define initial networking approach (Networking NAT / Shared Networking)
* ✅ Document final architecture

### Phase 2 — Repository Initialization

* ✅ Create repository
* ✅ Add README
* ✅ Add .gitignore
* ✅ Add documentation structure
* ✅ Document VM configuration

### Phase 3 — VM Creation

* ✅ Obtain Ubuntu ARM64 installation image
* ✅ Create UTM VM
* ✅ Configure CPU and memory
* ✅ Configure virtual storage
* ✅ Configure networking
* ✅ Install Ubuntu
* ✅ Verify guest architecture
* Create clean baseline snapshot

### Phase 4 — Base Environment

* Implement system update process
* Define base package list
* Configure Git
* Configure Python
* Add useful CLI utilities
* Implement bootstrap script
* Implement verification script

### Phase 5 — Reproducibility

* Test setup from a clean VM
* Improve idempotency
* Document recovery procedures
* Document known limitations
* Verify the environment after rebuilding

Phase 6 — OSINT Tooling

Course-specific requirements will be evaluated and incorporated as they become available.

* Assess required OSINT tools
* Check ARM64 compatibility
* Implement installation procedures
* Add configuration where required
* Add verification
* Document tool-specific limitations

⸻

## Snapshots and Backups

VM snapshots are intended primarily for convenient rollback during development and configuration changes.

They are not considered the source of truth for environment reproducibility.

The repository provides the reproducible configuration, while VM backups provide disaster recovery and snapshots provide convenient rollback points.

Example milestones may include:
```
Fresh Ubuntu Installation
        │
        ▼
Base Environment Complete
        │
        ▼
Course Environment Complete
```

The exact snapshot strategy may evolve as the environment grows.

⸻

## Git Workflow

Changes are intended to be committed incrementally using descriptive Conventional Commit-style messages.

### Examples:
```
chore: initialize repository structure
docs: add Ubuntu VM setup guide
docs: document VM architecture
feat: add bootstrap script
feat: add base package installation
test: add environment verification
fix: correct package installation handling
refactor: simplify bootstrap configuration
docs: document course-specific tooling
```
Commits should represent logical changes rather than large collections of unrelated modifications.

⸻

## Current Status

### Phase 1 — Architecture ✅

The initial architecture has been defined:

* UTM
* Ubuntu 26.04 LTS
* ARM64 / AArch64
* 4 vCPU
* 8 GB RAM
* 80 GB virtual storage
* NAT / Shared Networking

The next stage is creation of the initial Ubuntu ARM64 virtual machine.

⸻

## License

This project is licensed under the terms described in [`LICENSE`](LICENSE).