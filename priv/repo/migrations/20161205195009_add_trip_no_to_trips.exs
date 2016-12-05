defmodule Cargo.Repo.Migrations.AddTripNoToTrips do
  use Ecto.Migration

  def change do
    alter table(:trips) do
       add :trip_no, :integer
    end
  end
end
