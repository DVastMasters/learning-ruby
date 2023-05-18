# A-Z = 65-90
# a-z = 97-122

# First version (fail 5 tests)
=begin
def translate(string, factor)
  encrypted = string.chars.map do |c| 
    next c unless c.match?(/[a-zA-Z]/) 
    
    new_ord = (c.ord + factor) 

    if (65..90).include?(c.ord) then
      next (new_ord - 26).chr if new_ord > 90    
    else
      next (new_ord - 26).chr if new_ord > 122
    end

    (new_ord).chr
  end  

  encrypted.join
end
=end

# Second version (pass all tests)
def translate(string, factor)
  encrypted = string.chars.map do |c| 
    next c unless c.match?(/[a-zA-Z]/) 
    
    new_ord = (c.ord + (factor.remainder(26))) 

    if (65..90).include?(c.ord) then
      next (new_ord - 26).chr if new_ord > 90    
      next (new_ord + 26).chr if new_ord < 65
    else
      next (new_ord - 26).chr if new_ord > 122  
      next (new_ord + 26).chr if new_ord < 97
    end

    (new_ord).chr
  end  

  encrypted.join
end

message = "In cryptography, a Caesar cipher, also known as Caesar’s cipher, " + 
          "the shift cipher, Caesar’s code or Caesar shift, is one of the " +
          "simplest and most widely known encryption techniques. It is a " +
          "type of substitution cipher in which each letter in the plaintext " + 
          "is replaced by a letter some fixed number of positions down the " +
          "alphabet. For example, with a left shift of 3, D would be replaced " +
          "by A, E would become B, and so on. The method is named after " +
          "Julius Caesar, who used it in his private correspondence. "

puts translate(message, -64987)
=begin
Va pelcgbtencul, n Pnrfne pvcure, nyfb xabja nf Pnrfne’f pvcure, gur fuvsg pvcure, 
Pnrfne’f pbqr be Pnrfne fuvsg, vf bar bs gur fvzcyrfg naq zbfg jvqryl xabja 
rapelcgvba grpuavdhrf. Vg vf n glcr bs fhofgvghgvba pvcure va juvpu rnpu yrggre 
va gur cynvagrkg vf ercynprq ol n yrggre fbzr svkrq ahzore bs cbfvgvbaf qbja gur 
nycunorg. Sbe rknzcyr, jvgu n yrsg fuvsg bs 3, Q jbhyq or ercynprq ol N, R jbhyq 
orpbzr O, naq fb ba. Gur zrgubq vf anzrq nsgre Whyvhf Pnrfne, jub hfrq vg va uvf 
cevingr pbeerfcbaqrapr.
=end