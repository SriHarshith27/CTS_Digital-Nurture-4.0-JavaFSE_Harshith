# 📚 Library Management System

## 🧠 Understanding

This system demonstrates **searching books** by title using:
- 🔍 Linear Search (works on any array)
- 🚀 Binary Search (requires sorted array)

### ✨ Features
- Find book by title (linear or binary)
- Sort array of books for binary search

---

## 📊 Analysis

| Search Type     | Time Complexity | Works on Unsorted? | Description                  |
|------------------|------------------|---------------------|------------------------------|
| Linear Search     | O(n)             | ✅ Yes              | Check every element          |
| Binary Search     | O(log n)         | ❌ No               | Divide sorted array in half |

### ✅ When to Use
- Use **linear search** for small or unsorted data
- Use **binary search** for fast lookups in large, sorted data

### ⚠️ Limitations
- Linear search is inefficient on large datasets
- Binary search fails if data is not sorted

### 📌 Tip
- Sort the array of books using `Arrays.sort()` before binary search
