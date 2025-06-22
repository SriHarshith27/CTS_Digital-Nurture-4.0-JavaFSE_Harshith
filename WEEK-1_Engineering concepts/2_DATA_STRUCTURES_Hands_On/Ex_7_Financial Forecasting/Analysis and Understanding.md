# 💸 Financial Forecasting Tool

## 🧠 Understanding

This tool forecasts future financial values using **recursion** and **compound growth** formulas.

### ✨ Features
- Recursive forecast function
- Optimized formula-based method
- Supports yearly compound interest growth

### 🔁 Recursion Formula


Where:
- `P` = Present Value
- `r` = Growth Rate (e.g., 0.1 for 10%)
- `y` = Number of years

---

## 📊 Analysis

| Method               | Time Complexity | Space Complexity | Description                      |
|----------------------|------------------|-------------------|----------------------------------|
| Recursive Forecast   | O(n)             | O(n) (call stack) | Recursive compounding            |
| Optimized Forecast   | O(1)             | O(1)              | Uses `Math.pow()` directly       |

### ✅ When to Use
- **Recursive**: Educational/short time horizon
- **Optimized**: Real-time applications or large inputs

### ⚠️ Limitation
- Recursive method can cause **stack overflow** for large `n`

### 🧠 Best Practice
Use the optimized formula for performance-sensitive or large-scale systems:

