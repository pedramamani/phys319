.include "msp430g2553.inc"

org 0xc000

start:
  mov.w #WDTPW|WDTHOLD, &WDTCTL
  mov.b #0x41, &P1DIR
  mov.w #0x0001, r8

repeat:
  mov.b r8, &P1OUT
  xor.b #0x41, r8
  mov.w #0xEA60, r9
  mov.w #0x0002, r10

waiter:
  dec r9
  jnz waiter
  dec r10
  jz repeat
  
  mov.w #0xEA60, r9
  jmp waiter

  org 0xfffe
  dw start
