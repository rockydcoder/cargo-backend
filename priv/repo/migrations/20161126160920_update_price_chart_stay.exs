defmodule Cargo.Repo.Migrations.UpdatePriceChartStay do
  use Ecto.Migration

  def change do
    rename table(:price_chart), :stay_charge_per_day, to: :stay_charge_per_hour
  end
end
