#---
# Excerpted from "Programming Elixir 1.2",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir12 for more book information.
#---
defmodule WordCounter do

  def run(scheduler) do
    send scheduler, { :ready, self() }
    receive do
      { :calc, filename, client } ->
        send client, { :answer, filename, wordcount(filename), self() }
        run(scheduler)
      { :shutdown } ->
        exit(:normal)
    end
  end

  defp wordcount(filename) do
    string = File.read! filename
    Regex.scan(~r{def}, string) |> length # TODO cat直打ちやめて
  end
end

defmodule Scheduler do

  def run(num_processes, module, func, to_calculate) do
    (1..num_processes)
    |> Enum.map(fn(_) -> spawn(module, func, [self()]) end)
    |> schedule_processes(to_calculate, 0)
  end

  defp schedule_processes(processes, queue, results) do
    receive do 
      {:ready, pid} when queue != [] ->
        [ next | tail ] = queue
        send pid, {:calc, next, self()}
        schedule_processes(processes, tail, results)

      {:ready, pid} ->
        send pid, {:shutdown}
        if length(processes) > 1 do
          schedule_processes(List.delete(processes, pid), queue, results)
        else
          #Enum.sort(results, fn {n1,_}, {n2,_}  -> n1 <= n2 end)
          results
        end

      {:answer, _number, result, _pid} ->
        schedule_processes(processes, queue,  result + results)
    end
  end
end

to_process = File.ls!

Enum.each 1..10, fn num_processes ->
  {time, result} = :timer.tc(
    Scheduler, :run,
    [num_processes, WordCounter, :run, to_process]
  )

  if num_processes == 1 do
    IO.puts inspect result
    IO.puts "\n #   time (s)"
  end
  :io.format "~2B     ~.2f~n", [num_processes, time/1000000.0]
end


# Windows logファイルで試した結果　200ファイル、200MBぐらい。
#319
#
# #   time (s)
# 1     3.84
# 2     1.11
# 3     0.91
# 4     0.89
# 5     0.80
# 6     0.78
# 7     0.67
# 8     0.84
# 9     0.84
# 10     0.75
