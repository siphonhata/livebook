defmodule Stats.CentralTendency.Mean do

  alias Stats.{Errors, Validators}


  def population_mean([]), do: Errors.invalid_data_type()

  def population_mean when is_list(nums) do
    nums
    |> Validators.validate_num_list()
    |> calc_population_mean()
  end

h

  def calc_population_mean({false, _}), do: Errors.invalid_data_type()
  def calc_population_mean({true, nums}) do
    nums
    |> Enum.sum()
    |> mean(Enum.count(nums))
  end

  def mean(sigma, count), do: sigma / count
end
