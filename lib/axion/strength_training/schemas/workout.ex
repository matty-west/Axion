defmodule Axion.StrengthTraining.Schemas.Workout do
  use Ecto.Schema
  import Ecto.Changeset

  schema "workouts" do
    has_many :sets, Axion.StrengthTraining.Schemas.Set

    timestamps()
  end

  @doc false
  def changeset(workout, attrs) do
    workout
    |> cast(attrs, [])
    |> validate_required([])
  end
end
