; putsp stops printing at exactly x0000, not at any xYY00

.ORIG x3000

    lea r0, Msg
    putsp

    halt

; Equivalent to .STRINGZ "A#TEST_PASSED", where # is x0100
Msg     .FILL x0041 ; full string is "A\0 \0# TE ST _P AS SE D\0 \0\0"
        .FILL x0100 ; xYY00 -- do not terminate
        .FILL x4554 ; TEST_PASSED
        .FILL x5453
        .FILL x505F
        .FILL x5341
        .FILL x4553
        .FILL x0044
        .FILL x0000 ; do terminate

.STRINGZ "TEST_FAILED" ; prints if Msg did not terminate (read overflow)

.END
