defmodule Tutorials.Structs.Expense do
  alias Tutorials.Structs.Expense

  defstruct(
    title: "",
    date: nil,
    amount: 0,
    store: ""
  )

  @type t :: %Expense{
    title: String.t(),
    date: Date.t() | nil,
    amount: number(),
    store: String.t()
  }

  @spec sample :: [t()]
  def sample do
    [
      %Expense{title: "Grocery", date: ~D[2022-09-12], amount: 18.99, store: "Metro"},
      %Expense{title: "Mobile", date: ~D[2022-10-18], amount: 55.75, store: "Bell"},
      %Expense{title: "Jacket", date: ~D[2022-07-06], amount: 150.99, store: "Marks"},
      %Expense{title: "Air Jordans", date: ~D[2022-10-30], amount: 799.99 , store: "Nike"},
    ]
  end

  @spec total_amount([t()]) :: number()
  def total_amount(expense) do
    expense
    |> Enum.reduce(0, fn expense, acc -> expense.amount + acc end)
  end

  @spec sort_by_date([t()]) :: [t()]
  def sort_by_date(expense) do
    expense
    |> Enum.sort_by(& &1.date)
  end

  @spec add_expense(t) :: [t()]
  def add_expense(%Expense{} = expense) do
    [expense | sample()]
  end


  def update_amount(title, amount) do
    [item] = Enum.filter(sample(), fn %{title: expense_title} -> expense_title == title end)
    new_item = %{item | amount: amount}
    [new_item | sample() |> List.delete(item)]
  end
end
