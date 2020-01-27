

defmodule MyString do
    def anagram?(word1, word2) do
        # ソートして比較
        Enum.sort(word1) == Enum.sort(word2)        
    end
end



IO.inspect MyString.anagram?('abc','cba') # true
IO.inspect MyString.anagram?('abc','cbb') # false