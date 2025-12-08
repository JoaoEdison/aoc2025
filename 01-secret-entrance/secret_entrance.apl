#!/usr/local/bin/apl -s

⍝ Translated solution from:
⍝ https://github.com/mgtezak/Advent_of_Code/blob/master/2025/01/p2.py


d ← 99+1
s0 ← 50
at0 ← 0
by0 ← 0

∇Rotate l
  delta ← ⍎ 1↓l
  rotations ← ⌊delta÷d
  delta ← d|delta
  s1 ← s0 + (delta×'R'=↑l) - delta×'L'=↑l
  passed_or_landed ← (s0≠0)∧((s1≤0)∨(s1≥d))
  by0 ← by0 + rotations + passed_or_landed
  s0 ← d|s1
  →(s0=0)↓0
  at0 ← at0 + 1
∇

input ← ⎕FIO[49] 'input'
Rotate¨input

⍝ Part 1
at0
⍝ Part 2
by0

)OFF
