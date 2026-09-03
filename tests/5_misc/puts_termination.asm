; puts stops printing at exactly x0000, not at any xYY00

.ORIG x3000

    lea r0, Msg
    puts

    halt

; Equivalent to .STRINGZ "A#TEST_PASSED", where # is x0100
Msg     .FILL x0041 ; A
        .FILL x0100 ; xYY00 -- do not terminate
        .FILL x0054 ; TEST_PASSED
        .FILL x0045
        .FILL x0053
        .FILL x0054
        .FILL x005F
        .FILL x0050
        .FILL x0041
        .FILL x0053
        .FILL x0053
        .FILL x0045
        .FILL x0044
        .FILL x0000 ; do terminate

.STRINGZ "TEST_FAILED" ; prints if Msg did not terminate (read overflow)

.END
