# R Source Code Exploration & Debugging

## 🎯 Purpose

This repository documents my journey of **debugging, reverse-engineering, and understanding how statistical methods are implemented inside R**.

Instead of treating R as a black box, the goal is to:

* Debug R at both **R level** and **C level**
* Step through real statistical implementations
* Understand how core methods are written internally
* Develop a systematic workflow to analyze source code of R and CRAN packages

This repo serves as a **learning laboratory** for exploring the under-the-hood implementation of R.

---

# 1. Abstract

## Objective

Use debuggers (R debugger and gdb) to understand how statistical functions are implemented internally.

---

## Updates

* Created a **devcontainer** for reproducible builds
* Downloaded the source code of **R 4.4.1** from CRAN and built it with debugging enabled (the GitHub mirror is not ideal for local debugging)
* Stepped through R packages using:

  * gdb (C level)
  * R debugger (R level)

---

# 2. Building R with Debugging Enabled

First, enter the devcontainer and run:

```bash
sh ./configure --enable-R-shlib CFLAGS="-g -O0"
make -j$(nproc)
```

The R executable will be available at:

```
bin/exec/R
```

---

# 3. Running Debuggers

## 3.1 Exploring Built-in Functions

Example: exploring `TukeyHSD`

```r
debug(aov)

fit <- aov(Sepal.Length ~ Species, data = iris)
TukeyHSD(fit)
```

Inside the debugger:

* `n` → next
* `s` → step
* `c` → continue
* `print(x)` or `x` → inspect variables

The R debugger feels conceptually similar to gdb.

---

## 3.2 Exploring External (CRAN) Packages

Example: exploring functions from `Seurat`.

Download and preserve source code for debugging:

```bash
wget https://cran.r-project.org/src/contrib/Seurat_5.4.0.tar.gz
tar -xzf Seurat_5.4.0.tar.gz

cd Seurat
/workspace/bin/R CMD INSTALL --preclean --no-byte-compile .
```

Note:

Because `Seurat` contains both R and C++ code for its core algorithms, the source code must be downloaded locally to properly trace execution during debugging.

After installing `Seurat` using the debug-enabled R executable, its functions can be debugged in the same way as built-in functions.

---

# 🔍 Why This Matters

Textbooks explain theory.
Source code reveals implementation reality.

By stepping through real execution paths, we can understand:

* Numerical stability techniques
* Edge-case handling
* Performance trade-offs
* Design philosophy of R core developers

This repository is not about contributing features. It is about **thinking like the original authors of R statistical methods**.
