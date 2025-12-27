# 🎲 The Polyglot Guessing Game

![Just for Fun](https://img.shields.io/badge/project-just%20for%20fun-blueviolet) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

In this repository, I am collecting implementations of the classic **Guessing Game** (inspired by the [Rust Book tutorial](https://doc.rust-lang.org/book/ch02-00-guessing-game-tutorial.html)) in as many programming languages as possible.

**Goal:** This project is not about maximum performance or best practices. It is about exploring different syntaxes, paradigms, and language features by solving the exact same problem over and over again.

---

## 🎮 Gameplay Rules

Every implementation must follow these specific gameplay mechanics:

1.  **Randomness:** The program generates a random number `n` where `0 ≤ n < 100` (0 to 99).
    * *Constraint:* The number must be different each time the program runs (seeded randomness).
2.  **Input:** The user guesses the number by typing integers into the console.
3.  **Feedback:** The program provides feedback (Too high / Too low).
4.  **Counting:** The program tracks the number of attempts.
5.  **Robustness:** The program **must not crash** on invalid input (e.g., letters instead of numbers).
6.  **Victory:** When the user wins:
    * Display the total number of guesses.
    * Ask if they want to play again (`y`/`n`).
7.  **Quit:** The user can stop the program at any time (e.g., via `Ctrl-C` or a quit command).

## ⚙️ Technical Constraints

To make things interesting (and structured), the code must adhere to the "Staatliche Verordnung" (Official Regulations):

* 🧩 **Modularity:** Use at least **one** extra include file / module / header.
* cw **Control Flow:** Use at least one **loop** and one **if-clause**.
* 📦 **Functions:** Use at least one function/method (if the language supports it).
* 🏷️ **Naming:** Use meaningful variable names. No `x`, `y`, or `tmp` allowed!
* 🧹 **Clean Code:** Keep it simple and readable. *Greetings to Uncle Bob.*
* 🚫 **Dependencies:** Avoid external libraries unless absolutely necessary for RNG or Input.

---

## 🌍 Languages Implemented So Far

### The "Done" Pile ✅
- [x] **Rust** (The Original)
- [x] **C** (The Classic)
- [x] **COBOL** (The Verbose Titan)
- [x] **Assembler** (TASM/x86 - The Hardcore Mode)

### The "To-Do" List 📝
- [ ] C++
- [ ] Objective-C
- [ ] Go
- [ ] Java
- [ ] Python
- [ ] Fortran
- [ ] Assembler (ARM)
- [ ] QuickBasic
- [ ] Erlang
- [ ] Julia
- [ ] JavaScript (Node.js)
- [ ] PHP
- [ ] Ruby
- [ ] Perl
- [ ] Bash Script
- [ ] Swift
- [ ] ... *and whatever else looks fun!*

---

### 🤝 Contributing

Feel free to contribute your own version in any language – even esoteric ones!
**Pull requests are welcome.** Just make sure you follow the rules above.
