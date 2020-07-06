defmodule Stack.Server do
  use GenServer                      

  #####
  # External API  
  def start_link(init_list) do
    GenServer.start_link(__MODULE__, init_list, name: __MODULE__)
  end

  def pop do
    GenServer.call(__MODULE__,:pop)
  end

  def push(new_item) do
    GenServer.cast(__MODULE__,{:push,new_item})
  end

  def init_stack(init_list) do
    GenServer.call(__MODULE__,{:init_stack,init_list})
  end
  #####
  # GenServer implementation

  def init(init_arg) do
    {:ok, init_arg}
  end

  # pop データを取り出す
  def handle_call(:pop, _from, [head|tail]) do
    { :reply, head, tail }
  end

  # pop データを取り出す,空の時失敗
  def handle_call(:pop, _from, []) do
    #terminate("waaaaaaaaaaaa",[])
    System.halt(:abort)
    #IO.inspect "alive!"
    #{ :reply, [], [] }
  end
  
  # 初期化
  def handle_call({:init_stack, list}, _from, _current_number) do
    { :reply, list, list }
  end

  # データを入れる
  def handle_cast({:push,new_item}, list) do        
    { :noreply, [new_item|list] }
  end

  # 異常終了のとき呼ばれる
  # System.halt(n)はnが正なら、どんなnでも正常終了扱いとなり、terminateは呼ばれない
    # nの代わりに:abortでも正常終了してくれる。terminateは呼ばれない
  # 直接呼んだときはterminateの内容がただ実行されるだけ、プロセスはしなない
  def terminate(reason,state) do
    IO.inspect "-----------reason-----------"
    IO.inspect reason
    IO.inspect "-----------state-----------"
    IO.inspect state
  end
end

IO.inspect Stack.Server.start_link([5,"cat",9])
IO.inspect Stack.Server.pop()
IO.inspect Stack.Server.pop()
IO.inspect Stack.Server.pop()
IO.inspect Stack.Server.pop()
