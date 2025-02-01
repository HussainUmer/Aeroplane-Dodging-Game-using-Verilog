# **Airplane Dodging Game**

## **Overview**
This project is a **single-player Airplane Dodging Game** developed using **Verilog** for hardware design (VGA display, keyboard input) and **software** for game logic and pixel generation. The game challenges players to navigate an airplane through a maze while avoiding obstacles.

## **Gameplay**
- **Objective**: Navigate the airplane through the maze while avoiding obstacles to reach a specific destination or achieve a high score.
- **Controls**: The game uses directional keys (`W`, `A`, `S`, `D`) to control the airplane's movement.
- **Obstacles**: The maze contains walls and blocks, and the player must maneuver around these obstacles to survive.
- **Scoring**: The player starts with 3 lives, and each collision with an obstacle costs one life. The game ends when all lives are lost.

## **Features**
- **Dynamic Environment**: The speed increases as the game progresses, making navigation more challenging.
- **Game Over Conditions**: The game ends when the player runs out of lives, with an option to restart.
- **Game Flow**: The game includes a **Start Screen**, **Game Screen**, and **End Screen** (Win/Lose).

## **Modules**
- **VGA Controller**: Responsible for rendering the game display.
- **Pixel Generation**: Manages game logic and generates pixel data based on user input and game state.
- **PS/2 Receiver**: Processes keyboard inputs.
- **Top Module**: Connects all components, including VGA and keyboard modules.
