# MilouXplorer

**MilouXplorer** is a lightweight project developed by members of **EPFAstomnomie** (Cachan, Paris) for the **CSPACE** student aerospace competition.

This repository contains the minimal software `stack` and hardware interface code designed to control and monitor our exploration rover prototype.

[TODO] Add relevant stuff in due time

Competition: [CSPACE](https://cspace.fr/)  

## Program Firmware
```bash
openocd -f interface/stlink.cfg -f target/stm32g4x.cfg -c "program bin/cmd_led verify reset exit"
```

## Setup USB for wsl
See documentation : [Connect USB Devices](https://learn.microsoft.com/en-us/windows/wsl/connect-usb#install-the-usbipd-win-project)
```bash
usbipd list    
usbipd bind --busid 4-4
usbipd attach --wsl --busid <busid>
```

## Setup debug terminal for wsl
```bash
sudo screen /dev/ttyACM0 115200
```

Exit and Close	`Ctrl + A` then `K`

## 🧩 Development Workflow

### 🐞 Issues
Create an issue following this naming convention:

- **AAU** — As A User  
- **AAD** — As A Developer  
- **AAT** — As A Tester  

Then add the **subject** of the issue.  
> Example: `AAD, I should fix the bug of the servo`

You can assign **labels** and/or **milestones** to make your ticket more precise.

Once the issue is created, **create a branch for it** *(preferably based on `main`)*.

---

### 💬 Commits
When committing, include the **issue number** and a short sentence describing the changes.

> Example:  
> `#23: Servo bug fixed by adjusting PWM timing`

---

### 🔀 Pull Requests
Before merging your changes, **create a Pull Request** linked to the issue and **assign a reviewer**.

⚠️ **You cannot merge without a review!**

---















