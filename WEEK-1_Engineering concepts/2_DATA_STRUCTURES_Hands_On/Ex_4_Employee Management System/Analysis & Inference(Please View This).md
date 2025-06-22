# Employee Management System

## 🧠 Understanding

This exercise models a simple employee management system using a **fixed-size array**.

### Features:
- Add employees
- Search employee by ID
- Delete employee by ID
- Display all employees

### Array Representation:
- Arrays in Java are stored in **contiguous memory locations**
- Provide **fast O(1) access** using index
- Size is **fixed** once declared

---

## 📊 Analysis

| Operation     | Time Complexity | Description                        |
|---------------|------------------|------------------------------------|
| Add           | O(1)             | Insert at end                      |
| Search        | O(n)             | Linear search                      |
| Traverse      | O(n)             | Loop through array                 |
| Delete        | O(n)             | Shift elements after deletion      |

### Limitations of Arrays:
- Fixed size: Cannot grow or shrink dynamically
- Slow insertion/deletion except at the end
- Linear search is inefficient for large datasets

### When to Use Arrays:
- When the number of employees is **known and limited**
- When **fast access by index** is needed
- For small applications or educational purposes

---

**Note:** For scalable applications, consider using `ArrayList`, `HashMap`, or database-backed storage.
