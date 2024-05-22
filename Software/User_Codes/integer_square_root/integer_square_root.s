# Program to compute integer square root using binary search

        .text
        .globl _start

_start:
        # Initialize
        addi a0 ,a0 ,23
        li t0, 0       # t0 = low = 0
        mv t1, a0      # t1 = high = a0 (input number)
        li t2, 0       # t2 = mid, initialize to 0
        li t3, 0       # t3 = mid * mid, initialize to 0

binary_search:
        # Check if low is greater than high
        bgt t0, t1, finish          # if low > high, finish the search

        # Calculate mid = (low + high) / 2
        add t2, t0, t1              # t2 = low + high
        srai t2, t2, 1              # t2 = mid = (low + high) / 2

        # Compare mid*mid with input number
        mul t3, t2, t2              # t3 = mid * mid
        blt t3, a0, mid_is_too_low  # if mid * mid < input, continue search in upper half
        bgt t3, a0, mid_is_too_high # if mid * mid > input, continue search in lower half

mid_is_exact:
        mv t1, t2       # result = mid
        j finish

mid_is_too_low:
        addi t0, t2, 1  # low = mid + 1
        j binary_search

mid_is_too_high:
        addi t1, t2, -1 # high = mid - 1
        j binary_search

finish:
        mv a0, t1       # result = high (integer square root)
        ebreak          # end of program
