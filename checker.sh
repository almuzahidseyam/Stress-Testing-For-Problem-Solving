# --------------------- Easy Implementaion -------------------
# First Compile CPP files first.
# for ((i = 1; ; ++i)); do
#     echo $i
#     ./gen.exe > input.txt
#     diff -w <(./bruteforce.exe < input.txt) <(./optimal.exe < input.txt) || break
# done

# ------------------------ More Informative --------------------
#!/bin/bash

# This script first compiles the necessary C++ files and then runs an
# infinite loop to stress test an optimal solution against a brute-force solution.

# --- COMPILE STEP ---
echo "--- Compiling source files... ---"
g++ -std=c++17 -O2 -o gen.exe gen.cpp && \
g++ -std=c++17 -O2 -o bruteforce.exe bruteforce.cpp && \
g++ -std=c++17 -O2 -o optimal.exe optimal.cpp

# Check if the last command (compilation) was successful.
# $? holds the exit status of the last command. 0 means success.
if [ $? -ne 0 ]; then
    echo "--- Compilation Failed! Aborting. ---"
    exit 1
fi

echo "--- Compilation Successful. Starting tests... ---"
echo ""

# --- TESTING LOOP ---
# Use Ctrl+C to stop it manually.
for ((i = 1; ; ++i)); do
    
    # Generate a new test case and save it to input.txt
    ./gen.exe > input.txt
    
    # Run both solutions with the same input and store their outputs.
    BRUTE_OUT=$(./bruteforce.exe < input.txt)
    OPTIMAL_OUT=$(./optimal.exe < input.txt)
    
    # Compare the outputs.
    if [ "$BRUTE_OUT" == "$OPTIMAL_OUT" ]; then
        # If they match, the test passed.
        echo "Test Case #$i PASSED"
    else
        # If they don't match, a bug is found!
        echo "----------------------------------------"
        echo "FAILURE ON TEST CASE #$i"
        echo "----------------------------------------"
        echo "Input:"
        cat input.txt
        echo ""
        echo "Bruteforce Output: $BRUTE_OUT"
        echo "Optimal Output:    $OPTIMAL_OUT"
        # The failing test case is already saved in input.txt, so you can debug it.
        # Stop the script.
        break
    fi
done

# ------------------------ More Informative (Colored Version) -------------------------
