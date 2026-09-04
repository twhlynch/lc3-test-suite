; putsp prints \0 chars within packed strings

.ORIG x3000

    lea r0, Msg
    putsp

    halt

        ; TEST_FAILE\0D shouldnt be detected as a fail unless '\0' is omitted
Msg     .FILL x4554 ; TE
        .FILL x5453 ; ST
        .FILL x465F ; _F
        .FILL x4941 ; AI
        .FILL x454C ; LE
        .FILL x4400 ; \0D <-- '\0' before 'D'

        ; TEST_PASSED as normal
        .FILL x4554 ; TE
        .FILL x5453 ; ST
        .FILL x505F ; _P
        .FILL x5341 ; AS
        .FILL x4553 ; SE
        .FILL x0044 ; D\0

        .FILL x0000

.END
