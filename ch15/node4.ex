#---
# Excerpted from "Programming Elixir 1.2",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir12 for more book information.
#---
defmodule Client do
  @interval 2000   # 2 seconds
  
  def start do
    IO.puts "My name is #{inspect self()}"
    # startを引く
    case :global.whereis_name(:last) do
      :undefined -> # 未登録（最初の一人）
        :global.register_name(:last, self()) 
        send self(), {:tick}
        receiver(self())

      _ -> # 登録済み
        # lastが指すプロセスにregistメッセージを投げる
        last = :global.whereis_name(:last) 
        IO.puts "last is #{inspect last}"

        send last, {:regist,self()}
        
        # グローバルの:lastを自分自身にする
        :global.re_register_name(:last, self()) 

        IO.puts "new last is #{inspect :global.whereis_name(:last)}"
        # 自分のnextを変数lastが指すプロセスにして、待ちを開始
        receiver(last)        
    end
  end

  def receiver(next) do
    receive do
      { :tick } -> #
        IO.puts "tock in client #{inspect self()}" # 自分の名前をだす
        
        :timer.sleep(@interval)
        send next, { :tick } 
        receiver(next)
      { :regist, new_next } ->  # 新規登録
        # 自分のnextをnew_nextにする
        receiver(new_next)
    end
  end
end