defmodule MyOK do
    def ok!({:ok,data}) do
        data
    end
    def ok!({status,data}) do
#        raise {status,data}???

    end
end

defmodule ControlFlow do
  def ok!(param) do
    case param do
      {:ok, data} -> data
      true -> raise "#{param}"
    end
  end
end
