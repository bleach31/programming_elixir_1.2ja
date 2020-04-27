defmodule Link1 do
  import :timer, only: [ sleep: 1 ]

  def sad_function(parent) do
    send parent, "yahho-"
    #sleep 500
    exit(:boom) #異常終了になっちゃう
  end
  
  def run do
    spawn_link(Link1, :sad_function, [self()])
    
    sleep 500

    receive do
      msg -> 
        IO.puts "MESSAGE RECEIVED: #{inspect msg}"
    after 1000 ->
        IO.puts "Nothing happened as far as I am concerned"
    end
  end
end

Link1.run