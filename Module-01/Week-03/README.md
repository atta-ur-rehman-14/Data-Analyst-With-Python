# Week 03 - Python Loops & String Manipulation

This week covers iteration constructs and string manipulation techniques in Python.

## Topics Covered

### 1. Loops (`Class-05-Loop.ipynb`)
- **For Loops:**
  - Iterating over sequences (lists, strings, ranges)
  - Basic syntax: `for item in sequence:`
- **Range Function:**
  - `range(n)` - Generates numbers from 0 to n-1
  - `range(start, stop)` - Generates numbers from start to stop-1
  - `range(start, stop, step)` - Custom step size
- **Practical Examples:**
  - Printing city names from a list
  - Multiplication tables (table of 3)
  - Star patterns (* pattern generation)
  - Number sequences with different ranges

### 2. String Methods (`Class-05-String-Method.ipynb`)
- **Whitespace Removal:**
  - `strip()` - Removes leading AND trailing whitespace
  - `lstrip()` - Removes leading (left) whitespace only
  - `rstrip()` - Removes trailing (right) whitespace only
- **Case Conversion:**
  - `lower()` - Converts entire string to lowercase
  - `upper()` - Converts entire string to uppercase
  - `title()` - Capitalizes first letter of each word
  - `capitalize()` - Capitalizes first letter of string only
- **String Modification:**
  - `replace(old, new)` - Replace all occurrences of substring
  - `split(separator)` - Split string into list on delimiter
  - `startswith(prefix)` - Check if string begins with specified text
  - `endswith(suffix)` - Check if string ends with specified text
- **Advanced String Features:**
  - F-strings for string interpolation: `f"Hello {name}"`
  - **List Slicing:** Extract portions of lists using `[start:end]` syntax
  - **String Slicing:** Extract portions of strings using `[start:end]` syntax

### 3. Advanced Looping & Control (`Class-06-Loops-Part2.ipynb`)
- **While Loops:**
  - Continue looping while condition remains True
  - Manual loop control with counters
- **Loop Control Statements:**
  - `break` - Exit loop immediately
  - `continue` - Skip current iteration and continue with next
- **Practical Tasks:**
  - Separating even and odd numbers from a list
  - Classifying numbers as positive, negative, or zero
  - Counting occurrences of specific values (zeros)
  - Summing values and calculating percentages
  - Early termination with break when sum reaches threshold

## Key Learnings
- Efficient iteration patterns for different data types
- String processing and manipulation techniques
- Control flow management within loops
- Building practical applications with loops
- Understanding when to use for vs while loops

## Practical Applications Covered
- Text processing and cleaning
- Data analysis and filtering
- Mathematical computations
- Pattern generation
- Validation and classification tasks