#!/usr/bin/env bqn
NumDigits‿Dividers‿AllEqual‿Partition‿While‿DoWhile‿If ← •Import "../base_structures/utils.bqn"


CompareTwoParts ← {
  half_decimal ← 10⋆(⌊(NumDigits 𝕩)÷2)
  first_part ← half_decimal|𝕩
  second_part ← ⌊𝕩÷half_decimal
  first_part=second_part
}

HasRepeatedDigits ← {
  n ← 𝕩
  num_digits ← NumDigits n
  return ← 0

  If (num_digits>1)‿{𝕤
    v_dividers ← Dividers num_digits

    # Because of the performance too...
    i ← 0
    DoWhile ⟨{𝕤⋄i<≠v_dividers}, {𝕤⋄i+↩1}{𝔾∘𝔽}{𝕤
      divider ← (i-1)⊑v_dividers
      num_parts ← num_digits ÷ divider
      parts ← {(10⋆divider)|⌊n÷10⋆(divider×𝕩)}¨↕num_parts
 
      If (AllEqual parts)‿{𝕤
        return ↩ 1
      }
    }⟩
  }
  return
}

SumRepeatedNumbers ← {
  v ← •ParseFloat¨'-' Partition 𝕩
  # Because of the performance...
  fn ← 𝕨
  sum←0
  i←⊑v-1
  While ⟨{𝕤⋄i≤1⊑v}, {𝕤⋄i+↩1}{𝔾∘𝔽}{𝕤
    If (Fn i)‿{𝕤
      sum +↩ i
    }
  }⟩
  sum
}

input ← ⊑•FLines"input"
input ↩ ',' Partition input

# Part 1
•Show +´{comparetwoparts SumRepeatedNumbers 𝕩}¨input
# Part 2
•Show +´{hasrepeateddigits SumRepeatedNumbers 𝕩}¨input
