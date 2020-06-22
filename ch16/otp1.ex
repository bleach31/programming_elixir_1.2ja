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
  def handle_call({:push,new_item}, _from, list) do        
    { :reply, [new_item|list], [new_item|list] }
  end
  
  # 初期化
  def handle_call({:init_stack, list}, _from, _current_number) do
    { :reply, list, list }
  end

end

{:ok, pid } = GenServer.start_link(Stack.Server,[5,"cat",9])
GenServer.call(pid,:pop)
GenServer.call(pid,:pop)
GenServer.call(pid,:pop)
GenServer.call(pid,{:init_stack,[1,2,3]})
GenServer.call(pid,:pop)
GenServer.call(pid,{:push,"a"})
GenServer.call(pid,{:push,"b"})
GenServer.call(pid,:pop)
GenServer.call(pid,:pop)