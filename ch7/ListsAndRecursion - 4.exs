defmodule MyList do
    def span(from,to) when from <= to do
        [from|span(from+1,to)]
    end
    def span(_,_) do
        []
    end
end
IO.inspect MyList.span(1000,1005)

#defmodule MyList do
#    def span(from,to) do
#        _span([from],to)
#    end
#    defp _span(list = [head,_], to) when head < to do 
#        _span([head+1 |list], to)
#    end
#    defp _span(list = [head,_], to) when head >= to do
#        list
#    end
#end
