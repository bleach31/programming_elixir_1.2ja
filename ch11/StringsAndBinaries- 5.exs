
defmodule MyString do
#一番長い文字を見つけて、rjust,ljustでパディングする
#奇数の時どうするか？どっちか多くするしかない
    def center(list) do
        max = _center([h|t],0)
        _print([h|t],max)
    end
    defp _center([h|t],max) do
        if max > len h
            max = h
        end
        _center(t,max)
    end

    defp _center([],max) do
        max
    end
    defp _print([h|t],max) do
        a = String.rjust(h,max-len h/2)
        b = String.ljust(a,max-len h/2)
        
        print(b)
    end    

end

MyString.center(["cat", "zebra", "elephant"])