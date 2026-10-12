# Week 06 - Object-Oriented Programming (OOP)

This week introduces Object-Oriented Programming in Python, covering class design, inheritance, and the three pillars of OOP: Encapsulation, Polymorphism, and Abstraction. You'll learn to model real-world concepts as objects with data and behavior bundled together.

## Topics Covered

### 1. OOP Fundamentals (`Class-11-OPP.ipynb`)
- **Classes vs Objects:** Blueprints vs instances
- **Class Definition:** `class ClassName:` syntax
- **The `__init__` Constructor:** Automatic initialization on object creation
- **Instance Attributes:** Storing data unique to each object (`self.attribute`)
- **Instance Methods:** Behavior attached to objects (`def method(self):`)
- **The `self` Parameter:** Reference to the current instance
- **Object Instantiation:** Creating objects with `ClassName(args)`
- **Practical Tasks:**
  - Student class with grade calculation
  - Profile display with percentage computation
  - Reusable student record management

### 2. Inheritance (`Class-11-Inheritance.ipynb`)
- **Concept:** Child classes inheriting attributes/methods from parent
- **Parent/Child Relationship:** Base class → Derived class
- **Basic Inheritance:** `class Child(Parent):` syntax
- **Method Overriding:** Replacing parent behavior in child class
- **The `super()` Function:**
  - Calling parent constructor: `super().__init__(args)`
  - Avoiding code duplication in child constructors
  - Calling parent methods: `super().method()`
- **Inheritance Types Demonstrated:**
  - Single inheritance (Student/Teacher → Person)
  - Multi-level inheritance concepts
  - Method resolution order (MRO)
- **Practical Examples:**
  - Person → Student/Teacher hierarchy
  - Animal → Dog with extended behaviors
  - Vehicle → Car/Truck with shared attributes

### 3. The Three Pillars of OOP (`oop_three_pillars.ipynb`)

#### 🔒 Pillar 1: Encapsulation
- **Access Control Levels:**
  - `name` — Public (anyone can access)
  - `_name` — Protected (internal use, convention only)
  - `__name` — Private (name mangling, hidden from outside)
- **Getters & Setters:** Controlled access to private data
- **The `@property` Decorator:** Pythonic way to create managed attributes
  - `@property` — Getter (read like attribute)
  - `@property_name.setter` — Setter (validate on assignment)
- **Practical Example:** `BankAccount` with validated balance, deposit/withdraw

#### 🔄 Pillar 2: Polymorphism
- **Definition:** Same method name, different behavior per object
- **Method Overriding:** Child classes providing own implementation
- **Duck Typing:** *"If it walks like a duck and quacks like a duck..."*
  - No type checking required — just call the method
  - Works across unrelated classes with same method signature
- **Polymorphic Collections:** Lists of different objects responding to same call
- **Real-World Examples:**
  - Animal sounds (Dog, Cat, Cow, Robot, Human)
  - Shape area calculations (Circle, Rectangle, Triangle)
  - Employee payroll (FullTime, PartTime, Freelancer)

#### 🧩 Pillar 3: Abstraction
- **Concept:** Hide complexity, expose simple interface
- **Abstract Base Classes (ABC):** Using `abc` module
- **Abstract Methods:** `@abstractmethod` — must be implemented by children
- **Enforcement:** Cannot instantiate abstract class directly
- **Template Pattern:** Shared methods in base, custom in children
- **Real-World Examples:**
  - Vehicle hierarchy (Car, Bike, Truck with start/stop)
  - Payment system (Cash, Card, Mobile with pay/refund)
  - Notification system (Email, SMS, Push with send/log)

#### 🏆 Combined: All Three Pillars Together
- **Notification System Example:** Encapsulation (private sender), Polymorphism (send()), Abstraction (abstract base)
- **Design Principles:** Safe, flexible, and extensible code

## Key Learnings
- Modeling real-world entities as self-contained objects
- Reducing code duplication through inheritance
- Controlling data access with encapsulation patterns
- Writing flexible code that works with any compatible object
- Enforcing contracts with abstract base classes
- Choosing appropriate OOP patterns for maintainability

## Practical Applications Covered
- Student/Employee management systems
- Banking/account management with validation
- Game entity hierarchies (animals, characters)
- Geometric shape calculations
- Payment processing systems
- Multi-channel notification delivery
- Configuration-driven object factories

## Exercises & Tasks
1. **OOP Basics:** Create `Student` class with grade calculation and profile display
2. **Inheritance:** Build `Employee` hierarchy with `FullTime`, `PartTime`, `Freelancer` subclasses
3. **Encapsulation:** Implement `Product` class with validated price/stock using `@property`
4. **Polymorphism:** Design `Employee` payroll system with polymorphic `calculate_pay()`
5. **Abstraction:** Create abstract `Shape` with `area()` and `perimeter()` for Square/Circle
6. **Integrated:** Build notification system combining all three pillars
7. **Vehicle System:** Extend Vehicle hierarchy with proper `super()` usage