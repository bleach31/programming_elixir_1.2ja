defmodule MyEnum do

    def all?([head|tail], func) do
        if func.(head) == false do
            false
        else
            all?(tail,func)
        end
    end    
    def all?([], _func), do: true
################################################
    def each([head|tail],func) do
        func.(head)
        each(tail,func)
    end
    def each([], _func), do: :ok
################################################
    def filter(list,func), do: _filter(list,func,[])
    defp _filter([head|tail],func,result) do
        if func.(head) do
            _filter(tail,func,[head|result])
        else
            _filter(tail,func,result)
        end
    end
    defp _filter([],_func,result), do: Enum.reverse(result)
################################################
    def split(list,num) when num >= 0 do
        _split(list,num,[])
    end

    def split(list,num) when num < 0 do
        _split(list,max(0,length(list) + num),[])
    end

    defp _split([head|tail],num,prev)  when num > 0 do
        _split(tail,num-1,[head|prev])
    end

    defp _split(list,0,prev), do: {Enum.reverse(prev),list}
    
    defp _split([],_num,prev), do: {Enum.reverse(prev),[]}

end

list = Enum.to_list 1..5
#IO.inspect MyEnum.all?(list, &(&1 < 6))
#IO.inspect MyEnum.each(["one", "two", "three"], fn(s) -> IO.puts(s) end)

#require Integer
#IO.inspect MyEnum.filter(list, &Integer.is_even/1)

IO.inspect MyEnum.split(list, 3)
IO.inspect MyEnum.split(list, 0)
IO.inspect MyEnum.split(list, 7)
IO.inspect MyEnum.split(list, -10)



