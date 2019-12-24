require Integer

defmodule MyList do
    def span(from,to) when from <= to do
        [from|span(from+1,to)]
    end
    def span(_,_) do
        []
    end


    def primes_up_to(n) do
        range = MyList.span(2, n)
        range -- (for a <- range, b <- range, a <= b, a*b <= n, do: a*b)
    end


    def get_prime_list_eratosthenes(n) do
#        search_list =  MyList.span(2,n) 
#        prime_candidates = MyList.span(2,ceil(:math.sqrt(n))) 
#
#        prime_list = []
#        for prime <- prime_candidates, Enum.member?(search_list, prime), prime_list = [prime|prime_list] do
#            search_list = for y <- search_list ,rem(y,prime) != 0, do: y # primeで割り切れる数を消す = primeで割り切れない数を残す
#        end
#        [prime_list|search_list]
#
#        prime_list = []
#        
#        for prime <- prime_candidates, Enum.member?(search_list, prime) do
#            prime_list = [prime|prime_list]
#            search_list = for y <- search_list ,rem(y,prime) != 0, do: y # primeで割り切れる数を消す = primeで割り切れない数を残す
#            
#            IO.inspect prime_list
#            IO.inspect search_list
#        end
#        [prime_list|search_list]

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
        list = for y <- MyList.span(3,floor(x/2)), rem(x,y) == 0, do: false 
        # falseが1個でもあれば false 
        # listが空なら素数なのでtrue
        if length(list) == 0 do
            true
        else
            false
        end
    end

end

#IO.inspect MyList.span(1000,1005)
IO.inspect MyList.get_prime_list(10000)
#[2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
#IO.inspect MyList.get_prime_list_eratosthenes(100)
IO.inspect MyList.primes_up_to(10000)

