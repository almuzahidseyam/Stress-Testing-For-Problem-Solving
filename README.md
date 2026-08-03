# Stress Testing for Problem Solving 🧪💻

[![GitHub repo size](https://img.shields.io/github/repo-size/Mehedi-Hasan-Rabbi/Stress-Testing-For-Problem-Solving?style=flat-square)](https://github.com/Mehedi-Hasan-Rabbi/Stress-Testing-For-Problem-Solving)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](https://opensource.org/licenses/MIT)
[![C++](https://img.shields.io/badge/Language-C++17-blue?style=flat-square)](https://isocpp.org/)

> **This repository provides a complete setup for stress testing algorithms — an essential technique in competitive programming and problem solving.
It helps you automatically detect logical errors in your optimized solution by comparing it against a brute-force (correct but slow) solution over thousands of randomly generated test cases.**

---

## 🚀 What Is Stress Testing?

Stress testing is a debugging technique where:

 1. You write two solutions:

    - `Brute-force solution` → Always correct, but slow.

    - `Optimal solution` → Fast, but may contain bugs.

 2. A random test generator creates many inputs.

 3. Both solutions are executed on each input.

 4. Their outputs are compared until a mismatch is found.

This is one of the most powerful ways to catch corner-case bugs that are hard to think of manually.

---

## 📁 Repository Structure

```
.
├── bruteforce.cpp     # Correct but slower implementation
├── optimal.cpp        # Faster solution under test
├── gen.cpp            # Random test generator
├── checker.sh         # Bash script to automate stress testing
└── DemoToGenInput.txt # Examples for creating your own gen.cpp
```

## 🧩 File Descriptions

### 1. bruteforce.cpp

-   Contains the brute-force logic.
    
-   Usually O(n²), O(n³), or even slower.
    
-   Should always produce correct output.
    

### 2. optimal.cpp

-   Your optimized algorithm.
    
-   The goal of stress testing is to validate this solution.
    

### 3. gen.cpp

-   Generates random inputs to stress-test your solution.
    
-   You can customize it based on your problem.
    
-   Examples for different data types are provided in `DemoToGenInput.txt`.
    

### 4. checker.sh

A fully automated script that:

1.  Compiles all C++ files.
    
2.  Runs an infinite testing loop.
    
3.  Stops immediately when a mismatch is found.
    
4.  Prints the exact failing test case and outputs.

## ⚙️ How To Use This Setup

### Step 1 — Clone the Repository
```
git clone https://github.com/Mehedi-Hasan-Rabbi/Stress-Testing-For-Problem-Solving
cd Stress-Testing-For-Problem-Solving
```
### Step 2 — Write Your Code

-   Implement the `brute-force` version in `bruteforce.cpp`.
    
-   Implement the `optimized` version in `optimal.cpp`.
    
-   Adjust the `input generator` in `gen.cpp` as needed.
### **Step 3 — Make checker.sh Executable**

```
chmod +x checker.sh
```
### **Step 4 — Run the Stress Test**

```
./checker.sh
```

The script will now:

- Compile all C++ files.
    
- Start generating test cases.
    
- Compare outputs endlessly.

If everything is correct, you will see:
````
Test Case #1 PASSED
Test Case #2 PASSED
...
````
If any mismatch occurs:
````
----------------------------------------
FAILURE ON TEST CASE #37
----------------------------------------
Input:
<the failing test case here>

Bruteforce Output: X
Optimal Output:    Y
````
The failing input stays in `input.txt` so you can debug immediately.

## 📝 Customizing Input Generator

`DemoToGenInput.txt` includes templates for generating:

-   Random integer arrays
    
-   Permutation arrays
    
-   Real number arrays
    
-   Random strings
    
-   Binary strings
    
-   Random trees
    
-   Random graphs
    
Just copy the example you need into `gen.cpp`.
## 🎯 Why This Setup Is Useful

✔ Detects hidden corner-case bugs  
✔ Helps validate logic before submitting to contests  
✔ Saves time during debugging  
✔ Works for **any** C++ problem  
✔ Simple, fast, and extensible

## 💡 Tips

-   Always verify your brute-force solution carefully; the entire stress test depends on it.
    
-   Start with small constraints in `gen.cpp` to catch bugs quickly.
    
-   Gradually increase input size as your optimal solution becomes stable.

## 🙏 Acknowledgement
-   https://ideone.com/WavLoL
-   Designed and maintained to help competitive programmers test their logic efficiently.  
-   Feel free to fork, improve, or extend this setup. ✅
