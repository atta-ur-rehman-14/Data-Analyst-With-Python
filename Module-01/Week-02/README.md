# Week 02 - Python Fundamentals

This week covers essential Python data structures and conditional statements.

## Topics Covered

### 1. Lists (`Class-03_List.ipynb`)
- List basics and creation
- Negative indexing (accessing elements from the end)
- **List Methods:**
  - `append()` - Add item at the end of the list
  - `pop()` - Remove and return item at given index (or last item)
  - `insert()` - Insert item at specified index
  - `remove()` - Remove first occurrence of a value
  - `extend()` - Add multiple items from another list
  - `index()` - Find index of first occurrence
- **Nested Lists** - Lists containing other lists
- **Tuples** - Immutable sequences (parentheses syntax)

### 2. Conditions & Control Flow (`Class-04_Conditions.ipynb`)
- `if-else` statements basic syntax
- Multiple conditions with `elif`
- **Practical Applications:**
  - Age verification for CNIC application
  - Grading system (A+, A, B, C, D, F grades)
  - Positive/Negative number checker
  - Login validation (username/password)
- **Operators:** `in` operator for membership testing

### 3. Sets & Dictionaries (`Class_04_Dictionary.ipynb`)
- **Sets:**
  - Unique value collections
  - `add()` and `remove()` methods
  - `discard()` - Safe removal (no error if element doesn't exist)
  - Removing duplicates from collections
- **Dictionaries:**
  - Key-value pair storage
  - Accessing values with `dict[key]` and `dict.get()`
  - **Dictionary Methods:**
    - `.keys()` - Get all keys
    - `.values()` - Get all values
    - `.items()` - Get key-value pairs
  - **Update operations:**
    - Assignment: `dict[key] = new_value`
    - `update()` method
  - **Removal methods:**
    - `pop()` - Remove and return value
    - `del` statement

## Key Learnings
- Understanding mutable vs immutable data structures
- Efficient data manipulation with built-in methods
- Organizing and retrieving data using dictionaries