
defmodule MyString do
#一番長い文字を見つけて、rjust,ljustでパディングする
#奇数の時どうするか？どっちか多くするしかない
    def center(strlist) do
        max = Enum.max_by(strlist, &(String.length(&1))) |> String.length
        _print(strlist,max)   
    end

    defp _print([],_) do
    end

    defp _print([h|t],width) do
        count = (width - String.length(h))/2 + String.length(h)|> trunc
        String.pad_leading(h, count) |> IO.inspect
        _print(t,width)        
    end    

end


MyString.center(["cat", "zebra", "elephant"])