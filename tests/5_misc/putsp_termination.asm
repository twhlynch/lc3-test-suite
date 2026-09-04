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

; prints if Msg did not terminate (read overflow)
        .FILL x4554 ; TE
        .FILL x5453 ; ST
        .FILL x465F ; _F
        .FILL x4941 ; AI
        .FILL x454C ; LE
        .FILL x0044 ; D\0
        .FILL x0000 ; skipped the other one so will probably loop until timeout

.END
