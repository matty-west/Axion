defmodule AxionWeb.SetController do
  use AxionWeb, :controller

  alias Axion.StrengthTraining
  alias Axion.StrengthTraining.Set

  def index(conn, _params) do
    sets = StrengthTraining.list_sets()
    render(conn, "index.html", sets: sets)
  end

  def create(conn, %{"set" => set_params}) do
    case StrengthTraining.create_set(set_params) do
      {:ok, _set} ->
        conn
        |> put_flash(:info, "Set created successfully.")
        |> redirect(to: Routes.set_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "index.html", sets: StrengthTraining.list_sets(), changeset: changeset)
    end
  end
end
