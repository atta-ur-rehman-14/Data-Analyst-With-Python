# Week 04 - While Loops & Functions

This week covers while loop constructs and user-defined functions in Python, building on the for-loop foundations from Week 03.

## Topics Covered

### 1. While Loops (`Class-07-While-Loop.ipynb`)
- **While Loop Basics:**
  - Syntax: `while condition:` — runs as long as condition is `True`
  - Use when the number of iterations is not known in advance
- **Loop Control:**
  - Manual counter increment (`count += 1`)
  - Infinite loops with `while True:` and `break` to exit
- **Practical Applications:**
  - **Guess the Number Game** — Interactive input validation with high/low hints
  - **Password Authentication** — Limited attempts (3 tries) with feedback
  - **Sum of Numbers (1 to n)** — Accumulator pattern with counter
  - **Factorial Calculation** — Iterative multiplication (`n! = n × (n-1) × ... × 1`)
- **Loop Control Statements:**
  - `break` — Exit loop immediately (used in guessing game, password check)
  - `continue` — Skip to next iteration (covered conceptually)

### 2. Functions (`Class-08-Functions.ipynb`)
- **Function Fundamentals:**
  - Definition: `def function_name():` — named, reusable code blocks
  - Built-in functions: `print()`, `len()`, `input()`, `int()`, `range()`, `type()`
  - Calling functions multiple times without rewriting code
- **Parameters & Arguments:**
  - **Parameters** — Variables defined in function signature
  - **Arguments** — Actual values passed when calling
  - **Positional Arguments** — Order matters: `func(name, age, city)`
  - **Keyword Arguments** — Named explicitly: `func(name="Ayan", age=50, city="Karachi")`
- **Return Values:**
  - `return` statement sends value back to caller
  - Functions without explicit `return` return `None`
  - Chaining function calls: result of one function used as input to another
- **Default Arguments:**
  - Default parameter values: `def func(param=default_value):`
  - Can be overridden by providing argument: `func("value")`
  - Example: Tax calculation with default 15% rate
- **Function Composition:**
  - Multiple functions calling each other (Receipt System example)
  - `calculate_tax()` → `calculate_discount()` → `calculate_total()` → `print_receipt()`
- **Variable Scope:**
  - **Local Scope** — Variables created inside function, inaccessible outside
  - **Global Scope** — Variables accessible throughout the program
  - `global` keyword — Modify global variable inside function

## Key Learnings
- Choosing between `for` loops (known iterations) and `while` loops (condition-based)
- Building interactive programs with user input validation
- Writing reusable, modular code with functions
- Understanding parameter passing mechanisms (positional vs keyword)
- Managing variable scope to avoid naming conflicts
- Composing complex operations from simple function building blocks

## Practical Applications Covered
- Interactive games (number guessing)
- Authentication systems (password validation)
- Mathematical computations (factorial, summation)
- Business logic (billing with tax and discounts)
- Grade calculation systems
- Receipt generation with multiple calculation steps