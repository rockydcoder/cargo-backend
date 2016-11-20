defmodule Cargo.Repo.Migrations.CreateTrips do
  use Ecto.Migration

  def change do
    create table(:trips) do
      add :start_date, :date
      add :end_date, :date
      add :start_place, :string
      add :end_place, :string
      add :vehicle_reg_no, references(:vehicles, column: :reg_no, type: :string)
      add :status, :string
      add :incurred_cost, :float
      add :round_trip_cost, :float
    end

  end
end
