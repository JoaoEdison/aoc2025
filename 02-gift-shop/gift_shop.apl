#!/usr/local/bin/apl -s

)COPY ../base_structures/utils.apl


∇Z← CompareTwoParts n;half_decimal;first_part;second_part
  half_decimal ← 10*(⌊(NumDigits n)÷2)
  first_part ← half_decimal|n
  second_part ← ⌊n÷half_decimal
  Z ← first_part=second_part
∇

∇Z← HasRepeatedDigits n;num_digits;i;divider;num_parts
  num_digits ← NumDigits n
  →(num_digits>1)⍴GT1
  Z ← 0
  →0
  GT1:
    dividers ← Dividers num_digits
    ⍝ Because of the performance too...
    i ← 1
    REPEAT:
      divider ← i⌷dividers
      num_parts ← num_digits ÷ divider
      parts ← {(10*divider)|⌊n÷10*(divider×⍵-1)}¨⍳num_parts
      →(AllEqual parts)↓COMP
      Z ← 1
      →0
      COMP:
        i ← i + 1
        →(i≤≢dividers) / REPEAT
  Z ← 0
∇

∇sum← (RepeatedFn SumRepeatedNumbers) r;i
  v ← ⍎¨'-' Split r
  ⍝ Because of the performance...
  sum ← 0
  i ← v[1]
  REPEAT:
    →(RepeatedFn i)↓COMP
      sum ← sum + i 
      COMP:
        i ← i + 1
        →(i≤v[2]) / REPEAT
∇

input ← ',' Split ⍞
⍝ Part 1
+/ CompareTwoParts SumRepeatedNumbers¨input
⍝ Part 2
+/ HasRepeatedDigits SumRepeatedNumbers¨input

)OFF
