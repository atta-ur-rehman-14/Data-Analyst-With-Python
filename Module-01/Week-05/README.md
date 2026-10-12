# Week 05 - File Handling & Error Handling

This week focuses on working with external data sources and managing program errors gracefully. You'll learn to read/write files, handle CSV and JSON data, and implement robust error handling using Python's exception system.

## Topics Covered

### 1. File Handling (`Class-09-File Handling.ipynb`)
- **File Operations:** Opening, reading, writing, and appending files using `open()`
- **File Modes:** 
  - `"r"` - Read (default)
  - `"w"` - Write (creates new or truncates existing)
  - `"a"` - Append (adds to end of file)
  - `"x"` - Exclusive creation (fails if file exists)
  - `"b"` - Binary mode
  - `"+"` - Read and write
- **Context Managers:** Using `with` statements for automatic resource cleanup
- **Reading Methods:**
  - `read()` - Read entire file
  - `readline()` - Read single line
  - `readlines()` - Read all lines as list
- **Writing Methods:**
  - `write()` - Write string
  - `writelines()` - Write list of strings
- **CSV Processing:** Using `csv` module for comma-separated values
  - `csv.reader()` - Read as lists
  - `csv.DictReader()` - Read as dictionaries
  - `csv.writer()` / `csv.DictWriter()` - Write CSV data
- **JSON Handling:** Using `json` module for JavaScript Object Notation
  - `json.loads()` / `json.dumps()` - String ↔ Object conversion
  - `json.load()` / `json.dump()` - File ↔ Object conversion
- **Excel Integration:** Introduction to `openpyxl` for .xlsx files

### 2. Error Handling (`Class-10-Erro_Handling.ipynb`)
- **Exception Types:**
  - `ValueError` - Invalid value for operation (e.g., `int("hello")`)
  - `ZeroDivisionError` - Division by zero
  - `IndexError` - List index out of range
  - `FileNotFoundError` - Attempting to open non-existent file
  - `KeyError` - Missing dictionary key
  - `SyntaxError` - Invalid Python syntax
- **Try/Except Blocks:**
  - Basic syntax: `try:` → `except ExceptionType:`
  - Multiple exception handlers
  - Using `except Exception as e:` to capture error details
- **Else & Finally Clauses:**
  - `else:` - Executes if no exception occurs in try block
  - `finally:` - Always executes, typically for cleanup
- **Raising Exceptions:**
  - `raise ValueError("message")` - Manually trigger exceptions
  - Custom exception messages with f-strings
- **Practical Tasks:**
  - Building a withdrawal system with balance validation
  - Input validation loops with graceful error recovery
  - File operation safety with proper error handling

## Key Learnings
- Persistent data storage beyond program execution
- Safe file I/O with automatic resource management
- Structured data exchange using CSV and JSON formats
- Anticipating and handling runtime errors gracefully
- Creating robust applications that fail safely
- Separating error handling logic from business logic

## Practical Applications Covered
- Configuration file management (JSON, INI)
- Data import/export pipelines (CSV processing)
- Log file creation and analysis
- User data persistence (settings, preferences)
- Interactive input validation systems
- Financial transaction processing with safety checks
- Report generation from processed data
- Integration with Excel-based workflows

## Exercises & Tasks
1. **File Operations:** Create, read, update, and delete text files with various modes
2. **CSV Processing:** Read employee data, filter active records, export to JSON
3. **JSON Handling:** Serialize/deserialize pipeline results and configuration
4. **Error-Resilient Input:** Build input validation loops with quit functionality
5. **Financial Safety:** Implement withdrawal system with overdraft protection
6. **Word Counting:** Develop text analysis tools from file input
7. **Message Logging:** Create append-only logs with entry numbering