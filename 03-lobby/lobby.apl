#!/usr/local/bin/apl -s


∇bign ← N2GreatestPossibleNumber n
  greater_idx ← 1⌷⍒n
  greater ← greater_idx⌷n
  sec_greater_idx ← 2⌷⍒n
  sec_greater ← sec_greater_idx⌷n

  →(greater_idx<sec_greater_idx)⍴RNUM
  →((greater=sec_greater)∨greater_idx=≢n)⍴RNUM_REV
  sec_greater_idx ← greater_idx+↑⍒greater_idx↓n
  sec_greater ← sec_greater_idx⌷n
  RNUM:
    bign ← greater sec_greater sec_greater_idx
    →0
  RNUM_REV:
    bign ← sec_greater greater greater_idx
∇

∇bign ← d GreatestPossibleNumber n;ni;greatest2
  →(d>0)⍴GT0
    bign ← ⍬
    →0
  GT0:
    ni ← (2-d)↓n
    greatest2 ← N2GreatestPossibleNumber ni
    bign ← (¯1↓greatest2),((d-2) GreatestPossibleNumber (¯1↑greatest2)↓n)
∇

input ← ⎕FIO[49] 'input'

⍝ Part 1
+/ {⍎¯1↓⍵}¨N2GreatestPossibleNumber¨input
⍝ Part 2
digits ← 12
+/ ⍎¨digits GreatestPossibleNumber¨input

)OFF
