# 💸 Financial Forecasting Tool

## ✅ Objective
Build a recursive method to forecast future financial value based on past growth rates.

---

## 🔁 Recursion Concept

Recursion breaks a problem into smaller parts by calling the same method within itself.  
Useful for problems that have a natural recursive structure like exponentiation or time-based compounding.

---

## 📈 Forecast Formula

Future Value after `n` years:

Recursive logic:

---

## 🧱 Implementation Summary

| Method                | Description                                  |
|-----------------------|----------------------------------------------|
| `forecast()`          | Recursive calculation of future value        |
| `optimizedForecast()` | Constant-time solution using `Math.pow()`    |

---

## 📊 Analysis

| Metric        | Recursive Version | Optimized Version |
|---------------|--------------------|--------------------|
| Time          | O(n)               | O(1)               |
| Space         | O(n) (call stack)  | O(1)               |
| Risk          | Stack overflow     | Stable             |

---

## 📌 Conclusion

- Use recursion for learning or small datasets.
- Prefer optimized mathematical methods for real applications.

---
