defmodule Gcd do
    def of(x,0), do: x
    def of(x,y), do: of(y,rem(x,y))
end

IO.puts Gcd.of(15,10)