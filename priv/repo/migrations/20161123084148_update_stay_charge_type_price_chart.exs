defmodule Cargo.Repo.Migrations.UpdateStayChargeTypePriceChart do
  use Ecto.Migration

  def change do
    alter table(:price_chart) do
        modify :stay_charge_per_day, :float
    end
  end
end
