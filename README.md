# Iridium_9603N_Mini_Beacon


A 68g version of the [Iridium 9603N Beacon](https://github.com/PaulZC/Iridium_9603_Beacon) (without eRIC4/9 radio support)
.

Suitable for high altitude ballooning and many other asset tracking applications.

![Mini_Beacon](https://github.com/PaulZC/Iridium_9603N_Mini_Beacon/blob/master/img/Mini_Beacon.JPG)

This version is powered by a single Energiser® Ultimate Lithium L522 (PP3) 9V battery, which helps keep the design as compact as possible.

To keep the size and weight as low as possible, it does not include the [eRIC4/9 radio link](https://github.com/PaulZC/Iridium_Beacon_Radio_Board)
which you would need to control a [cut-down device](https://github.com/PaulZC/Balloon_Cut-Down_Device). If you need the radio link, have a look at
the [Iridium Mini Radio Beacon](https://github.com/PaulZC/Iridium_Mini_Radio_Beacon) instead.

The Iridium 9603N transceiver and u-blox MAX-M8Q GNSS receiver share a single Maxtena M1600HCT-P-SMA antenna, again to keep the weight as low as possible.
The antenna sharing circuit has been flight tested on the [Iridium 9603N Solar Beacon](https://github.com/PaulZC/Iridium_9603N_Solar_Beacon).

Full details of how to track your beacon via the Rock7 RockBLOCK Gateway are included in the
[Iridium 9603N Beacon repo](https://github.com/PaulZC/Iridium_9603_Beacon/blob/master/RockBLOCK.md).

[ASSEMBLY.md](https://github.com/PaulZC/Iridium_9603N_Mini_Beacon/blob/master/ASSEMBLY.md) describes how to assemble the PCB.

The [Arduino folder](https://github.com/PaulZC/Iridium_9603N_Mini_Beacon/tree/master/Arduino) contains the code for the SAMD21 processor.
You can find the [programming instructions](https://github.com/PaulZC/Iridium_9603_Beacon/blob/master/LEARN.md#how-do-i-install-the-atsamd21g18-bootloader)
and [upload instructions](https://github.com/PaulZC/Iridium_9603_Beacon/blob/master/LEARN.md#how-do-i-upload-the-arduino-code) in the Iridium 9603N Beacon repo.

The Eagle files are available in the [Eagle folder](https://github.com/PaulZC/Iridium_9603N_Mini_Beacon/tree/master/Eagle).

The schematic, dimensions and BOM are available [here](https://github.com/PaulZC/Iridium_9603N_Mini_Beacon/blob/master/Iridium_9603N_Mini_Beacon.pdf).

The [OpenSCAD folder](https://github.com/PaulZC/Iridium_9603N_Mini_Beacon/tree/master/OpenSCAD) contains .scad and .stl files for the 3D-printed cover.

## Licence

This project is distributed under a Creative Commons Attribution + Share-alike (BY-SA) licence.
Please refer to section 5 of the licence for the "Disclaimer of Warranties and Limitation of Liability".

Enjoy!

**_Paul_**


