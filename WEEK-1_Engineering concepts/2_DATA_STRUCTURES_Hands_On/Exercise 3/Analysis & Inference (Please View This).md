# Sorting Customer Orders

## 🧠 Understanding

In an e-commerce platform, it's important to prioritize high-value orders. This exercise demonstrates sorting customer orders based on their `totalPrice`.

Two sorting algorithms are implemented:
- **Bubble Sort**: A simple, comparison-based sorting algorithm.
- **Quick Sort**: A highly efficient divide-and-conquer algorithm used in real-world applications.

### Sorting Algorithms Overview:

| Algorithm   | Best Case  | Average Case | Worst Case | Space    | Stable |
|-------------|------------|--------------|------------|----------|--------|
| Bubble Sort | O(n)       | O(n²)        | O(n²)      | O(1)     | Yes    |
| Quick Sort  | O(n log n) | O(n log n)   | O(n²)      | O(log n) | No     |

### Why Quick Sort?
- Quick Sort is generally preferred due to:
    - Faster average performance
    - Better cache locality
    - Used in many standard libraries like Java’s `Arrays.sort()` for primitives

---

## 📊 Analysis

- **Bubble Sort** is easy to implement but inefficient for large data sets.
- **Quick Sort** is faster and better suited for performance-critical systems.
- Sorting helps in:
    - Improving order fulfillment efficiency
    - Making analytics and reporting more effective

**Conclusion:** Use Bubble Sort for learning; prefer Quick Sort in real applications.
