# Space-Robot-PDDL
[cite_start]This repository contains a formal AI planning solution for the **EVR-1** (Extra-Vehicular Robot 1), a six-legged autonomous agent designed for satellite outer surface inspection and maintenance in zero-gravity conditions[cite: 3].

## Project Overview
[cite_start]The robot operates on a **10×10 grid of handles** on a satellite's exterior[cite: 24]. [cite_start]The primary goal is to navigate the surface, manage limited energy resources, and perform complex manipulation tasks such as opening security tailgates[cite: 30].

---

## Key Constraints & Logic

### Locomotion
* [cite_start]**Stride**: The robot has a stride of 1 handle[cite: 27].
* [cite_start]**Stability**: To move forward, the robot must have at least **4 legs** firmly grasping handles[cite: 13].

### Energy Management
* [cite_start]**Autonomy**: EVR-1 has a maximum autonomy of **100 energy units** when fully charged[cite: 20].
* [cite_start]**Action Cost**: Every action (moving, sensing, manipulating) has an energetic cost of **1 unit**[cite: 20].
* [cite_start]**Safety**: The robot must return to the recharging station (located at coordinate **10,10**) before its energy reaches 0[cite: 21, 25].

### Manipulation
* [cite_start]**Versatility**: The robot can switch the main use of one or two legs to use them as **arms** to manipulate objects[cite: 14].
* [cite_start]**Target**: The outer control panel is located at **(1,1)** and requires pressing two buttons and operating security levers to open the tailgate[cite: 10, 26].

---

## Implementation Details
The project is implemented using **PDDL** (Planning Domain Definition Language) and covers two distinct scenarios:

### 1. Standard Mission (`domain-3.pddl` & `problem-3.pddl`)
* [cite_start]Models basic movement, docking, and recharging mechanics[cite: 58, 59].
* [cite_start]Implements the sequence to open the control panel using multiple "arm" maneuvers[cite: 57, 58].

### 2. Obstacle Avoidance / Broken Path (`domain2.pddl` & `problem2.pddl`)
* [cite_start]Introduces environmental hazards where specific handles at **(5,5)**, **(4,6)**, and **(7,7)** are broken[cite: 37].
* [cite_start]The domain logic includes **conditional checks** in the `increase` and `decrease` actions to ensure the robot never attempts to grasp a broken handle[cite: 42, 43, 44].

---

## How to Run
You can run these PDDL files using any standard **STRIPS/Fluents** compatible solver (such as [Planning.Domains](https://solver.planning.domains/)).

1. **Load** the `domain.pddl` file (Standard or Broken version).
2. **Load** the corresponding `problem.pddl` file.
3. **Generate** the plan to see the sequence of actions:
    * `undock`
    * `increase_x` / `increase_y`
    * `control_open`
    * `control_manuever`
