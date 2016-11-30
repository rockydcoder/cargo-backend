defmodule Cargo.Repo.Migrations.UpdateTripsAddExclusiveCostType do
  use Ecto.Migration

  def change do
    alter table(:trips) do
      remove :exclusive_cost
    end
  end
end
