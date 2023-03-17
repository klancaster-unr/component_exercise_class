defmodule ComponentExercise.Repo.Migrations.CreateVendors do
  use Ecto.Migration

  def change do
    create table(:vendors) do
      add :name, :string
      add :location, :string
      add :category, :string

      timestamps()
    end
  end
end
