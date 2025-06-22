# 🗃️ Inventory Management System — Java Edition

An inventory system built with Java to manage products efficiently using the right data structures and logic 💪⚙️

---

## 🎯 Problem Statement

Design a system for a warehouse to **add**, **update**, **delete**, and **view** products quickly — even with thousands of items.

---

## 🧠 Why Data Structures Matter

- 🔎 Fast access is crucial when managing large inventories.
- 🧱 Choosing the right data structure improves speed and scalability.
- 🧠 `HashMap<String, Product>` is perfect for quick lookups using productId.

---

## ⚙️ Data Structure Used

✅ HashMap<String, Product>
Fastest for operations like add, update, and delete using productId as key.

---
## 📊 Analysis (Time Complexity)

| Operation         | Time | Notes                  |
| ----------------- | ---- | ---------------------- |
| Add Product       | O(1) | `put()` in HashMap     |
| Update Product    | O(1) | `get()` + field update |
| Delete Product    | O(1) | `remove()` by key      |
| View All Products | O(n) | Looping through values |

---
## 🧪 Optimization Ideas

🔐 Prevent duplicates using .containsKey(productId) before put().

🔍 Add a second map for search by productName if needed.

💾 Store data in a file or DB for persistence.

📊 Add sorting/filtering options (e.g., by price/quantity) if needed.

---
## ✅ What I Understood
Smart data structure choice makes systems fast and scalable.

HashMap is best when keys (like productId) are used for lookups.

Always think about time complexity when designing systems — not just correctness.