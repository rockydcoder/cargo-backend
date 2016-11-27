defmodule Cargo.Repo.Migrations.UpdateTrips do
  use Ecto.Migration

  def change do
    alter table(:trips) do
        add :vehicle_name, :string
        add :price_changed, :float
    end
  end
end
