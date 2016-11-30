defmodule Cargo.Repo.Migrations.UpdateTripsAddExclusiveCostFloat do
  use Ecto.Migration

  def change do
    alter table(:trips) do
      add :exclusive_cost, :float
    end
  end
end
