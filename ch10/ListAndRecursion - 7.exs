require Integer

defmodule MyList do
    def span(from,to) when from <= to do
        [from|span(from+1,to)]
    end
    def span(_,_) do
        []
    end

    def get_prime_list_eratosthenes(n) do
        list =  MyList.span(2,n)
        for x <- MyList.span(2,celling(sqrt(n))) do
            list = for y <- list, rem(y,x) != 0, do: y
        end
        list
    end


    def get_prime_list(n) do
        # list =  ?
        for x <- MyList.span(2,n), _is_prime(x), do: x
    end

    # 2のとき。
    defp _is_prime(x) when x <= 2 do
        true
    end

    # 単純なダメケースはこっちに要れる
    defp _is_prime(x) when Integer.is_even(x) do
        false
    end

    defp _is_prime(x) when x > 2 do
        # 3 から floor(x/2) で割れなければOK
        list = for y <- MyList.span(,floor(x/2)), rem(x,y) == 0, do: false 
        # falseが1個でもあれば false
        # listが空なら素数なのでtrue
        #if length(list) == 0 do
        #    true
        #else
        #    false
        #end
    end

end

#IO.inspect MyList.span(1000,1005)
[2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]

IO.inspect MyList.get_prime_list2(100)
