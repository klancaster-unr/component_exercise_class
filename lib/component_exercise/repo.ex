defmodule ComponentExercise.Repo do
  use Ecto.Repo,
    otp_app: :component_exercise,
    adapter: Ecto.Adapters.Postgres
end
