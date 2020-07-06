defmodule Stack.Server do
  use GenServer                      

  def init(init_arg) do
    {:ok, init_arg}
  end

  # pop データを取り出す
  def handle_call(:pop, _from, [head|tail]) do
    { :reply, head, tail }
  end

  # pop データを取り出す,空の時失敗
  def handle_call(:pop, _from, []) do
    { :reply, [], [] }
  end

  # データを入れる
  def handle_cast({:push,new_item}, list) do        
    { :noreply, [new_item|list] }
  end
  
  # 初期化
  def handle_call({:init_stack, list}, _from, _current_number) do
    { :reply, list, list }
  end

end

{:ok, pid } = GenServer.start_link(Stack.Server, [5,"cat",9] )
IO.puts GenServer.call(pid,:pop)
IO.puts GenServer.call(pid,:pop)
IO.puts GenServer.call(pid,:pop)
IO.puts GenServer.call(pid,{:init_stack,["x","y","z"]})
IO.puts GenServer.call(pid,{:init_stack,[40,41,42]})
IO.puts GenServer.call(pid,:pop)
IO.puts GenServer.cast(pid,{:push,"a"})
IO.puts GenServer.cast(pid,{:push,"b"})
IO.puts GenServer.call(pid,:pop)
IO.puts GenServer.call(pid,:pop)