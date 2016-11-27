defmodule Cargo.Repo.Migrations.UpdateVehicles do
  use Ecto.Migration

  def change do
    alter table(:vehicles) do
        add :scheduled_trips, :integer
    end
  end
end
