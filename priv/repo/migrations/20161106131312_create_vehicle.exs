defmodule Cargo.Repo.Migrations.CreateVehicle do
  use Ecto.Migration

  def change do
    create table(:vehicle) do
      add :driver_name, :string
      add :truck_name, :string
      add :base_location, :string
      add :current_location, :string
      add :reg_no, :string
    end
  end
end
