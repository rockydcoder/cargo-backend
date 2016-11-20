defmodule Cargo.Repo.Migrations.CreatePriceChart do
  use Ecto.Migration

  def change do
    create table(:price_chart, primary_key: false) do
      add :vehicle_name, :string, primary_key: true
      add :vehicle_type, :string
      add :length, :float
      add :breadth, :float
      add :height, :float
      add :price_per_km, :float
      add :stay_charge_per_day, :integer
      add :capacity, :float
    end

  end
end
