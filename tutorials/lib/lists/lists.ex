defmodule Tutorials.Lists do

    @moduledoc """
    Function summary:
        1. sum
    """
    @doc """
        Returns the sum of numbers in a list.
    """

    @spec sum(list(number())) :: number()
    def sum(nums), do: sum_tail_rec(nums)

    @spec sum_simple(list(number())) :: number()
    def sum_simple([]), do: 0
    def sum_simple([h | t]) do
        h + sum_simple(t)
    end

    @spec sum_tail_rec(list(number()), integer()) :: number()
    def sum_tail_rec(nums, acc \\ 0)
    def sum_tail_rec([], acc), do: acc
    def sum_tail_rec([h | t], acc), do: sum_tail_rec(t, acc + h)


    # Reverse list

    @spec reverse(list(any), [any()]) :: [any()] #Specification of how the function look like
    def reverse(elements, acc \\ [])
    def reverse([], acc), do: acc
    def reverse([h | t], acc) do
        reverse(t, [h | acc])
    end


    # MAP

    @spec map([any()], (any() -> any()), [any()]) :: [any()]
    def map(element, func, acc \\ [] )
    def map([], _, acc), do: acc |> reverse()
    def map([h | t], func, acc), do: map(t, func, [func.(h) | acc])

    
end