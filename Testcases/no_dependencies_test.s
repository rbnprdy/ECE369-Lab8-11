
########################################################################################################################
### main
########################################################################################################################
.data
asize0:  .word    100, 200, 300, 400, 500, 600
asize1:  .word	  700, 800, 900, 1000, 1100, 1200
.text

.globl main

main: 

addi $s1, $zero, 1
addi $s2, $zero, 2
addi $s3, $zero, 3
addi $s4, $zero, 4
addi $s5, $zero, 5

addi $s6, $zero, 6
sub  $s2, $s2, $s1 # s2 = 1
addi $t1, $zero, 1
addi $t2, $zero, 2
mul $s4, $s3, $s4 # s4 = 12