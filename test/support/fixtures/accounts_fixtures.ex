defmodule ComponentExercise.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ComponentExercise.Accounts` context.
  """

  @doc """
  Generate a vendor.
  """
  def vendor_fixture(attrs \\ %{}) do
    {:ok, vendor} =
      attrs
      |> Enum.into(%{
        category: "some category",
        location: "some location",
        name: "some name"
      })
      |> ComponentExercise.Accounts.create_vendor()

    vendor
  end
end
