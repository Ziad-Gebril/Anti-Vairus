# Antivirus Tool

A simple Bash tool that monitors a folder for suspicious files, moves them to quarantine, and allows restoring them.

## 1. Overview & Folder Hierarchy

* `antivirus.sh` - Monitors the folder for dangerous extensions and keywords.
* `restore.sh` - Interactive script to view, restore, or delete quarantined files.
* `makefile.sh` - Main launcher menu for the tool.

```
Anti Vairus/
├── antivirus.sh
├── restore.sh
├── makefile.sh
├── dir/
└── malicious_dir/
```

## 2. Prerequisites & Ubuntu Installation

No special installation is required. Uses standard Linux commands (`bash`, `grep`, `coreutils`).

To ensure permissions are set:
```bash
chmod +x *.sh
```

## 3. How to Run

### Run the Antivirus
```bash
./antivirus.sh
```

### Run the Menu (Antivirus / Restore / Setup)
```bash
./makefile.sh
```

### Run Restore Directly
```bash
./restore.sh
```

## 4. Flagged Extensions & Keywords Location

The flagged arrays are defined at the top of `antivirus.sh` (lines 8–9):

```bash
malicious_ex=("exe" "bat" "vbs" "scr" "ps1")
malicious_key=("virus" "trojan" "malware" "worm" "ransomware")
```
