#---
# Excerpted from "Programming Elixir 1.2",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir12 for more book information.
#---
defmodule Parallel do
  def pmap(collection, fun) do
    me = self()
    collection
    |> Enum.map(fn (elem) ->
         spawn_link fn -> (send me, { self(), fun.(elem) }) end
       end)     # pidのlistになる　[101, 105, 102]
    |> Enum.map(fn (pid) -> #  
         receive do { ^pid, result } -> result end
       end) # 結果のリスト
  end
end