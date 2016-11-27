defmodule Cargo.Repo.Migrations.RenameVehiclesTruckName do
  use Ecto.Migration

  def change do
    rename table(:vehicles), :truck_name, to: :vehicle_name
  end
end
