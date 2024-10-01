<a name="TOP"></a>
# Typhon-scad
Cerberus-revised for MGN rails

![Main Assembly](assemblies/main_assembled.png)

<span></span>

---
## Table of Contents
1. [Parts list](#Parts_list)
1. [Idler Bearing Assembly](#idler_bearing_assembly)
1. [Idler Assembly](#idler_assembly)
1. [Top Corner Assembly](#top_corner_assembly)
1. [Bottom Motor Mount Assembly](#bottom_motor_mount_assembly)
1. [Bed Mount Right Assembly](#bed_mount_right_assembly)
1. [Bed Mount Left Assembly](#bed_mount_left_assembly)
1. [Bottom Extrusion Assembly](#bottom_extrusion_assembly)
1. [Bottom Corner Assembly](#bottom_corner_assembly)
1. [Carriage Assembly](#carriage_assembly)
1. [Upright Assembly](#upright_assembly)
1. [Main Assembly](#main_assembly)

<span></span>
[Top](#TOP)

---
<a name="Parts_list"></a>
## Parts list
| <span style="writing-mode: vertical-rl; text-orientation: mixed;">3 x Idler&nbsp;Bearing</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">3 x Idler</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">3 x Top&nbsp;Corner</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">3 x Bottom&nbsp;Motor&nbsp;Mount</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">3 x Bed&nbsp;Mount&nbsp;Right</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">3 x Bed&nbsp;Mount&nbsp;Left</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">3 x Bottom&nbsp;Extrusion</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">3 x Bottom&nbsp;Corner</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">3 x Carriage</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">3 x Upright</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">Main</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">TOTALS</span> |  |
|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|:---|
|  |  |  |  |  |  |  |  |  |  |  | | **Vitamins** |
| &nbsp;&nbsp;6&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;6&nbsp; | &nbsp;&nbsp; Ball bearing F625ZZ 5mm x 16mm x 5mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;9&nbsp; | &nbsp;&nbsp; Extrusion E2020 x 279.482mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp; Extrusion E4040 x 1000mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;3&nbsp; |  &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp; GT2 2018.57 |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp; Linear rail MGN12 x 800mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp; Linear rail carriage MGN12H |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;6&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;6&nbsp; | &nbsp;&nbsp; Nut M3 x 2.4mm nyloc |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;15&nbsp; | &nbsp;&nbsp;24&nbsp; | &nbsp;&nbsp;24&nbsp; | &nbsp;&nbsp;6&nbsp; | &nbsp;&nbsp;6&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;48&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;123&nbsp; | &nbsp;&nbsp; Nut M4 sliding T |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;9&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;18&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;27&nbsp; | &nbsp;&nbsp; Nut M5 sliding T |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp; Pulley GT2OB 20 teeth |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;12&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;12&nbsp; | &nbsp;&nbsp; Screw M3 cap x  8mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;12&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;12&nbsp; | &nbsp;&nbsp; Screw M3 cap x 10mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;6&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;6&nbsp; | &nbsp;&nbsp; Screw M3 cap x 20mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;6&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;6&nbsp; | &nbsp;&nbsp; Screw M3 grub x  6mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;12&nbsp; | &nbsp;&nbsp;24&nbsp; | &nbsp;&nbsp;24&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;48&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;108&nbsp; | &nbsp;&nbsp; Screw M4 cap x 10mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;6&nbsp; | &nbsp;&nbsp;6&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;12&nbsp; | &nbsp;&nbsp; Screw M5 cap x 10mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;9&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;18&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;27&nbsp; | &nbsp;&nbsp; Screw M5 cap x 14mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp; Screw M5 cap x 49mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;6&nbsp; | &nbsp;&nbsp; Screw M6 cap x 10mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp; Stepper motor NEMA17 x 47mm (5x24 shaft) |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;12&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;24&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;36&nbsp; | &nbsp;&nbsp; Washer  M3 x 7mm x 0.5mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;12&nbsp; | &nbsp;&nbsp;24&nbsp; | &nbsp;&nbsp;24&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;48&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;108&nbsp; | &nbsp;&nbsp; Washer  M4 x 9mm x 0.8mm |
| &nbsp;&nbsp;6&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;9&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;6&nbsp; | &nbsp;&nbsp;6&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;18&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;48&nbsp; | &nbsp;&nbsp; Washer  M5 x 10mm x 1mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;6&nbsp; | &nbsp;&nbsp; Washer rubber M6 x 12.5mm x 1.5mm |
| &nbsp;&nbsp;12&nbsp; | &nbsp;&nbsp;45&nbsp; | &nbsp;&nbsp;102&nbsp; | &nbsp;&nbsp;108&nbsp; | &nbsp;&nbsp;24&nbsp; | &nbsp;&nbsp;24&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;201&nbsp; | &nbsp;&nbsp;51&nbsp; | &nbsp;&nbsp;6&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;579&nbsp; | &nbsp;&nbsp;Total vitamins count |
|  |  |  |  |  |  |  |  |  |  |  | | **3D printed parts** |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;bed_mount_left.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;bed_mount_right.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;bottom_corner.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;bottom_motor_mount.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;carriage.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;idler.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;top_corner.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;21&nbsp; | &nbsp;&nbsp;Total 3D printed parts count |

<span></span>
[Top](#TOP)

---
<a name="idler_bearing_assembly"></a>
## 3 x Idler Bearing Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|6| Ball bearing F625ZZ 5mm x 16mm x 5mm|
|6| Washer  M5 x 10mm x 1mm|


### Assembly instructions
![idler_bearing_assembly](assemblies/idler_bearing_assembly_tn.png)

![idler_bearing_assembled](assemblies/idler_bearing_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="idler_assembly"></a>
## 3 x Idler Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|15| Nut M4 sliding T|
|12| Screw M4 cap x 10mm|
|3| Screw M5 cap x 49mm|
|12| Washer  M4 x 9mm x 0.8mm|
|3| Washer  M5 x 10mm x 1mm|


### 3D Printed parts

| 3 x idler.stl |
|---|
| ![idler.stl](stls/idler.png) 



### Sub-assemblies

| 3 x idler_bearing_assembly |
|---|
| ![idler_bearing_assembled](assemblies/idler_bearing_assembled_tn.png) 



### Assembly instructions
![idler_assembly](assemblies/idler_assembly.png)

![idler_assembled](assemblies/idler_assembled.png)

<span></span>
[Top](#TOP)

---
<a name="top_corner_assembly"></a>
## 3 x Top Corner Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|3| Extrusion E2020 x 279.482mm|
|24| Nut M4 sliding T|
|9| Nut M5 sliding T|
|24| Screw M4 cap x 10mm|
|9| Screw M5 cap x 14mm|
|24| Washer  M4 x 9mm x 0.8mm|
|9| Washer  M5 x 10mm x 1mm|


### 3D Printed parts

| 3 x top_corner.stl |
|---|
| ![top_corner.stl](stls/top_corner.png) 



### Sub-assemblies

| 3 x idler_assembly |
|---|
| ![idler_assembled](assemblies/idler_assembled_tn.png) 



### Assembly instructions
![top_corner_assembly](assemblies/top_corner_assembly.png)

![top_corner_assembled](assemblies/top_corner_assembled.png)

<span></span>
[Top](#TOP)

---
<a name="bottom_motor_mount_assembly"></a>
## 3 x Bottom Motor Mount Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|24| Nut M4 sliding T|
|3| Pulley GT2OB 20 teeth|
|12| Screw M3 cap x  8mm|
|6| Screw M3 grub x  6mm|
|24| Screw M4 cap x 10mm|
|3| Stepper motor NEMA17 x 47mm (5x24 shaft)|
|12| Washer  M3 x 7mm x 0.5mm|
|24| Washer  M4 x 9mm x 0.8mm|


### 3D Printed parts

| 3 x bottom_motor_mount.stl |
|---|
| ![bottom_motor_mount.stl](stls/bottom_motor_mount.png) 



### Assembly instructions
![bottom_motor_mount_assembly](assemblies/bottom_motor_mount_assembly.png)

![bottom_motor_mount_assembled](assemblies/bottom_motor_mount_assembled.png)

<span></span>
[Top](#TOP)

---
<a name="bed_mount_right_assembly"></a>
## 3 x Bed Mount Right Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|6| Nut M4 sliding T|
|6| Screw M5 cap x 10mm|
|3| Screw M6 cap x 10mm|
|6| Washer  M5 x 10mm x 1mm|
|3| Washer rubber M6 x 12.5mm x 1.5mm|


### 3D Printed parts

| 3 x bed_mount_right.stl |
|---|
| ![bed_mount_right.stl](stls/bed_mount_right.png) 



### Assembly instructions
![bed_mount_right_assembly](assemblies/bed_mount_right_assembly_tn.png)

![bed_mount_right_assembled](assemblies/bed_mount_right_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="bed_mount_left_assembly"></a>
## 3 x Bed Mount Left Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|6| Nut M4 sliding T|
|6| Screw M5 cap x 10mm|
|3| Screw M6 cap x 10mm|
|6| Washer  M5 x 10mm x 1mm|
|3| Washer rubber M6 x 12.5mm x 1.5mm|


### 3D Printed parts

| 3 x bed_mount_left.stl |
|---|
| ![bed_mount_left.stl](stls/bed_mount_left.png) 



### Assembly instructions
![bed_mount_left_assembly](assemblies/bed_mount_left_assembly_tn.png)

![bed_mount_left_assembled](assemblies/bed_mount_left_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="bottom_extrusion_assembly"></a>
## 3 x Bottom Extrusion Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|3| Extrusion E2020 x 279.482mm|


### Sub-assemblies

| 3 x bed_mount_left_assembly | 3 x bed_mount_right_assembly |
|---|---|
| ![bed_mount_left_assembled](assemblies/bed_mount_left_assembled_tn.png) | ![bed_mount_right_assembled](assemblies/bed_mount_right_assembled_tn.png) 



### Assembly instructions
![bottom_extrusion_assembly](assemblies/bottom_extrusion_assembly_tn.png)

![bottom_extrusion_assembled](assemblies/bottom_extrusion_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="bottom_corner_assembly"></a>
## 3 x Bottom Corner Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|3| Extrusion E2020 x 279.482mm|
|48| Nut M4 sliding T|
|18| Nut M5 sliding T|
|48| Screw M4 cap x 10mm|
|18| Screw M5 cap x 14mm|
|48| Washer  M4 x 9mm x 0.8mm|
|18| Washer  M5 x 10mm x 1mm|


### 3D Printed parts

| 3 x bottom_corner.stl |
|---|
| ![bottom_corner.stl](stls/bottom_corner.png) 



### Sub-assemblies

| 3 x bottom_extrusion_assembly | 3 x bottom_motor_mount_assembly |
|---|---|
| ![bottom_extrusion_assembled](assemblies/bottom_extrusion_assembled_tn.png) | ![bottom_motor_mount_assembled](assemblies/bottom_motor_mount_assembled_tn.png) 



### Assembly instructions
![bottom_corner_assembly](assemblies/bottom_corner_assembly.png)

![bottom_corner_assembled](assemblies/bottom_corner_assembled.png)

<span></span>
[Top](#TOP)

---
<a name="carriage_assembly"></a>
## 3 x Carriage Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|3| Linear rail carriage MGN12H|
|6| Nut M3 x 2.4mm nyloc|
|12| Screw M3 cap x 10mm|
|6| Screw M3 cap x 20mm|
|24| Washer  M3 x 7mm x 0.5mm|


### 3D Printed parts

| 3 x carriage.stl |
|---|
| ![carriage.stl](stls/carriage.png) 



### Assembly instructions
![carriage_assembly](assemblies/carriage_assembly_tn.png)

![carriage_assembled](assemblies/carriage_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="upright_assembly"></a>
## 3 x Upright Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|3| Extrusion E4040 x 1000mm|
|3| Linear rail MGN12 x 800mm|


### Sub-assemblies

| 3 x carriage_assembly |
|---|
| ![carriage_assembled](assemblies/carriage_assembled_tn.png) 



### Assembly instructions
![upright_assembly](assemblies/upright_assembly_tn.png)

![upright_assembled](assemblies/upright_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="main_assembly"></a>
## Main Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|3| GT2 2018.57|


### Sub-assemblies

| 3 x bottom_corner_assembly | 3 x top_corner_assembly | 3 x upright_assembly |
|---|---|---|
| ![bottom_corner_assembled](assemblies/bottom_corner_assembled_tn.png) | ![top_corner_assembled](assemblies/top_corner_assembled_tn.png) | ![upright_assembled](assemblies/upright_assembled_tn.png) 



### Assembly instructions
![main_assembly](assemblies/main_assembly.png)

Insert PSU

![main_assembled](assemblies/main_assembled.png)

<span></span>
[Top](#TOP)
