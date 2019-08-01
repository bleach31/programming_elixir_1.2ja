defmodule Chop do
    def guess(actual,min..max) when actual > min and actual < max do
        est = div(min+max,2)
        IO.puts "Is it #{est}?"
        guess(actual,est..max)
        guess(actual,min..est)
    end
    
    def guess(actual,_..max) when actual == max do
        IO.puts max
    end

    def guess(_,_)  do
    end
end

Chop.guess(273, 1..1000)