#!/usr/bin/env bqn

# Translated solution from:
# https://github.com/mgtezak/Advent_of_Code/blob/master/2025/01/p2.py


d ← 99+1
s0 ← 50
at0 ← 0
by0 ← 0

Rotate ← {
  delta ← •ParseFloat 1↓𝕩
  rotations ← ⌊delta÷d
  delta ↩ d|delta
  s1 ← s0 + (delta×'R'=⊑𝕩) - delta×'L'=⊑𝕩
  passed_or_landed ← (s0≠0)∧((s1≤0)∨(s1≥d))
  by0 +↩ rotations + passed_or_landed
  s0 ↩ d|s1
  {𝕤⋄at0+↩1}⍟(s0=0) @
}

input ← •FLines"input"
Rotate¨input

# Part 1
•Show at0
# Part 2
•Show by0
