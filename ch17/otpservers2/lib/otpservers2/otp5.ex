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

  def init(stash_pid) do
    current_list = Sequence.Stash.get_value(stash_pid)
    {:ok, {current_list,stash_pid}}
  end

  # pop データを取り出す
  def handle_call(:pop, _from, {[head|tail],stash_pid}) do
    { :reply, head, {tail,stash_pid} }
  end

  # pop データを取り出す,空の時失敗
  # def handle_call(:pop, _from, []) do
    #terminate("waaaaaaaaaaaa",[])
    #System.halt(:abort)
    #IO.inspect "alive!"
    #{ :reply, [], [] }
  # end
  
  # 初期化
  #def handle_call({:init_stack, list}, _from, _current_number) do
  #  { :reply, list, list }
  #end

  # データを入れる
  def handle_cast({:push,new_item}, {list,stash_pid}) do        
    { :noreply, {[new_item|list],stash_pid} }
  end

  # 異常終了のとき呼ばれる
  # System.halt(n)はnが正なら、どんなnでも正常終了扱いとなり、terminateは呼ばれない
    # nの代わりに:abortでも正常終了してくれる。terminateは呼ばれない
  # 直接呼んだときはterminateの内容がただ実行されるだけ、プロセスはしなない
  def terminate(_reason,{list,stash_pid}) do
    #　動作確認のためdeadをいれて保存する
    Sequence.Stash.save_value stash_pid, ["dead" | list]
  end
end

# IO.inspect Stack.Server.start_link([5,"cat",9])
# IO.inspect Stack.Server.pop()
# IO.inspect Stack.Server.pop()
# IO.inspect Stack.Server.pop()
# IO.inspect Stack.Server.pop()
