defmodule Axion.StrengthTraining.Schemas.Set do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sets" do
    field :date, :date
    field :exercise, :string
    field :reps, :integer
    field :weight, :integer
    belongs_to :workout, Axion.StrengthTraining.Schemas.Workout

    timestamps()
  end

  @doc false
  def changeset(set, attrs) do
    set
    |> cast(attrs, [:date, :exercise, :reps, :weight])
    |> validate_required([:date, :exercise, :reps, :weight])
    |> foreign_key_constraint(:workout_id)
  end
end
