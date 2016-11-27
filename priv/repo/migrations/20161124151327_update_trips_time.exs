defmodule Cargo.Repo.Migrations.UpdateTripsTime do
  use Ecto.Migration

  def change do
      alter table(:trips) do
          modify :start_date, :datetime
          modify :end_date, :datetime
      end
  end
end
