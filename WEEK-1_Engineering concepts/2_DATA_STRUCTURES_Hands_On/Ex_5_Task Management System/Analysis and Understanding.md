# 🗂️ Task Management System

## 🧠 Understanding

This project implements a **singly linked list** to manage a list of tasks dynamically.

### ✨ Features
- Add a task
- Search task by ID
- Delete task by ID
- Display all tasks

### 🧩 Singly Linked List Representation
- Each node stores a `Task` and a reference to the next node.
- Memory is allocated dynamically.
- Nodes are not stored in contiguous memory like arrays.

---

## 📊 Analysis

| Operation       | Time Complexity | Description                    |
|-----------------|------------------|--------------------------------|
| Add Task        | O(n)             | Traverse to end and append     |
| Search Task     | O(n)             | Linear search by task ID       |
| Traverse Tasks  | O(n)             | Loop through each node         |
| Delete Task     | O(n)             | Find and relink surrounding nodes |

### ✅ Advantages
- Dynamic size (no need to predefine)
- Efficient insertions/deletions at head

### ⚠️ Limitations
- No direct access by index (unlike arrays)
- Extra memory for node references

### 🛠️ When to Use
- When data size is unknown or changing frequently
- When frequent insertions/deletions are needed
