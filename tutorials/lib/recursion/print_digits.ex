defmodule Tutorials.Recursion.PrintDigits do
    def upto(0) do
       :ok # return
    end

    def upto(nums) do
        IO.puts(nums)
        upto(nums - 1)
    end
end