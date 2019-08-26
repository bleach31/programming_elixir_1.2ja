
:io.format("The number is ~.2f~n", [5111.67])

IO.puts System.get_env("OS")

IO.puts Path.extname("dave/test.exs")

IO.puts System.cwd()
#IO.puts File.cwd()

#IO.puts System.cmd("echo", ["hello"])
#IO.puts System.cmd "echo", ["hello"]
IO.puts System.cmd("date")
