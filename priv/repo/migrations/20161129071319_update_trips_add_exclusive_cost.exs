defmodule Cargo.Repo.Migrations.UpdateTripsAddExclusiveCost do
  use Ecto.Migration

  def change do
    alter table(:trips) do
      add :exclusive_cost, :string
    end
  end
end
