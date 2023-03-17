defmodule ComponentExercise.Accounts.Vendor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "vendors" do
    field :category, :string
    field :location, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(vendor, attrs) do
    vendor
    |> cast(attrs, [:name, :location, :category])
    |> validate_required([:name, :location, :category])
  end
end
