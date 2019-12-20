defmodule Countdown do
    def sleep(seconds) do
        receive do
            after seconds*1000 -> nil
        end
    end

    def say(text) do
        spawn fn -> :os.cmd('say #{text}') end
    end

    def timer do
        Stream.resource(
            fn -> # 次の分が始まるまでの秒数
                {_h,_m,s} = :erlang.time
                60 - s - 1
            end,

            fn # 次の行を待ち、カウントダウンを返す
                0 ->
                    {:halt, 0}
                count ->
                    sleep(1)
                    { [inspect(count)], count - 1 }
            end,

            fn _ -> end # nothing to deallocate
        )
    end
end

counter = Countdown.timer

printer = counter |> Stream.each(&IO.puts/1) |> Enum.take(5)

speaker = printer |> Stream.each(&Countdown.say/1)