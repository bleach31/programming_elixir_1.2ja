

defmodule MyPerser do
    def isAscii([]) do
        true
    end

    def isAscii([h|t])
        when h > 0x20 and h < 0x7e do #0x20 スペース  から 0x7e チルダ まで
            isAscii(t)
    end
    def isAscii([_h|_t]) do
        false
    end
end

defmodule MyString do
    def printable_ascii([]), do: false
    def printable_ascii(sqs), do: Enum.all?(sqs, fn ch -> ch in ? ..?~ end)
end

IO.inspect MyString.printable_ascii('abc') # true
IO.inspect MyString.printable_ascii('あいう')  # false
IO.inspect MyString.printable_ascii('')  # false?true?