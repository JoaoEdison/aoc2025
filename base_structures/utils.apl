#!/usr/bin/env apl --script

⍝ Written by João Manica.


⍝ ⍺ separator element
⍝ ⍵ array
⍝ Returns array
Split ← {(∊(⍺≠⍵))⊂⍵}

⍝ ⍺ integer < ⍵
⍝ ⍵ integer
⍝ Returns array
Range ← {(⍺-1)+⍳⍵-⍺-1}

⍝ ⍵ array
⍝ Returns boolean
AllEqual ← {∧/⍵=↑⍵}


⍝ Mathematical functions:

⍝ ⍵ integer >= 0
⍝ Returns integer
NumDigits ← {1+⌊10⍟⍵}

⍝ n integer >= 1
⍝ Returns array
∇dividers← Dividers n;ion
  →(n>1)⍴GT1
  dividers ← ∊1
  →0
  GT1: 
  ion ← ⍳⌊n÷2
  dividers ← ion[⍸0={⍵|n}ion]
∇
