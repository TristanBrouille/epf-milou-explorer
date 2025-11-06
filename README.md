# MilouXplorer

**MilouXplorer** is a lightweight project developed by members of **EPFAstomnomie** (Cachan, Paris) for the **CSPACE** student aerospace competition.

This repository contains the minimal software stack and hardware interface code designed to control and monitor our exploration rover prototype.

[TODO] Add relevant stuff in due time

Competition: [CSPACE](https://cspace.fr/)  

## Program Firmware
```bash
openocd -f interface/stlink.cfg -f target/stm32g4x.cfg -c "program bin/cmd_led verify reset exit"
```

usbipd list    
- usbipd bind --busid 4-4
- usbipd attach --wsl --busid <busid>







