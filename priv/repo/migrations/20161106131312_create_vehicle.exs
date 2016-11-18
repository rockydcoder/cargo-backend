defmodule Cargo.Repo.Migrations.CreateVehicle do
  use Ecto.Migration

  def change do
    create table(:vehicles, primary_key: false) do
      add :driver_name, :string
      add :truck_name, :string
      add :base_location, :string
      add :current_location, :string
      add :reg_no, :string, primary_key: true
    end
  end
end
