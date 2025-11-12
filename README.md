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
## Workflow Dev
### Issues
Make a issue with the nomenclature :
* AAU : As A User
* AAD : As A Developper
* AAT : As A Tester   
And the subjet of the issue   
*ex : AAD, I should fix the bug of servo*   
You can affect a label and/or milestone for precise your ticket
Finish by creat the branch (*preferably on main*)

### Commit 
Commit with the number of the issue and a short sentence describing the changes.   
*ex : #23: bug of servo resolve by the ...*

### Pull Request
Befor appling changes create a pull request of your issue, assign a reviewer. **You can't merge without reviewing !**












